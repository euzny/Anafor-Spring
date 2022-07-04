package my_review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import web_shop.WReviewVO;

@Repository
public class my_reviewDAO implements my_reviewService {

	@Autowired @Qualifier ("ateam") SqlSession sql;
	
	@Override
	public void review_insert(WReviewVO vo) {
		// TODO Auto-generated method stub
		sql.insert("my_review.mapper.insert", vo);
	}

	@Override
	public void review_update(WReviewVO vo) {
		sql.update("my_review.mapper.update", vo);
	}

	@Override
	public void review_delete(int id) {
		sql.delete("my_review.mapper.delete" , id);
	}

	@Override
	public MyReviewPage review_list(MyReviewPage page) {
		int pagecnt = sql.selectOne("my_review.mapper.totalList", page);
		page.setTotalList(pagecnt);
		
		List<WReviewVO> list = sql.selectList("my_review.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public WReviewVO review_detail(int id) {
		return sql.selectOne("my_review.mapper.detail", id);
	}

}
