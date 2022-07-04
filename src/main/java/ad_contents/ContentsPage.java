package ad_contents;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class ContentsPage extends PageVO {

	private List<ContentsVO> list;

	private List<CodeVO> code_list;

	public List<ContentsVO> getList() {
		return list;
	}

	public void setList(List<ContentsVO> list) {
		this.list = list;
	}

	public List<CodeVO> getCode_list() {
		return code_list;
	}

	public void setCode_list(List<CodeVO> code_list) {
		this.code_list = code_list;
	}
}
