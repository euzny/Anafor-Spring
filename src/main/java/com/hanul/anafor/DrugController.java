package com.hanul.anafor;

import java.sql.Clob;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import common.CommonService;
import drug.DrugVO;
import pill.PillDAO;
import pill.PillVO;

@Controller
public class DrugController {

	
	@Autowired
	private CommonService common;
	
	Gson gson = new Gson();
	@Autowired
	@Qualifier("ateam")
	private SqlSession sql;

	// api 키값
	private String serviceKey = "8webo47a2JOvabAucuP3Bb23Tf8FxCKFxwYumcU%2Fe4N4g2ZyvD2AlGXb6eRev3xbWpua0iT3lYXBTnpVeNlVtw%3D%3D";

	
	
	
	
	
	//처방전 조회하기
		@ResponseBody
		@RequestMapping(value = "/drug", produces = "application/json;charset=UTF-8")
		public String select(HttpServletRequest req) {
			PillVO vo = new PillVO();
			vo.setPill_code1(Integer.parseInt(req.getParameter("drug1")));
			vo.setPill_code2(Integer.parseInt(req.getParameter("drug2")));
			vo.setPill_code3(Integer.parseInt(req.getParameter("drug3")));
			
			System.out.println(req.getParameter("drug3"));
			
			List<DrugVO> list = sql.selectList("drug.mapper.select", vo);

			System.out.println(gson.toJson(list));
			
			return gson.toJson(list);
			
			
		}
	
	
	
	// 약 정보 데이터베이스에 insert
	@RequestMapping("/drug_insert")
	public String drug_insert() {

		for (int i = 1; i <= 45; i++) {

			StringBuffer url = new StringBuffer(
					"http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=");
			url.append(serviceKey);
			url.append("&pageNo=").append(i);
			url.append("&numOfRows=").append("100");
			url.append("&type=json");
			System.out.println(url.toString());
			JSONArray map = common.json_requestAPI(url);

			DrugVO vo = new DrugVO();

			// json 형식으로 들어온 파일을 잘라서 vo에 담기
			for (int j = 0; j < map.length(); j++) {
				JSONObject json = (JSONObject) map.get(j);

				vo.setDrug_cp(json.getString("entpName"));
				vo.setDrug_name(json.getString("itemName"));
				vo.setDrug_code(json.getString("itemSeq"));

				Object efcyQesitm = json.get("efcyQesitm");
				vo.setDrug_efcy(efcyQesitm == null ? "" : efcyQesitm.toString());

				Object useMethodQesitm = json.get("useMethodQesitm");
				vo.setDrug_use(useMethodQesitm == null ? "" : useMethodQesitm.toString());

				Object atpnWarnQesitm = json.get("atpnWarnQesitm");
				vo.setDrug_atpn(atpnWarnQesitm == null ? "" : atpnWarnQesitm.toString());

				Object seQesitm = json.get("seQesitm");
				vo.setDrug_se(seQesitm == null ? "" : seQesitm.toString());

				Object itemImage = json.get("itemImage");
				vo.setDrug_img(itemImage == null ? "" : itemImage.toString());

				sql.insert("pill.mapper.data_insert", vo);
			}
		}
		return "redirect:/";
	}

}