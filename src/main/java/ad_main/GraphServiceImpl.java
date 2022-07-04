package ad_main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import user.UserVO;
import web_customer.CustomerVO;
import web_shop.ShopDetailVO;

@Service
public class GraphServiceImpl implements GraphService {
	
	@Autowired GraphDAO dao;

	@Override
	public List<graphVO> search(HashMap<String, String> map) {
		
		return dao.search(map);
	}

	@Override
	public List<graphVO> search2(HashMap<String, String> map) {
		
		return dao.search2(map);
	}

	@Override
	public List<ShopDetailVO> sorder(String date) {
	
		return dao.sorder(date);
	}

	@Override
	public List<CustomerVO> inquiry(String date) {
		
		return dao.inquiry(date);
	}

	@Override
	public List<UserVO> newuser(String date) {
		
		return dao.newuser(date);
	}

	@Override
	public graphVO searchGen() {
		
		return dao.searchGen();
	}

	@Override
	public graphVO searchAge() {
		
		return dao.searchAge();
	}

}
