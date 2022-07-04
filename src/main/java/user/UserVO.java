package user;

public class UserVO {
    private String user_id, user_pw, user_name, user_birth, user_gender, user_tel, user_kakao, user_naver, admin, 
    				social_type, social_id, memo, join_date;
    private int brCnt, qCnt,no,box_id;  //br:구매평, q:q&A
      
    
	public int getBox_id() {
		return box_id;
	}

	public void setBox_id(int box_id) {
		this.box_id = box_id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public int getBrCnt() {
		return brCnt;
	}

	public void setBrCnt(int brCnt) {
		this.brCnt = brCnt;
	}

	public int getqCnt() {
		return qCnt;
	}

	public void setqCnt(int qCnt) {
		this.qCnt = qCnt;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getSocial_id() {
		return social_id;
	}

	public void setSocial_id(String social_id) {
		this.social_id = social_id;
	}

	public String getSocial_type() {
		return social_type;
	}

	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_kakao() {
		return user_kakao;
	}

	public void setUser_kakao(String user_kakao) {
		this.user_kakao = user_kakao;
	}

	public String getUser_naver() {
		return user_naver;
	}

	public void setUser_naver(String user_naver) {
		this.user_naver = user_naver;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

    
}
