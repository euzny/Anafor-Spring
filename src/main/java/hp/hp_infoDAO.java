package hp;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import user.UserChoiceVO;

@Repository
public class hp_infoDAO {
	@Autowired @Qualifier("ateam") SqlSession sql;
	
	//병원 상세 정보 조회(카카오맵)
	public Hp_infoVO detailmap(HashMap<String, String> hashmap) {
		return sql.selectOne("hp.mapper.detailmap", hashmap);
	}
	
	//병원 상세 정보 조회(단순)
	public Hp_infoVO detailhp(String code) {
		return sql.selectOne("hp.mapper.detailhp", code);
	}
	
	//병원 상세 정보 찜한 여부 확인
	public UserChoiceVO checkHeart(HashMap<String, String> check) {
		return sql.selectOne("hp.mapper.checkheart",check);
	}
	//찜한 병원 insert
	public void insertHeart(HashMap<String, String> check) {
		 sql.insert("hp.mapper.insertheart",check);
	}
	
	//찜한 병원 update
	public void updatetHeart(HashMap<String, String> check) {
			 sql.update("hp.mapper.updateheart",check);
	}
	
	//찜한 병원 delete
	public void deleteHeart(HashMap<String, String> check) {
			 sql.delete("hp.mapper.deleteheart",check);
	}
	
	//찜한 병원 전체 조회
	public List<UserChoiceVO> selectHeart(String user_id) {
		return sql.selectList("hp.mapper.selectheart",user_id);
	}
}
