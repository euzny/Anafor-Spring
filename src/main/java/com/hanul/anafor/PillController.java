package com.hanul.anafor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException.Gone;

import com.google.gson.Gson;

import pill.PillDAO;
import pill.PillVO;
import schedule.ScheduleVO;
import user.UserVO;

@Controller
public class PillController {

	Gson gson = new Gson();
	@Autowired
	PillDAO dao;
	@Autowired
	@Qualifier("ateam")
	SqlSession sql;
	
	
	//처방전 삭제하기
	@ResponseBody
	@RequestMapping(value = "/pill_delete", produces = "application/json;charset=UTF-8")
	public String delete(HttpServletRequest req) {

		System.out.println(req.getParameter("dto"));
		PillVO vo = gson.fromJson(req.getParameter("dto"), PillVO.class);
		
		sql.delete("pill.mapper.delete", vo);

		return gson.toJson(vo);
	}
	
	//처방전 db에 저장하기
	@ResponseBody
	@RequestMapping(value = "/pill", produces = "application/json;charset=UTF-8")
	public String insert(HttpServletRequest req) {
		System.out.println(req.getParameter("pill"));
		PillVO vo = gson.fromJson(req.getParameter("pill"), PillVO.class);

		// sql.insert("pill.mapper.insert", vo);
		dao.insert(vo);

		return "";
	}
	//처방전 조회하기
	@ResponseBody
	@RequestMapping(value = "/select", produces = "application/json;charset=UTF-8")
	public String select(HttpServletRequest req) {

		String user_id = req.getParameter("user_id");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		List<PillVO> list = sql.selectList("pill.mapper.select", map);


		System.out.println(gson.toJson(list));
		
		return gson.toJson(list);
	}

}
