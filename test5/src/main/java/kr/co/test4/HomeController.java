package kr.co.test4;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.test4.dto.MemberVO;
import kr.co.test4.dto.WriteVO;
import kr.co.test4.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	 @Inject
	 private MemberService service;

	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		logger.info("home");
		
        List<MemberVO> memberList = service.selectMember();
        
        model.addAttribute("memberList", memberList);
	
		return "home";
	}
	@RequestMapping("/info")
	public String info() {
		
		return "/info";
	}
	
	
	@RequestMapping(value = "/info_ok", method = RequestMethod.POST)
	public String info_ok(WriteVO writeVO,MultipartFile file, Model model) throws Exception {
		service.insertMember(writeVO);
		return "redirect:main";
	}
	
	
	@RequestMapping("/index")
	public String index() {
		
		return "/index";
	}
	@RequestMapping("/left")
	public String left() {
		
		return "/left";
	}
	
	
	
	@RequestMapping("/main")
	public ModelAndView main(Model model,@RequestParam(defaultValue="kor_name") String searchOption,
			@RequestParam(defaultValue = "") String keyword) throws Exception {
		
		List<WriteVO> list = service.selectInfo(searchOption,keyword);
		int count = service.countArticle(searchOption,keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("main");
		model.addAttribute("list",list);
		return mav;
	}

	
	
	@RequestMapping(value = "/deleteInfo", method = RequestMethod.POST)
	public String deleteInfo(@RequestParam(value = "chBox[]") List<String> chArr, WriteVO writeVO) throws Exception {
		 
		 int num = 0;
		 for(String i : chArr) {
			num = Integer.parseInt(i);
			writeVO.setId(num);
			service.deleteInfo(writeVO);
		 }	 	 
		 return "redirect:main";  
	}
	@RequestMapping(value = "/info_update", method = RequestMethod.GET)
	public void info_update(Model model,@RequestParam(value = "id") int id) throws Exception {
		WriteVO update= null;
		update=service.info_update(id);
			model.addAttribute("update",update);
	
	}
	@RequestMapping(value = "/update_ok", method = RequestMethod.POST)
	public String update_ok(@ModelAttribute("writeVO") WriteVO writeVO) throws Exception {
		service.update_ok(writeVO);
		return "redirect:main";
	}
}










