package my_review;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;


@Component
public class MyReviewPage extends PageVO{

private List<web_shop.WReviewVO> list;
	

	public List<web_shop.WReviewVO> getList() {
		return list;
	}

	public void setList(List<web_shop.WReviewVO> list) {
		this.list = list;
	}
	
}
