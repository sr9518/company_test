package egovframework.example.sample.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.BookVO;

@Controller
public class BookController {
	@Autowired
	private BookController service;
	
	@RequestMapping("/bwrite.do")
	public String bwrite() {
		
		return "/sample/bwrite";
	}
	@RequestMapping("/bwrite_ok.do")
	
	public String bwrite_ok(BookVO bookVO) {
		return "redirect:/blist";
	}
	@RequestMapping("/blist.do")
	public String blist() {
		return "/sample/blist";
	}
	
}
