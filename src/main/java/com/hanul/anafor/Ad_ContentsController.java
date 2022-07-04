package com.hanul.anafor;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ad_contents.ContentsPage;
import ad_contents.ContentsServiceImpl;
import ad_contents.ContentsVO;
import common.CommonService;
import user.UserVO;
import web_user.WuserServiceImpl;

@Controller
public class Ad_ContentsController {

	@Autowired private ContentsServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private ContentsPage page;
	@Autowired private WuserServiceImpl user;
	@Autowired @Qualifier ("ateam") SqlSession sql;
	
	
	   /* 게시판 전체 글 목록조회 */
	   @RequestMapping ("/list.co")
	   public String list(HttpSession session, Model model,      
	                  @RequestParam (defaultValue = "1") int curPage, 
	                  @RequestParam(defaultValue = "10") int pageList,                  
	                  String search, String keyword, String code, 
	                  @RequestParam (defaultValue = "all") String sort, 
	                  @RequestParam (defaultValue = "all") String reply) {
	      
	      session.setAttribute("category", "co");

	      // curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
	      page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
	      // 검색조건, 검색어 정보를 담음
	      page.setSearch(search);   
	      page.setKeyword(keyword);
	      page.setPageList(pageList);   // 페이지당 보여질 글 목록 수
	      page.setCode(code);
	      page.setSort(sort);
	      page.setReply(reply);

	      model.addAttribute("codes",service.code());
	      
	      if(code == null || code.equals("all")) {
		      model.addAttribute("page",service.con_list(page));    	  
	      }else if(code.equals("N03")){
	    	  model.addAttribute("page",service.con_list3(page));		  
	      }else {
	    	  model.addAttribute("page",service.con_list2(page));
	      }    
	      return "admin_contents/list";
	   }

	
	/* 글 상세 조회 */
	@RequestMapping ("/detail.co")
	public String detail(int id, Model model) {
		service.con_read(id);
		model.addAttribute("vo", service.con_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		return "admin_contents/detail";
	}
	
	/*수정 화면 요청*/
	@RequestMapping ("/modify.co")
	public String modify(int id, Model model) {
		// 해당 공지글 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.con_detail(id));
		return "admin_contents/modify";
	}
	
	/* 수정 등록 */
	@RequestMapping("/update.co")
	public String update(ContentsVO vo, String attach
			,MultipartFile file, HttpSession session) {
		
		//원래 글의 첨부파일 정보를 조회한다(id를 통해)
		ContentsVO contents = service.con_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") 
				+ "/" + contents.getFilepath();
		
		//파일 첨부한 경우
		if(! file.isEmpty()) {
			
			//원래 첨부파일이 없었는데 수정시 첨부한 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("contents", file, session));
			
			//원래 첨부파일 있었고 수정시 바꿔서 첨부한경우 - 원래 파일을 물리적 영역에서 삭제
			if(contents.getFilename()!=null) {
				File f= new File(uuid);
				if(f.exists()) f.delete();
			}
		}else {
			
			//원래 첨부하지않았고 수정시에도 첨부하지 않은경우
			//원래 첨부된 파일이 있었는데 삭제한 경우 - 원래의 파일을 물리적 영역에서 삭제
			if ( attach.isEmpty() ) {
				if (contents.getFilename() != null) {
					File f = new File(uuid);
					if (f.exists())  f.delete();
				}
			} else {
			// 2. 원래 첨부된 파일을 그대로 사용하는 경우	
				vo.setFilename(contents.getFilename());
				vo.setFilepath(contents.getFilepath());
			}
		}
		
		//화면에서 변경한 정보를 db에 저장한후 상세화면으로 이동
		service.con_update(vo);	
		return "redirect:detail.co?id=" + vo.getId();
	}
	
	/* 글삭제 */
	@RequestMapping("/delete.co")
	public String delete(int id, int root, HttpSession session, Model model,
				        @RequestParam (defaultValue = "1") int curPage, 
				        @RequestParam (defaultValue = "10") int pageList,                  
				        String search, String keyword, String code, 
				        @RequestParam (defaultValue = "all") String sort, 
				        @RequestParam (defaultValue = "all") String reply) {

		ContentsVO contents = service.con_detail(id);
		String uuid = session.getServletContext().getRealPath("resources")+"/"+contents.getFilepath();
		
		if(contents.getFilename() != null) {
			File file = new File(uuid);
			if(file.exists()) file.delete();
		}
		
		// curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
		page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
		// 검색조건, 검색어 정보를 담음
		page.setSearch(search);   
		page.setKeyword(keyword);
		page.setPageList(pageList);   // 페이지당 보여질 글 목록 수
		page.setCode(code);
		page.setSort(sort);
		page.setReply(reply);

		
		model.addAttribute("url", "list.co");
		model.addAttribute("page", page);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("root", root);
		
		service.con_delete(map);
		return "admin_contents/redirect";
	}
	
	/* 답글 작성화면 요청 */
	@RequestMapping ("/reply.co")
	public String reply(int id, Model model) {
		// 원글의 상세 정보를 DB에서 조회해와 답글 화면에 출력
		model.addAttribute("vo", service.con_detail(id));
		return "admin_contents/reply";
	}


	
   /* 답글 저장처리 요청 */
   @RequestMapping ("/reply_insert.co")
   public String reply_insert(ContentsVO vo, MultipartFile file, HttpSession session, Model model,
           @RequestParam (defaultValue = "1") int curPage, 
           @RequestParam(defaultValue = "10") int pageList,                  
           String search, String keyword, String code, 
           @RequestParam (defaultValue = "all") String sort, 
           @RequestParam (defaultValue = "all") String reply) {
      // 첨부 파일이 있을 경우
      if ( ! file.isEmpty()) {
         vo.setFilename(file.getOriginalFilename());
         vo.setFilepath( common.fileUpload("contents", file, session) );
      }
      
      // 로그인 된 사용자의 id를 가져와 글쓴이(writer) 에 담기 위한 처리
      vo.setWriter( ((UserVO)session.getAttribute("loginInfo")).getUser_id() );
      service.con_reply_insert(vo);
      page.setReply("all");
      model.addAttribute("url", "list.co");   
      model.addAttribute("page", page);
      
      return "admin_contents/redirect";
   }
	
	/* 입력(글쓰기) 화면 요청 */ 
	@RequestMapping ("/new.co")
	public String contents() {
		return "admin_contents/new";
	}
	
	/* 글 등록*/
	@RequestMapping ("/insert.co")
	public String insert(ContentsVO vo, MultipartFile file, HttpSession session, Model model,
					    @RequestParam (defaultValue = "1") int curPage, 
					    @RequestParam(defaultValue = "10") int pageList,                  
					    String search, String keyword, String code, 
					    @RequestParam (defaultValue = "all") String sort, 
					    @RequestParam (defaultValue = "all") String reply) {
		// 로그인된 사용자의 id를 가져와 글쓴이(writer)에 담기 위한 처리	
		UserVO user = (UserVO) session.getAttribute("loginInfo");
		vo.setWriter(user.getUser_id());
 		
		// 파일이 있는 경우 
 		if ( ! file.isEmpty() ) {
 			// 파일 첨부 처리(filename, filepath)
 			vo.setFilename( file.getOriginalFilename()); // 전달받은 파일의 실제 이름을 vo에 할당
 			vo.setFilepath(common.fileUpload("contents", file, session));	//
 		}
		
		// 화면에서 입력한 정보를 DB에 저장한 후 화면으로 연결
		service.con_insert(vo);
		
	    model.addAttribute("url", "list.co");   
	    model.addAttribute("page", page);
	    
	    return "admin_contents/redirect";	// 리턴시 공지사항 목록 조회 화면으로 이동 처리
	}
		
	/*첨부 파일 다운로드 요청*/
	@RequestMapping ("/download.co")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		// 해당 공지글의 첨부파일 정보를 DB에서 조회해와 
		// 해당 파일을 서버로부터 다운로드 한다.
		ContentsVO contents = service.con_detail(id);
		common.fileDownload(contents.getFilename(), contents.getFilepath(), session, response);		
	}
	
}
