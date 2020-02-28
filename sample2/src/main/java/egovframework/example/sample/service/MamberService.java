package egovframework.example.sample.service;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface MamberService {
	public void insert(MamberVO mamberVO) throws Exception;
	public void insert2(MamberVO2 mamberVO2) throws Exception;
	public List<MamberVO> list(SearchCriteria scri) throws Exception;
	MamberVO selectOne(int id) throws Exception;
	public void delete2(int id) throws Exception;
	public void delete1(int id) throws Exception;
	public void store(MamberVO mamberVO) throws Exception;
	public void update(MamberVO mamberVO) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	List<MamberVO> selectRow(SearchCriteria scri) throws Exception;
	public void excelUpload(File destFile) throws Exception;
	public void excelinsert(MamberVO2 mamberVO2) throws Exception;


}
