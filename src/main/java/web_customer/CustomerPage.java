package web_customer;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class CustomerPage extends PageVO{
	// 10건의 공지사항을 담을 필드를 선언
	// 공지사항을 담을 Page에 대한 정보를 가진 PageVO를 
	// extends를 통해 page 관련 기능을 모두 상속받아 처리	
	
	private List<CustomerVO> list;

	public List<CustomerVO> getList() {
		return list;
	}

	public void setList(List<CustomerVO> list) {
		this.list = list;
	}		
}
