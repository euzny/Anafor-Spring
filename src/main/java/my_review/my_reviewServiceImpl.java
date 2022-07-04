package my_review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_shop.WReviewVO;

@Service
public class my_reviewServiceImpl implements my_reviewService {

	@Autowired my_reviewDAO dao;
	
	@Override
	public void review_insert(WReviewVO vo) {
		dao.review_insert(vo);
	}

	@Override
	public void review_update(WReviewVO vo) {
		dao.review_update(vo);
	}

	@Override
	public void review_delete(int id) {
		dao.review_delete(id);
	}

	@Override
	public MyReviewPage review_list(MyReviewPage page) {
		return dao.review_list(page);
	}

	@Override
	public WReviewVO review_detail(int id) {
		return dao.review_detail(id);
	}

}
