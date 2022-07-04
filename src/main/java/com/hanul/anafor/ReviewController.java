package com.hanul.anafor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import review.ReviewDAO;
import review.ReviewVO;

@Controller
public class ReviewController {

	Gson gson = new Gson();
	
	@Autowired ReviewDAO dao;
	
	//병원별 전체 리뷰 수, 별점 등 조회
	@ResponseBody
	@RequestMapping(value="/total.review",produces="application/json;charset=UTF-8")
	public String totalReview(HttpServletRequest req) {
		return gson.toJson(dao.totalReview(req.getParameter("code")));
	}
	//리뷰 등록
	@ResponseBody
	@RequestMapping(value="/insert.review", produces = "application/json;charset=UTF-8")
	public String insertReview(HttpServletRequest req) {
		ReviewVO vo = gson.fromJson(req.getParameter("vo"), ReviewVO.class );
		dao.insertReview(vo);
		return "";
	}
	//병원별 리뷰 조회
	@ResponseBody
	@RequestMapping(value="/selectAll.review",produces="application/json;chartset=UTF-8")
	public String selectAllReview(HttpServletRequest req) {
		return gson.toJson(dao.selectAllReview(req.getParameter("code")));
	}
	//해당 회원 리뷰 조회
	@ResponseBody
	@RequestMapping(value="/selectMy.review",produces="application/json;chartset=UTF-8")
	public String selectMyReview(HttpServletRequest req) {
		return gson.toJson(dao.selectMyReview(req.getParameter("user_id")));
	}
	//해당 회원 리뷰 수정
	@ResponseBody
	@RequestMapping(value="/update.review", produces = "application/json;charset=UTF-8")
	public String updateReview(HttpServletRequest req) {
		ReviewVO vo = gson.fromJson(req.getParameter("vo"), ReviewVO.class );
		dao.updateReview(vo);
		return "";
	}
	//해당 회원 리뷰 삭제
	@ResponseBody
	@RequestMapping(value="/delete.review", produces = "application/json;charset=UTF-8")
	public String deleteReview(HttpServletRequest req) {
		int rev_num = Integer.parseInt(req.getParameter("rev_num"));
		dao.deleteReview(rev_num);
		return "";
	}
	

}
