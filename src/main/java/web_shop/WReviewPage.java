package web_shop;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class WReviewPage extends PageVO {

	private List<WReviewVO> list;

	public List<WReviewVO> getList() {
		return list;
	}

	public void setList(List<WReviewVO> list) {
		this.list = list;
	}
	
	
	
	
}
