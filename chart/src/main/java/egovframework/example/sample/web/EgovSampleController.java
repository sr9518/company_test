/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import lombok.extern.slf4j.Slf4j;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Slf4j
@Controller
public class EgovSampleController {

	/** EgovSampleService */
	@Resource(name = "sampleService")
	private EgovSampleService sampleService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/egovSampleList.do")
	public String selectSampleList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		System.out.println("searchVO dealDate 값확인 : " + searchVO.getDealDate());
		List<?> sampleList = sampleService.selectSampleList(searchVO);
		model.addAttribute("resultList", sampleList);
		int totCnt = sampleService.selectSampleListTotCnt(searchVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@"+totCnt);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "sample/egovSampleList";
	}

	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addSample.do", method = RequestMethod.GET)
	public String addSampleView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("sampleVO", new SampleVO());
		return "sample/egovSampleRegister";
	}

	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addSample.do", method = RequestMethod.POST)
	public String addSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(sampleVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("sampleVO", sampleVO);
			return "sample/egovSampleRegister";
		}

		sampleService.insertSample(sampleVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}

	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/updateSampleView.do")
	public String updateSampleView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model,@RequestParam("itemId2") String itemId,@RequestParam("dealDate") String dealDate) throws Exception {
		SampleVO sampleVO = new SampleVO();
		sampleVO.setItemId(itemId);
		sampleVO.setDealDate(dealDate);
		System.out.println("@@@@@@@@@@@@"+sampleVO.getItemId());
		// 변수명은 CoC 에 따라 sampleVO
		model.addAttribute("sample",sampleService.selectSample(sampleVO));
		model.addAttribute("sample2",sampleService.selectSample2(sampleVO));
		return "sample/egovSampleList.do";
	}

	/**
	 * 글을 조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	/*public SampleVO selectSample(SampleVO sampleVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception {
		return sampleService.selectSample(sampleVO);
	}*/

	/**
	 * 글을 수정한다.
	 * @param sampleVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateSample.do")
	public String updateSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(sampleVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("sampleVO", sampleVO);
			return "sample/egovSampleRegister";
		}

		sampleService.updateSample(sampleVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}

	/**
	 * 글을 삭제한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteSample.do")
	public String deleteSample(SampleVO sampleVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO, SessionStatus status) throws Exception {
		sampleService.deleteSample(sampleVO);
		status.setComplete();
		return "forward:/egovSampleList.do";
	}

	@ResponseBody
	@RequestMapping(value="/testAjax.do")
	public Map<String, Object> selectItemList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,@RequestParam("itemId") String itemId,@RequestParam("dealDate") String dealDate,@RequestParam("dayType") String dayType) throws Exception{

		searchVO.setItemId(itemId);
		searchVO.setDealDate(dealDate);
		searchVO.setDayType(dayType);
		System.out.println("dayType 확인 @@@@@@@@@@@@@@@@@@@@@@"+searchVO.getDayType());
		System.out.println("dayType 확인 @@@@@@@@@@@@@@@@@@@@@@"+searchVO.getItemId());
		System.out.println("dayType 확인 @@@@@@@@@@@@@@@@@@@@@@"+searchVO.getDealDate());
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<?> sample3 = sampleService.selectSampleList3(searchVO);
		List<?> sample4 = sampleService.selectSampleList4(searchVO);
		//List<?> sample5 = sampleService.selectSampleList5(sampleVO);
		//model.addAttribute("chartdata",sample4);
		//model.addAttribute("chartdata",sampleService.selectSampleList4(sampleVO));
		//System.out.println("chartdata 값 확인 : "+sample4);
		//System.out.println(sample3);
		//SampleVO sample3 = sampleService.selectSample3(sampleVO);
		result.put("code", "ok");
		result.put("data3", sample3);
		result.put("data4", sample4);
		//result.put("data5", sample5);
		/*log.debug("{sample 값 : }",sample);
		log.debug("{sample2 값 : }",sample2);*/
		// 변수명은 CoC 에 따라 sampleVO
		//System.out.println(sample3);
		/*model.addAttribute("sample",sampleService.selectSample(sampleVO));
		model.addAttribute("sample2",sampleService.selectSample2(sampleVO));*/
	
	    return result;
	}
	@ResponseBody
	@RequestMapping(value = "/testAjax2.do")
	public Map<String, Object> selectItemList2(@ModelAttribute("searchVO") SampleDefaultVO searchVO) {
	
		System.out.println("날짜확인 @@@@@@"+searchVO.getDealDate());
		Map<String, Object> result2 = new HashMap<String, Object>();
		List<?> sample5 = sampleService.selectSampleList5(searchVO);
		result2.put("data", sample5);
		// System.out.println("jqgrid ajax 값 : "+sample5);
		return result2;
	}
	@RequestMapping("/bootstraptable.do")
	public String boot() {
		return "sample/bootstraptable";
	}
	@RequestMapping("/dataTable.do")
	public String data() {
		return "sample/dataTable";
	}

}
