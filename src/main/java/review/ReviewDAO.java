package review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	
	@Autowired @Qualifier("ateam") SqlSession sql;
	
	//리뷰 등록
	public void insertReview(ReviewVO vo) {
		sql.insert("review.mapper.insert",vo);
	}
	
	//리뷰 조회(해당병원 조회)
	public List<ReviewVO> selectAllReview(String code) {
		return sql.selectList("review.mapper.selectAll",code);
	}
	
	//해당 병원 리뷰 
	public ReviewTotalVO totalReview(String code) {
		return sql.selectOne("review.mapper.selectTotal",code);
	}

	//리뷰 조회(해당 회원 조회)
	public List<ReviewVO> selectMyReview(String user_id) {
		return sql.selectList("review.mapper.selectMy",user_id);
	}
	//리뷰 수정
	public void updateReview(ReviewVO vo) {
		sql.update("review.mapper.update",vo);
	}

	//리뷰 삭제
	public void deleteReview(int rev_num) {
		sql.delete("review.mapper.delete",rev_num);
	}	
}
