package egovframework.example.sample.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BookService;
import egovframework.example.sample.service.BookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class BookServiceImpl extends EgovAbstractServiceImpl implements BookService{
	@Autowired
	BookMapper mapper;
	
	@Override
	public void insert(BookVO bookVO) throws Exception{
		mapper.insert(bookVO);
	}
}
