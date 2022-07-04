package com.hanul.anafor;

import java.io.File;
import java.util.HashMap;

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
import web_customer.CustomerServiceImpl;
import web_customer.CustomerVO;
import web_notice.NoticeVO;
import web_user.WuserServiceImpl;

@Controller
public class Web_CustomerController {

	@Autowired private CustomerServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private CustomerPage page;
	@Autowired private WuserServiceImpl user;
	
	
	/*페이징 처리된 Q&A 목록*/
	@RequestMapping ("/list.cu")
	   public String list(HttpSession session, Model model,      
               @RequestParam (defaultValue = "1") int curPage, 
               @RequestParam(defaultValue = "10") int pageList,                  
               String search, String keyword, String code, 
               @RequestParam (defaultValue = "all") String sort, 
               @RequestParam (defaultValue = "all") String reply) {
		
		session.setAttribute("category", "cu");
		
		// curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
		page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
		// 검색조건, 검색어 정보를 담음
		page.setSearch(search);	
		page.setKeyword(keyword);
	    page.setPageList(pageList);   // 페이지당 보여질 글 목록 수
	    page.setCode(code);
	    page.setSort(sort);
	    page.setReply(reply);
		
	    model.addAttribute("page",service.qna_list(page));
		   
	    return "customer/q_list";
	}
	
	/*Q&A 상세글 조회*/
	@RequestMapping ("/detail.cu")
	public String detail(int id, Model model) {
		service.qna_read(id);
		model.addAttribute("vo", service.qna_detail(id));
		model.addAttribute("crlf", "\r\n");	
		// 페이징 처리한 결과값을 model에 담아 보냄
		model.addAttribute("page", page);
		return "customer/q_detail";
	}
	
	/*Q&A 입력(글쓰기) 화면 요청*/ 
	@RequestMapping ("/new.cu")
	public String qna() {
		return "customer/q_new";
	}
	
	/*Q&A 글 등록*/
	@RequestMapping ("/insert.cu")
	public String insert(CustomerVO vo, MultipartFile file, HttpSession session) {
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
		service.qna_insert(vo);
		return "redirect:list.cu";	// 리턴시 공지사항 목록 조회 화면으로 이동 처리
	}
	
	/*Q&A 삭제*/
	@RequestMapping("/delete.cu")
	public String delete(int id, HttpSession session) {
		CustomerVO customer = service.qna_detail(id);
		String uuid = session.getServletContext().getRealPath("resources")+"/"+customer.getFilepath();
		
		if(customer.getFilename() != null) {
			File file = new File(uuid);
			if(file.exists()) file.delete();
		}
		
		service.qna_delete(id);
		return "redirect:list.cu";
	}
		
	/*Q&A 수정 화면 요청*/
	@RequestMapping ("/modify.cu")
	public String modify(int id, Model model) {
		// 해당 공지글 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		return "customer/q_modify";
	}
	
	/*Q&A 수정등록*/
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo, String attach
			,MultipartFile file, HttpSession session) {
	      
	      //원래 글의 첨부파일 정보를 조회한다(id를 통해)
	      CustomerVO customer = service.qna_detail(vo.getId());
	      String uuid = session.getServletContext().getRealPath("resources") 
	            + "/" + customer.getFilepath();
	      
	      //파일 첨부한 경우
	      if(! file.isEmpty()) {
	         
	         //원래 첨부파일이 없었는데 수정시 첨부한 경우
	         vo.setFilename(file.getOriginalFilename());
	         vo.setFilepath(common.fileUpload("customer", file, session));
	         
	         //원래 첨부파일 있었고 수정시 바꿔서 첨부한경우 - 원래 파일을 물리적 영역에서 삭제
	         if(customer.getFilename()!=null) {
	            File f= new File(uuid);
	            if(f.exists()) f.delete();
	         }
	      }else {
	         
	         //원래 첨부하지않았고 수정시에도 첨부하지 않은경우
	         //원래 첨부된 파일이 있었는데 삭제한 경우 - 원래의 파일을 물리적 영역에서 삭제
	         if ( attach.isEmpty() ) {
	            if (customer.getFilename() != null) {
	               File f = new File(uuid);
	               if (f.exists())  f.delete();
	            }
	         } else {
	         // 2. 원래 첨부된 파일을 그대로 사용하는 경우   
	            vo.setFilename(customer.getFilename());
	            vo.setFilepath(customer.getFilepath());
	         }
	      }
	      
	      //화면에서 변경한 정보를 db에 저장한후 상세화면으로 이동
	      service.qna_update(vo);   
	      return "redirect:detail.cu?id=" + vo.getId();
	   }

	/*Q&A 답글 작성화면 요청*/
	@RequestMapping ("/reply.cu")
	public String reply(int id, Model model) {
		// 원글의 상세 정보를 DB에서 조회해와 답글 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		return "customer/q_reply";
	}
	
	/*Q&A 답글 저장처리 요청*/
	@RequestMapping ("/reply_insert.cu")
	public String reply_insert(CustomerVO vo, MultipartFile file, HttpSession session) {
		// 첨부 파일이 있을 경우
		if ( ! file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath( common.fileUpload("customer", file, session) );
		}
		
		// 로그인 된 사용자의 id를 가져와 글쓴이(writer) 에 담기 위한 처리
		vo.setWriter( ((UserVO)session.getAttribute("loginInfo")).getUser_id() );
		service.qna_reply_insert(vo);
		return "redirect:list.cu";
	}
	
	
	/*첨부 파일 다운로드 요청*/
	@RequestMapping ("/download.cu")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		// 해당 공지글의 첨부파일 정보를 DB에서 조회해와 
		// 해당 파일을 서버로부터 다운로드 한다.
		CustomerVO customer = service.qna_detail(id);
		common.fileDownload(customer.getFilename(), customer.getFilepath(), session, response);		
	}
	
	
	/*FAQ*/
	
	/*페이징처리된 FAQ 목록*/
	@RequestMapping ("/f_list.cu")
	public String f_list(HttpSession session, Model model, 
			@RequestParam (defaultValue = "1") int curPage,
            @RequestParam(defaultValue = "5") int pageList,  
		  String search, String keyword) {
		
		session.setAttribute("category", "cu");
				
		// curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
		page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
		// 검색조건, 검색어 정보를 담음
		page.setSearch(search);	
		page.setKeyword(keyword);
	    page.setPageList(pageList);   // 페이지당 보여질 글 목록 수
		
		model.addAttribute("page",service.faq_list(page));
		return "customer/f_list";
	}
	
	/* 신규 FAQ 입력(글쓰기) 화면 요청*/
	@RequestMapping ("/f_new.cu")
	public String faq() {
		return "customer/f_new";
	}
	
	/* FAQ 글 등록*/
	@RequestMapping ("/f_insert.cu")
	public String f_insert(CustomerVO vo, MultipartFile file, HttpSession session) {
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
		service.faq_insert(vo);
		return "redirect:f_list.cu";	// 리턴시 공지사항 목록 조회 화면으로 이동 처리
	}
	
	/*FAQ 상세화면*/
	@RequestMapping ("/f_detail.cu")
	public String f_detail(int id, Model model) {
		service.faq_read(id);
		model.addAttribute("vo", service.faq_detail(id));
		model.addAttribute("crlf", "\r\n");	
		return "customer/f_detail";
	}
	

	/*FAQ 수정화면*/
	@RequestMapping ("/f_modify.cu")
	public String f_modify(int id, Model model) {
		// 해당 공지글 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.faq_detail(id));
		return "customer/f_modify";
	}

}
