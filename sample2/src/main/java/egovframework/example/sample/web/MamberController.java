package egovframework.example.sample.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.sample.service.MamberService;
import egovframework.example.sample.service.MamberVO;
import egovframework.example.sample.service.MamberVO2;
import egovframework.example.sample.service.PageMaker;
import egovframework.example.sample.service.SearchCriteria;
import egovframework.example.sample.service.UploadFileUtils;
import egovframework.example.sample.service.impl.ExcelRead;
import egovframework.example.sample.service.impl.ExcelReadOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MamberController {
	
	@Autowired
	private MamberService service;
	@Resource(name = "uploadPath")
	String uploadPath;
	@RequestMapping("/tswrite.do")
	
	public String tswrite() {
		return "/sample/tswrite";
	}
	@RequestMapping(value = "/tswrite_ok.do", method = RequestMethod.POST)
	public String tswrite_ok(MamberVO mamberVO,MultipartFile file,MamberVO2 mamberVO2) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		mamberVO.setGdsimg(file.getOriginalFilename());
		mamberVO.setGdsthumbimg(File.separator + "javis/images/imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		log.debug("{}",mamberVO);
		service.insert(mamberVO);
		service.insert2(mamberVO2);
		return "redirect:/tslist.do";
	}
	@RequestMapping("/tslist.do")
	public String tslist(Model model,MamberVO mamberVO,SearchCriteria scri,HttpServletResponse response) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("list",service.list(scri));
		model.addAttribute("pageMaker",pageMaker);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+scri.getUseday());
		return "/sample/tslist";
	}
	@RequestMapping("/tscontent.do")
	public String tscontent(Model model,MamberVO mamberVO) throws Exception {
		model.addAttribute("content",service.selectOne(mamberVO.getId()));
		return "/sample/tscontent";
	}
	@RequestMapping("/tsdelete.do")
	public String tsdelete(MamberVO mamberVO,MamberVO2 mamberVO2) throws Exception {
		service.delete2(mamberVO2.getId());
		service.delete1(mamberVO.getId());
		return "redirect:/tslist.do";
	}
	@RequestMapping("/tsstore.do")
	public String tsstore(MamberVO mamberVO,MultipartFile file,HttpServletRequest req) throws Exception {
		
		log.debug("{}",mamberVO);
			
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {

			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("exfile")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),ymdPath);

			mamberVO.setGdsimg(File.separator + "javis/images/imgUpload" + ymdPath + File.separator + fileName);
			mamberVO.setGdsthumbimg(File.separator + "javis/images/imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);		
			} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
				mamberVO.setGdsimg(req.getParameter("gdsimg"));
				mamberVO.setGdsimg(req.getParameter("gdsthumbimg"));
			}
		
		service.store(mamberVO);
		return "redirect:/tslist.do";
	}
	@RequestMapping("/tsupdate.do")
	public String tsupdate(MamberVO mamberVO) throws Exception {
		service.update(mamberVO);
		return "redirect:/tslist.do";
	}
	
	@RequestMapping(value="/ExcelPoi.do")
	  public void ExcelPoi(SearchCriteria scri,MamberVO mamberVO,HttpServletResponse response, Model model,@RequestParam(defaultValue = "test") String fileName) throws Exception {

	      HSSFWorkbook objWorkBook = new HSSFWorkbook();
	      HSSFSheet objSheet = null;
	      HSSFRow objRow = null;
	      HSSFCell objCell = null;       //셀 생성

	        //제목 폰트
	  HSSFFont font = objWorkBook.createFont();
	  font.setFontHeightInPoints((short)9);
	  font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
	  font.setFontName("맑은고딕");

	  //제목 스타일에 폰트 적용, 정렬
	  HSSFCellStyle styleHd = objWorkBook.createCellStyle();    //제목 스타일
	  styleHd.setFont(font);
	  styleHd.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	  styleHd.setVerticalAlignment (HSSFCellStyle.VERTICAL_CENTER);

	  objSheet = objWorkBook.createSheet("첫번째 시트");     //워크시트 생성
	  
	  String[] title = { "순번", "사용일", "사용내역", "사용금액", "승인금액", "처리상태", "등록일" };
		  objRow = objSheet.createRow(0);
		  objRow.setHeight((short) 0x150);
		  for (int a = 0; a < title.length; a++) {
		  objCell = objRow.createCell(a);
		  objCell.setCellValue(title[a]);
		  objCell.setCellStyle(styleHd);
	  }
	  
	  List<MamberVO> list = service.selectRow(scri); 
	 
	  int index = 1;
	    for (MamberVO map : list) {
	      objRow = objSheet.createRow(index);
	      objRow.setHeight((short) 0x150);

	      objCell = objRow.createCell(0);
	      objCell.setCellValue((int)map.getId());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(1);
	      objCell.setCellValue((String)map.getUseday());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(2);
	      objCell.setCellValue((String)map.getUsed());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(3);
	      objCell.setCellValue((int)map.getUsecost());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(4);
	      objCell.setCellValue((int)map.getAppcost());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(5);
	      objCell.setCellValue((String)map.getProcessed());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(6);
	      objCell.setCellValue((String)map.getWriteday());
	      objCell.setCellStyle(styleHd);
	      
	      index++;
	    }

	    for (int i = 0; i < list.size(); i++) {
	      objSheet.autoSizeColumn(i);
	    }


	  response.setContentType("Application/Msexcel");
	  response.setHeader("Content-Disposition", "ATTachment; Filename="+URLEncoder.encode(fileName,"UTF-8")+".xls");

	  OutputStream fileOut  = response.getOutputStream();
	  objWorkBook.write(fileOut);
	  fileOut.close();

	  response.getOutputStream().flush();
	  response.getOutputStream().close();
	}
	@RequestMapping(value = "/ExcelPoi2.do")
	  public void ExcelPoi2(SearchCriteria scri,@RequestParam String fileName, HttpServletResponse response, Model model)
	      throws Exception {

	    XSSFWorkbook objWorkBook = new XSSFWorkbook();
	    XSSFSheet objSheet = null;
	    XSSFRow objRow = null;
	    XSSFCell objCell = null; // 셀 생성

	    // 제목 폰트
	    XSSFFont font = objWorkBook.createFont();
	    font.setFontHeightInPoints((short) 9);
	    font.setBoldweight((short) font.BOLDWEIGHT_BOLD);
	    font.setFontName("맑은고딕");

	    // 제목 스타일에 폰트 적용, 정렬
	    XSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
	    styleHd.setFont(font);
	    styleHd.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	    styleHd.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

	    objSheet = objWorkBook.createSheet("첫번째 시트"); // 워크시트 생성

	    List<MamberVO> rowList = service.selectRow(scri);

	    // 행으로 제작을 하네
	    // 1행
	    String[] title = { "순번", "사용일", "사용내역", "사용금액", "승인금액", "처리상태", "등록일" };
		  objRow = objSheet.createRow(0);
		  objRow.setHeight((short) 0x150);
		  for (int a = 0; a < title.length; a++) {
		  objCell = objRow.createCell(a);
		  objCell.setCellValue(title[a]);
		  objCell.setCellStyle(styleHd);
	  }

	    int index = 1;
	    for (MamberVO map : rowList) {
	      objRow = objSheet.createRow(index);
	      objRow.setHeight((short) 0x150);

	      objCell = objRow.createCell(0);
	      objCell.setCellValue((int)map.getId());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(1);
	      objCell.setCellValue((String)map.getUseday());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(2);
	      objCell.setCellValue((String)map.getUsed());
	      objCell.setCellStyle(styleHd);

	      objCell = objRow.createCell(3);
	      objCell.setCellValue((int)map.getUsecost());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(4);
	      objCell.setCellValue((int)map.getAppcost());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(5);
	      objCell.setCellValue((String)map.getProcessed());
	      objCell.setCellStyle(styleHd);
	      
	      objCell = objRow.createCell(6);
	      objCell.setCellValue((String)map.getWriteday());
	      objCell.setCellStyle(styleHd);
	      
	      index++;
	    }

	    for (int i = 0; i < rowList.size(); i++) {
	      objSheet.autoSizeColumn(i);
	    }

	    response.setContentType("Application/Msexcel");
	    response.setHeader("Content-Disposition", "ATTachment; Filename="
	        + URLEncoder.encode(fileName, "UTF-8") + ".xlsx");

	    OutputStream fileOut = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();

	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	  }
	
	//@ResponseBody // ajax일때 무조건 ResponseBody를 써줘야 적용가능
	
	  @ResponseBody
	  @RequestMapping(value = "/excelUploadAjax.do")
	  public ModelAndView excelUploadAjax(MamberVO2 mamberVO2,MultipartHttpServletRequest request) throws Exception{

		   System.out.println("업로드 진행");

		    MultipartFile excelFile = request.getFile("excelFile");
		    System.out.println(request.getFile("excelFile"));
		    if(excelFile==null || excelFile.isEmpty()){

		        throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		    }

		    File destFile = new File("C:\\upload\\"+excelFile.getOriginalFilename());

		    // 예외처리에서 에러 발생으로 주석
		    /*try{
		        excelFile.transferTo(destFile);
		        
		    }catch(Exception e){
		        throw new RuntimeException(e.getMessage(),e);
		    }*/
		    
		    //업로드를 진행하고 다시 지우기
		    service.excelUpload(destFile);
		    service.excelinsert(mamberVO2);
		    destFile.delete();
		  //		FileUtils.delete(destFile.getAbsolutePath());

		    ModelAndView view = new ModelAndView();

		    view.setViewName("redirect:/tslist.do");

		      return view;
		  }


}







