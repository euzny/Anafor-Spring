package com.hanul.anafor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import hp.Hp_infoVO;
import hp.hp_infoDAO;



@Controller
public class HpController {
	
	@Autowired hp_infoDAO dao;

	Gson gson = new Gson();
	//카카오맵 지도에서 DB 조회
	@ResponseBody
	@RequestMapping(value="/detail.map" , produces = "application/json;charset=UTF-8")
	public String hpMapDetailSearch(HttpServletRequest req) {
		Hp_infoVO vo = new Hp_infoVO();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("place_name",req.getParameter("place_name"));
		hashmap.put("phone", req.getParameter("phone"));
		System.out.println(hashmap.get("place_name"));
		System.out.println(hashmap.get("phone"));
		vo =dao.detailmap(hashmap);
		System.out.println(gson.toJson(vo));
		return gson.toJson(vo);
	}
}
