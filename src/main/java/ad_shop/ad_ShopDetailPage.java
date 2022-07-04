package ad_shop;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class ad_ShopDetailPage extends PageVO {
	
	private List<web_shop.ShopDetailVO> list;

	public List<web_shop.ShopDetailVO> getList() {
		return list;
	}

	public void setList(List<web_shop.ShopDetailVO> list) {
		this.list = list;
	}

	

}
