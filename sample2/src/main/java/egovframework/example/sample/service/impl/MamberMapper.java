package egovframework.example.sample.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import egovframework.example.sample.service.MamberVO;
import egovframework.example.sample.service.MamberVO2;
import egovframework.example.sample.service.SearchCriteria;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MamberMapper {
	public void insert(MamberVO mamberVO) throws Exception;
	public void insert2(MamberVO2 mamberVO2) throws Exception;
	public List<MamberVO> list(SearchCriteria scri) throws Exception;
	MamberVO selectOne(int id) throws Exception;
	public void delete2(int id) throws Exception;
	public void delete1(int id) throws Exception;
	public void store(MamberVO mamberVO) throws Exception;
	public void update(MamberVO mamverVO) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public List<MamberVO> selectRow(SearchCriteria scri) throws Exception;
	public void excelUpload(File destFile) throws Exception;
	public void insertExcel(Map<String, Object> paramMap);
	public void excelinsert(MamberVO2 mamberVO2) throws Exception;


}
