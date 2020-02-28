package kr.co.test4.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.test4.dto.MemberVO;
import kr.co.test4.dto.WriteVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "kr.co.test4.mappers.memberMapper";
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectMember");
    }

	@Override
	public void insertMember(WriteVO writeVO) throws Exception {
		sqlSession.insert(Namespace+".insertMember",writeVO);
		
	}
	@Override
    public List<WriteVO> selectInfo(String searchOption, String keyword) throws Exception {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	return sqlSession.selectList(Namespace+".selectInfo", map);
    }
	@Override
    public int countArticle(String searchOption, String keyword) throws Exception {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	return sqlSession.selectOne(Namespace+".countArticle", map);
    }
    @Override
    public void deleteInfo(WriteVO writeVO) throws Exception{
    	sqlSession.delete(Namespace+".deleteInfo", writeVO);
    }
	@Override
	public WriteVO info_update(int id) throws Exception {
		return sqlSession.selectOne(Namespace+".info_update", id);
		
	}
	@Override
	public int update_ok(WriteVO writeVO) throws Exception{
		return sqlSession.update(Namespace+".update_ok",writeVO);
	}
}
