package kr.co.test4.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.test4.dao.MemberDAO;
import kr.co.test4.dto.MemberVO;
import kr.co.test4.dto.WriteVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
    private MemberDAO dao;
    
	@Override
    public List<MemberVO> selectMember() throws Exception {
 
        return dao.selectMember();
    }
    @Override
    public void insertMember(WriteVO writeVO) throws Exception {
    	dao.insertMember(writeVO);
    }
    @Override
    public List<WriteVO> selectInfo(String searchOption, String keyword) throws Exception{
    	return dao.selectInfo(searchOption, keyword);
    }
    @Override
    public int countArticle(String searchOption, String keyword) throws Exception{
    	return dao.countArticle(searchOption, keyword);
    }
    @Override
    public void deleteInfo(WriteVO writeVO) throws Exception {
    	dao.deleteInfo(writeVO);
    }
    @Override
    public WriteVO info_update(int id) throws Exception {
    	return dao.info_update(id);
    }
    @Override
    public int update_ok(WriteVO writeVO) throws Exception {
    	return dao.update_ok(writeVO);
    }
}
