package egovframework.example.sample.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MamberService;
import egovframework.example.sample.service.MamberVO;
import egovframework.example.sample.service.MamberVO2;
import egovframework.example.sample.service.SearchCriteria;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MamberServiceImpl extends EgovAbstractServiceImpl implements MamberService{
	@Autowired
	MamberMapper mapper;
	
	@Override
	public void insert(MamberVO mamberVO) throws Exception {
		mapper.insert(mamberVO);
	}
	@Override
	public List<MamberVO> list(SearchCriteria scri) throws Exception {
		return mapper.list(scri);
	}
	@Override
	public MamberVO selectOne(int id) throws Exception {
		return mapper.selectOne(id);
	}
	@Override
	public void insert2(MamberVO2 mamberVO2) throws Exception {
		mapper.insert2(mamberVO2);
	}
	@Override
	public void delete2(int id) throws Exception {
		mapper.delete2(id);
	}
	@Override
	public void delete1(int id) throws Exception {
		mapper.delete1(id);
	}
	@Override
	public void store(MamberVO mamberVO) throws Exception {
		mapper.store(mamberVO);
	}
	@Override
	public void update(MamberVO mamberVO) throws Exception {
		mapper.update(mamberVO);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return mapper.listCount(scri);
	}
	@Override
	public List<MamberVO> selectRow(SearchCriteria scri) throws Exception {
		
	    return mapper.selectRow(scri);
	  }
	@Override
	public void excelinsert(MamberVO2 mamberVO2) throws Exception {
		mapper.excelinsert(mamberVO2);
	}
	  @Override
	  public void excelUpload(File destFile) {

	    ExcelReadOption excelReadOption = new ExcelReadOption();

//			파일경로 추가
	        excelReadOption.setFilePath(destFile.getAbsolutePath());
//	      추출할 컬럼 명 추가
	        excelReadOption.setOutputColumns("A","B","C","D");
	        // 시작 행
	        excelReadOption.setStartRow(2);
	        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);

	        Map<String, Object> paramMap = new HashMap<String, Object>();
	        paramMap.put("excelContent", excelContent);

	        try {
	       log.debug("fdfsdfsfsfd");
	      mapper.insertExcel(paramMap);
	    } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	  }

	

}
