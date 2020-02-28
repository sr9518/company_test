package kr.co.project.dao;

import java.util.List;
import java.util.Map;

import kr.co.project.model.MemberInfoVO;
import kr.co.project.model.MemberVO;
import kr.co.project.page.Criteria;
import kr.co.project.page.PageMaker;

public interface MemberDAO {
	
	public List<MemberVO> selectMember() throws Exception;
	public void insertMember(MemberInfoVO memberinfoVO) throws Exception;
	public List<MemberInfoVO> listAll(int pageStart,int perPageNum,String usertype, String bong, String bun, String search, String text) throws Exception;
	public MemberInfoVO update(int id) throws Exception;
	public void update_ok(MemberInfoVO memberinfoVO) throws Exception;
	MemberInfoVO selectOne(int id) throws Exception;
	public int countBoardList(String usertype, String bong, String bun, String search, String text) throws Exception;
}
