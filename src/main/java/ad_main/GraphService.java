package ad_main;

import java.util.HashMap;
import java.util.List;

import user.UserVO;
import web_customer.CustomerVO;
import web_shop.ShopDetailVO;

public interface GraphService {
	
	List<graphVO> search(HashMap<String, String> map);
	List<graphVO> search2(HashMap<String, String> map);
	List<ShopDetailVO> sorder(String date);
	List<CustomerVO> inquiry(String date);
	List<UserVO> newuser(String date);
	graphVO searchGen();	//성별 통계
	graphVO searchAge();	//연령대 통계
}
