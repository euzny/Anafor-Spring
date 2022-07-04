package my_shop;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import web_shop.ShopDetailVO;

@Repository
public class my_ShopDAO implements my_ShopService {
	
	@Autowired @Qualifier("ateam") private SqlSession sql;

	public ShopDetailVO order_detail(int id) {
		// TODO Auto-generated method stub
		return sql.selectOne("my_shop.mapper.detail", id);
	}

	@Override
	public List<ShopDetailVO> order_list(String user_id) {
		// TODO Auto-generated method stub
		List<ShopDetailVO> list = sql.selectList("my_shop.mapper.list", user_id);
		return list;
	}

	@Override
	public void order_update(ShopDetailVO vo) {
		// TODO Auto-generated method stub
		sql.update("my_shop.mapper.update", vo);
	}
	
	@Override
	public ShopDetailVO order_cancel(int id) {
		// TODO Auto-generated method stub
		return sql.selectOne("my_shop.mapper.cancel", id);
	}
}
