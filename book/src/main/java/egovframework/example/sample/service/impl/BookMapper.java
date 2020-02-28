package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.BookVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BookMapper {
	public void insert(BookVO bookVO) throws Exception;
}
