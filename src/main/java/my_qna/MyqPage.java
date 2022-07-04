package my_qna;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class MyqPage extends PageVO {

	private List<MyqVO> list;

	public List<MyqVO> getList() {
		return list;
	}

	public void setList(List<MyqVO> list) {
		this.list = list;
	}

	
}
