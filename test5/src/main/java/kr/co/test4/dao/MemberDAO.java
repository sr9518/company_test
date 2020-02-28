package kr.co.test4.dao;

import java.util.List;

import kr.co.test4.dto.MemberVO;
import kr.co.test4.dto.WriteVO;

public interface MemberDAO {

	public List<MemberVO> selectMember() throws Exception;
	public void insertMember(WriteVO writeVO) throws Exception;
	public List<WriteVO> selectInfo(String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;
	public void deleteInfo(WriteVO writeVO) throws Exception;
	public WriteVO info_update(int id) throws Exception;
	public int update_ok(WriteVO writeVO) throws Exception;
}
