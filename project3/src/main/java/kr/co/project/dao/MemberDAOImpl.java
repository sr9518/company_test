package kr.co.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.project.model.MemberInfoVO;
import kr.co.project.model.MemberVO;
import kr.co.project.page.PageMaker;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "kr.co.project.mappers.memberMapper";

    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectMember");
    }
    @Override
    public void insertMember(MemberInfoVO memberinfoVO) throws Exception{
    	sqlSession.insert(Namespace+".insertMember",memberinfoVO);
    }
    @Override
    public List<MemberInfoVO> listAll(int pageStart,int perPageNum,String usertype, String bong, String bun, String search, String text) throws Exception {
    	Map<String,Object> map = new HashMap<String, Object>();
    	map.put("pageStart", pageStart);
    	map.put("perPageNum", perPageNum);
    	map.put("usertype", usertype);
    	map.put("bong", bong);
    	map.put("bun", bun);
    	map.put("search", search);
    	map.put("text", text);
    	return sqlSession.selectList(Namespace+".listAll",map);
    }
 
    @Override
    public MemberInfoVO update(int id) throws Exception {
    	return sqlSession.selectOne(Namespace+".update", id);
    }
    @Override
    public void update_ok(MemberInfoVO memberinfoVO) throws Exception {
    	sqlSession.update(Namespace+".update_ok",memberinfoVO);
    }
    @Override
    public MemberInfoVO selectOne(int id) throws Exception {
    	return sqlSession.selectOne(Namespace+".selectOne",id);
		
    }
    @Override
    public int countBoardList(String usertype, String bong, String bun, String search, String text) throws Exception{
    	Map<String,Object> map = new HashMap<String, Object>();
    	map.put("usertype", usertype);
    	map.put("bong", bong);
    	map.put("bun", bun);
    	map.put("search", search);
    	map.put("text", text);
    	return sqlSession.selectOne(Namespace+".countBoardList",map);
    }

}
