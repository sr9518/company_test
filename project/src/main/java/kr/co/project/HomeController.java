package kr.co.project;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

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

import kr.co.project.model.MemberInfoVO;
import kr.co.project.model.MemberVO;
import kr.co.project.page.PageMaker;
import kr.co.project.service.MemberService;
import kr.co.project.utils.UploadFileUtils;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	 @Inject
	 private MemberService service;
	
	 @Resource(name="uploadPath")
	 private String uploadPath;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model) throws Exception {
		logger.info("write");
		List<MemberVO> memberList = service.selectMember();
        model.addAttribute("memberList", memberList);
		return "/write";
	}
	@RequestMapping("/write2")
	public String write2() {
		
		return "/write2";
	}
	@RequestMapping(value = "/write_ok", method = RequestMethod.POST)
	public String write_ok(MemberInfoVO memberinfoVO, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		memberinfoVO.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		memberinfoVO.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.insertMember(memberinfoVO);
		return "redirect:/list";
	}
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(
			@RequestParam(defaultValue="usertype") String usertype,
			@RequestParam(defaultValue="bong") String bong,
			@RequestParam(defaultValue="bun") String bun,
			@RequestParam(defaultValue="search") String search,
			@RequestParam(defaultValue="text") String text,
			PageMaker pageMaker, Model model) throws Exception{
		log.debug("{}",pageMaker);
		ModelAndView mav = new ModelAndView("/list");

		pageMaker.setTotalCount(100);
		pageMaker.setTotalCount(service.countBoardListTotal(usertype,bong,bun,search,text));
		int pageStart = pageMaker.getPageStart();
		int perPageNum = pageMaker.getPerPageNum();
		List<MemberInfoVO> list = service.listAll(pageStart,perPageNum,usertype,bong,bun,search,text);
		
		mav.setViewName("list"); // 포워딩할 뷰의 이름
		mav.addObject("list", list);
		mav.addObject("PageMaker",pageMaker);
		return mav;
	}
	
	
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update(Model model,@RequestParam(value = "id") int id) throws Exception {
		MemberInfoVO updatevo = null;
		updatevo = service.update(id);
		model.addAttribute("update",updatevo);
		return "/update";
	}
	@RequestMapping(value = "/update_ok", method = RequestMethod.POST)
	public String update_ok(@ModelAttribute("memberinfoVO") MemberInfoVO memberinfoVO) throws Exception {
		service.update_ok(memberinfoVO);
		return "redirect:list";
	}
	@RequestMapping(value = "/content" , method = RequestMethod.GET)
	public String content(Model model,MemberInfoVO memberinfoVO,@RequestParam(value = "id") int id) throws Exception {
		model.addAttribute("detail",service.selectOne(memberinfoVO.getId()));
		
		return "/content";
	}
}














