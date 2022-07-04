package com.hanul.anafor;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import user.UserVO;
import web_customer.CustomerPage;
import web_notice.NoticePage;
import web_notice.NoticeServiceImpl;
import web_notice.NoticeVO;
import web_user.WuserServiceImpl;

@Controller
public class Web_NoticeController {

	@Autowired private NoticeServiceImpl service;

	@Autowired private CommonService common;
	
	@Autowired private NoticePage page;
		
	@Autowired private WuserServiceImpl user;
	
	@RequestMapping ("/list.no")
	public String list(HttpSession session, @RequestParam (defaultValue = "1") 
	int curPage, Model model, String search, String keyword) {
	
		session.setAttribute("category", "no");
		
		// curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
		page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
		// 검색조건, 검색어 정보를 담음
		page.setSearch(search);		
		page.setKeyword(keyword);
		
		model.addAttribute("page",service.notice_list(page));
		return "notice/list";
	}
	
	@RequestMapping ("/new.no")
	public String notice() {
		return "notice/new";
	}
	
	@RequestMapping ("/insert.no")
	public String insert(NoticeVO vo, MultipartFile file, HttpSession session) {
		// 로그인된 사용자의 id를 가져와 글쓴이(writer)에 담기 위한 처리	
		UserVO user = (UserVO) session.getAttribute("loginInfo");
		vo.setWriter(user.getUser_id());
 		
		// 파일이 있는 경우 
 		if ( ! file.isEmpty() ) {
 			// 파일 첨부 처리(filename, filepath)
 			vo.setFilename( file.getOriginalFilename()); // 전달받은 파일의 실제 이름을 vo에 할당
 			vo.setFilepath(common.fileUpload("customer", file, session));	//
 		}
		
		// 화면에서 입력한 정보를 DB에 저장한 후 화면으로 연결
		service.notice_insert(vo);
		return "redirect:list.no";
	}

	@RequestMapping ("/detail.no")
	public String detail(int id, Model model) {
		service.notice_read(id);
		model.addAttribute("vo", service.notice_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		return "notice/detail";
	}
	
	// 공지글의 첨부 파일 다운로드 요청
	@RequestMapping ("/download.no")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		// 해당 공지글의 첨부파일 정보를 DB에서 조회해와 
		// 해당 파일을 서버로부터 다운로드 한다.
		NoticeVO notice = service.notice_detail(id);
		common.fileDownload(notice.getFilename(), notice.getFilepath(), session, response);		
	}
}
