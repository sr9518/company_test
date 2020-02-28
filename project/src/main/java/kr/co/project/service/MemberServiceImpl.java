package kr.co.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.project.dao.MemberDAO;
import kr.co.project.model.MemberInfoVO;
import kr.co.project.model.MemberVO;
import kr.co.project.page.PageMaker;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
    private MemberDAO dao;
	
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return dao.selectMember();
    }
    @Override
    public void insertMember(MemberInfoVO memberinfoVO) throws Exception{
    	dao.insertMember(memberinfoVO);
    }
	@Override
	public List<MemberInfoVO> listAll(int pageStart,int perPageNum,String usertype, String bong, String bun, String search, String text) throws Exception {
		return dao.listAll(pageStart,perPageNum,usertype,bong,bun,search, text);
	}
	@Override
	public MemberInfoVO update(int id) throws Exception {
		return dao.update(id);
	}
	@Override
	public void update_ok(MemberInfoVO memberinfoVO) throws Exception {
		dao.update_ok(memberinfoVO);
	}
	@Override
	public MemberInfoVO selectOne(int id) throws Exception {
		return dao.selectOne(id);
	}
	@Override
	public int countBoardListTotal(String usertype, String bong, String bun, String search, String text) throws Exception {
	    return dao.countBoardList(usertype,bong,bun,search,text);
	}

}








