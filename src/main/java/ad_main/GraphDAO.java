package ad_main;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import user.UserVO;
import web_customer.CustomerVO;
import web_shop.ShopDetailVO;

@Repository
public class GraphDAO implements GraphService {

	
	@Autowired @Qualifier("ateam") SqlSession sql;
	
	@Override
	public List<graphVO> search(HashMap<String, String> map) {
		
		return sql.selectList("ad_graph.mapper.select",map);
	}

	@Override
	public List<graphVO> search2(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("ad_graph.mapper.select2",map);
	}

	@Override
	public List<ShopDetailVO> sorder(String date) {
		// TODO Auto-generated method stub
		return sql.selectList("ad_graph.mapper.select3",date);
	}

	@Override
	public List<CustomerVO> inquiry(String date) {
		// TODO Auto-generated method stub
		return sql.selectList("ad_graph.mapper.select4",date);
	}

	@Override
	public List<UserVO> newuser(String date) {
		// TODO Auto-generated method stub
		return sql.selectList("ad_graph.mapper.select5",date);
	}

	@Override
	public graphVO searchGen() {
		
		return sql.selectOne("ad_graph.mapper.select6");
	}

	@Override
	public graphVO searchAge() {
		
		return sql.selectOne("ad_graph.mapper.select7");
	}	
}
