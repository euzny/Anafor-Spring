package com.hanul.anafor;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import user.UserChoiceVO;

@Controller
public class HpController {

	@Autowired hp_infoDAO dao;

	Gson gson = new Gson();
	
	//현재 날짜 출력
	Calendar now = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	// 카카오맵 지도에서 DB 조회
	@ResponseBody
	@RequestMapping(value = "/detail.map", produces = "application/json;charset=UTF-8")
	public String hpMapDetailSearch(HttpServletRequest req) {
		Hp_infoVO vo = new Hp_infoVO();
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("place_name", req.getParameter("place_name"));
		hashmap.put("phone", req.getParameter("phone"));
		vo = dao.detailmap(hashmap);
		System.out.println(gson.toJson(vo));
		return gson.toJson(vo);
	}
	
	
	//병원 디테일 조회
	@ResponseBody
	@RequestMapping(value = "/detail.hp", produces = "application/json;charset=UTF-8")
	public String hpDetailSearch(HttpServletRequest req) {
		Hp_infoVO vo = new Hp_infoVO();
		vo = dao.detailhp(req.getParameter("code"));
		System.out.println(gson.toJson(vo));
		return gson.toJson(vo);
	}
	
	
	//찜한적 있는지 조회(디테일)
	@ResponseBody
	@RequestMapping(value="/check.heart", produces = "application/json;charset=UTF-8")
	public boolean hpCheckHeart(HttpServletRequest req) {
		HashMap<String, String> check = new HashMap<String, String>();
		check.put("user_id", req.getParameter("user_id"));
		check.put("hp_code", req.getParameter("hp_code"));
		
		return  dao.checkHeart(check)!= null ? true : false;				//조회했을때 값이 있으면 1, 없으면 0 
	}
	
	//찜한 병원 insert(처음 눌렀을때)
	@ResponseBody
	@RequestMapping(value="/insert.heart", produces = "application/json;charset=UTF-8")
	public String hpInsertHeart(HttpServletRequest req) {
		HashMap<String, String> check = new HashMap<String, String>();
		check.put("user_id", req.getParameter("user_id"));
		check.put("hp_code", req.getParameter("hp_code"));
		check.put("ch_date", sdf.format(now.getTime()));
		dao.insertHeart(check);
		return "";
	}
	//찜한 병원 update (지웠다가 다시 눌렀을 때)
	@ResponseBody
	@RequestMapping(value="/update.heart", produces ="application/json;charset=UTF-8")
	public String hpUpdateHeart(HttpServletRequest req) {
		HashMap<String, String> check = new HashMap<String, String>();
		check.put("user_id", req.getParameter("user_id"));
		check.put("hp_code", req.getParameter("hp_code"));
		check.put("ch_date", sdf.format(now.getTime()));
		dao.updatetHeart(check);
		return "";
	}
	
	//찜한 병원 delete(눌렀다가 지운 경우)
	@ResponseBody
	@RequestMapping(value="/delete.heart", produces ="application/json;charset=UTF-8")
	public String hpDeleteHeart(HttpServletRequest req) {
		HashMap<String, String> check = new HashMap<String, String>();
		check.put("user_id", req.getParameter("user_id"));
		check.put("hp_code", req.getParameter("hp_code"));
		dao.deleteHeart(check);
		return "";
	}
	
	//찜한 병원 전체 조회 select
	@ResponseBody
	@RequestMapping(value="/select.heart",produces ="application/json;charset=UTF-8")
	public String hpSearchHeart(HttpServletRequest req){
		return gson.toJson(dao.selectHeart(req.getParameter("user_id")));
	}
}
