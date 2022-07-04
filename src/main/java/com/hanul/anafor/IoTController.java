package com.hanul.anafor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import IoT.GPSVO;
import IoT.IoTDAO;
import IoT.IoTVO;
import user.UserVO;



// 고객관리 페이지처리 @Controller 생성

// 클라이언트의 요청 → Controller → Service → DAO → mapper  (DB)
//					 ←			   ←		  ←	 ←		

@Controller
public class IoTController {
	
	@Autowired @Qualifier ("ateam") SqlSession sql;
	Gson gson = new Gson();
	@Autowired IoTDAO dao;

			//스프링에 지도 띄우기
			@RequestMapping("/iotmap")
			public String userMap(Model model,HttpSession session) {
				//우선 디비에 임의로 저장해놓은 데이터의 box_id와 user_id로 조회 (이 부분 추후 수정)
				GPSVO vo = new GPSVO();
				UserVO user = (UserVO) session.getAttribute("loginInfo");
				vo.setUser_id(user.getUser_id());
				List<GPSVO> list = sql.selectList("iotmap.mapper.webSelect",vo);
				if(list != null && list.size()!= 0) {
					model.addAttribute("list", new Gson().toJson(list));
					session.setAttribute("category", "loc");
					return "map/map";
				}else {
					session.setAttribute("category", "loc");
					return "my_info/notAccept";
				}
			}
			
			//GPS 위치 받기
			@ResponseBody
			@RequestMapping ("/arduSetIoT")
			public void arduSetIoT(HttpServletRequest req) {
				System.out.println("arduSetIoT() 들어옴");
				double lat = (Double.parseDouble(req.getParameter("latitude"))/1000000); 
				double lon = (Double.parseDouble(req.getParameter("longitude"))/1000000);
				GPSVO vo = new GPSVO();
				System.out.println(req.getParameter("equipment_id")); 
				int box_id = Integer.parseInt(req.getParameter("equipment_id"));
				String user_id = sql.selectOne("iotmap.mapper.findId",box_id);		//box_id와 일치하는 user_id 찾기
				vo.setUser_id(user_id);
				vo.setLatitude(lat);
				vo.setLongitude(lon);
				sql.insert("iotmap.mapper.insert",vo);
				System.out.println(lat+","+lon);
			}
			
			
			//안드로이드에 지도 띄우기
			@RequestMapping("/iotmobilemap")
			public String userMapMobile(Model model,HttpServletRequest req) {
				GPSVO vo = new GPSVO();
				vo.setUser_id(req.getParameter("user_id"));
				List<GPSVO> list = sql.selectList("iotmap.mapper.webSelect",vo);
				model.addAttribute("list", new Gson().toJson(list));
				return "map/mobilemap";
			}		
	
//============================================================================================
	  
	   /*아나포박스 알람 등록*/ 		
	   @ResponseBody
	   @RequestMapping(value="/iot_insert", produces = "application/json;charset=UTF-8")
	   public String insert(HttpServletRequest req) {
		  IoTVO vo = new IoTVO();
		  vo.setUser_id(req.getParameter("user_id"));
		  vo.setMemo(req.getParameter("memo"));
		  vo.setCase_num(req.getParameter("case_num")); 
		  vo.setCase_time(req.getParameter("case_time"));
		  sql.insert("IoT.mapper.iot_insert", vo);
	      return "";
	   }  
	
	   /*아나포박스 알람 목록 조회*/ 	
	   @ResponseBody
	   @RequestMapping(value="/iot_select", produces = "application/json;charset=UTF-8")
	   public String select(HttpServletRequest req) {	   
		  String user_id = req.getParameter("user_id"); 
		  List<IoTVO> list = sql.selectList("IoT.mapper.iot_select", user_id ); 
		  System.out.println(gson.toJson(list));
		  return gson.toJson(list);
	   }

	   /*아나포박스 알람 삭제*/
	   @ResponseBody
	   @RequestMapping(value="/iot_delete", produces = "application/json;charset=UTF-8")
	   public String delete(HttpServletRequest req) {
		String no = req.getParameter("no");   
		System.out.println(sql.delete("IoT.mapper.iot_delete", no));
		return "";
	  }
	
	   /*아나포박스 알람 수정*/
	   @ResponseBody
	   @RequestMapping(value="/iot_modify", produces = "application/json;charset=UTF-8")
	   public String modify(HttpServletRequest req) {
		  IoTVO vo = new IoTVO();
		  vo.setNo(Integer.parseInt(req.getParameter("no")));
		  vo.setMemo(req.getParameter("memo"));
		  vo.setCase_num(req.getParameter("case_num"));  
		  vo.setCase_time(req.getParameter("case_time"));
		  sql.update("IoT.mapper.iot_modify", vo);
	      return "";  
		}	
   
		/* 아나포박스 아이디 중복확인 */
		@ResponseBody
		@RequestMapping(value = "/box_id_chk", produces = "application/json;charset=UTF-8")
		public String box_id_check(HttpServletRequest req) {
			String box_id = req.getParameter("box_id");
			boolean i = dao.box_id_chk(box_id);
			System.out.println(gson.toJson(i));
			return gson.toJson(i);
			}
		
	   @ResponseBody
	   @RequestMapping(value="/box_id_insert", produces = "application/json;charset=UTF-8")
	   public String box_id_update(HttpServletRequest req) {
		  UserVO vo = new UserVO();
		  vo.setUser_id(req.getParameter("user_id"));
		  vo.setBox_id(Integer.parseInt(req.getParameter("box_id")));
		  sql.update("IoT.mapper.box_id_insert", vo);
	      return "";
	   }
	   
	   @ResponseBody
	   @RequestMapping(value="/iot_recode_select", produces = "application/json;charset=UTF-8")
	   public String recode_select(HttpServletRequest req) {	   
		  String user_id = req.getParameter("user_id"); 
		  List<IoTVO> list = sql.selectList("IoT.mapper.iot_recode_select", user_id ); 
		  System.out.println(gson.toJson(list));
		  return gson.toJson(list);
	   }	


		//복용 기록
		@ResponseBody
		@RequestMapping("/iot_recode")
		public void recde(Model model,HttpServletRequest req) {
			
			IoTVO vo = new IoTVO();
			
			vo.setUser_id(req.getParameter("user_id"));
			vo.setCase_num(req.getParameter("case_number"));
			
			
			sql.update("IoT.mapper.update", vo);
		}
		
	      
        /*아나포박스 미복용 case_num조회*/    
        @ResponseBody
        @RequestMapping(value="/iot_select_pill", produces = "application/json;charset=UTF-8")
        public String iot_select_pill(HttpServletRequest req) {      
          String user_id = req.getParameter("user_id"); 
          List<IoTVO> list = sql.selectList("IoT.mapper.iot_select_pill", user_id ); 
          System.out.println( "넘버확인"+ gson.toJson(list));
          return gson.toJson(list);
        }
	}




                         


