<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javaScript" language="javascript" defer="defer">
    	
    	
        /* 글 수정 화면 function */
        function fn_egov_select(itemId,dealDate) {
        	document.listForm.itemId2.value=itemId;
        	document.listForm.dealDate.value=dealDate;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
		
        $(function() {

    		$("#datepicker").datepicker({
    			dateFormat : 'yy-mm-dd' //Input Display Format 변경
    		});
    	});


    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">

        <input type="hidden" name="itemId2" />
        <!-- <input type="hidden" name="dealDate" /> -->
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        				<label for="dealDate" style="visibility:hidden;"><spring:message code="title.sample.deal_date" /></label>
        				<input type="text" id="datepicker" name="dealDate" cssClass="txt" size="13"/>
        			</li>
        			<li>
        				<label for="itemId" style="visibility:hidden;"><spring:message code="title.sample.item_id" /></label>
        				<input type="text" id="item_id" name="itemId" cssClass="txt" size="13"/>
        			</li>
        			<%-- <li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="Name" />
        					<form:option value="0" label="ID" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li> --%>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<c:out value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/> 건
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="종목코드, 종목명, 시가, 고가, 저가, 종가, 전일대비, 등락률, 거래량">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="70"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="60"/>
        				<col width="60"/>
        				<col width="60"/>
        				<col width="60"/>
        			</colgroup>
        			<tr>
        				<th align="center"><spring:message code="title.sample.item_id" /></th>
        				<th align="center"><spring:message code="title.sample.item_name" /></th>
        				<th align="center"><spring:message code="title.sample.price_open" /></th>
        				<th align="center"><spring:message code="title.sample.price_high" /></th>
        				<th align="center"><spring:message code="title.sample.price_low" /></th>
        				<th align="center"><spring:message code="title.sample.price_close" /></th>
        				<th align="center"><spring:message code="title.sample.item1" /></th>
        				<th align="center"><spring:message code="title.sample.item2" /></th>
        				<th align="center"><spring:message code="title.sample.volume" /></th>
        			</tr>
        			
        			<c:forEach var="result" items="${resultList}"  varStatus="status">
            			<tr>
            				<%-- <td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> --%>
            				<td align="center" class="listtd"><a href="javascript:chart_open('<c:out value="${result.itemId}"/>','<c:out value="${result.dealDate}"/>')"><c:out value="${result.itemId}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.itemName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.priceOpen}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.priceHigh}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.priceLow}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.priceClose}"/>&nbsp;</td>
            				<fmt:parseNumber var="i" type="number" value="${result.befoprice }"/>	
            					<c:if test="${i > 0}"> <!-- ${((result.priceClose-resultList2[status.index].priceClose)/(result.priceClose+(result.priceClose-resultList2[status.index].priceClose)))*100}  -->
            						<td align="center" class="listtd" style="color:red">▲<fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice }"/>&nbsp;</td>
            						<td align="center" class="listtd" style="color:red">▲+<fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice2 }"/>&nbsp;</td>
            					</c:if>
            					<c:if test="${i < 0}">
            						<td align="center" class="listtd" style="color:blue">▼<fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice }"/>&nbsp;</td>
            						<td align="center" class="listtd" style="color:blue">▼<fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice2 }"/>&nbsp;</td>
            					</c:if>
            					<c:if test="${i == 0}">
            						<td align="center" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice }"/>&nbsp;</td>
            						<td align="center" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="2" value="${result.befoprice2 }"/>&nbsp;</td>
            					</c:if>
            					<td align="center" class="listtd"><c:out value="${result.volume}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>
<script type="text/javaScript" language="javascript" defer="defer">
       
       var ajaxdata = {};           
       
       /* $.each(obj,function(i,v){
      		//console.log(v);
      		var obj = {}
      		$.each(v,function(key,val){
	       		if(key == 'dealDate') {
	       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
	       		}	
	       		if(key == 'priceAvg5' || key == 'priceAvg20' || key == 'priceAvg60') {
	       			obj.y = val;
	       		}
      		});

      		objArray.push(obj);
      		console.log(objArray);
      		return false;
  		}); */
       
       function chart_open(itemId,dealDate){
      	   console.log("call ajax... testing");
      	   //alert(itemId+"----"+dealDate);
      	   
      	   var dealDate = dealDate;
     	   var itemId = itemId;
     	  // console.log(dealDate);
     	  // console.log(itemId);
     	 
     	   var data = {"dealDate": dealDate, "itemId": itemId};
      	   $.ajax({
      		   url : "/chart/testAjax.do"
      		   	 , data: data
     			 , type: "post"
     			 , resultType: "json"
     			 , success:function(data){  
     				 
     				//console.log(data);
     				  /* console.log("완료!");
 	    		      console.log(data);
 	                  console.log(data.itemId);
 	                  console.log(data.dealDate); */
 	                 // initChart(data.data);	 
 	                 readchart(data.data3);
 	                 ajaxdata = data.data3;
 	                 //alert("성공");
 	                 //console.log(ajaxdata);
 	                 chartDrowFun.chartDrow(); 
 	                 drawVisualization();
 	                 linechart(data.data3);
 	                 //drawDashboard(data.data3);
     		    },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            self.close();
		        }               
      	   });
         }
   	 
        function readchart(obj) { 
        	var objArray = new Array();
        	var objArray2 = new Array();
        	var objArray3 = new Array();
        	var objArray4 = new Array();
        	var objArray5 = new Array();

        	$.each(obj,function(i,v){
	       		//console.log(v);
	       		var obj = {}
	       		$.each(v,function(key,val){
		       		if(key == 'priceAvg5') {
		       			obj.y = val;
		       		}	 
	       		});
	
	       		objArray.push(obj);
       		});
        	$.each(obj,function(i,v){
	       		//console.log(v);
	       		var obj2 = {}
	       		$.each(v,function(key,val){
		       		if(key == 'priceAvg10' ) {
		       			obj2.y = val;
		       		}	 
	       		});
	
	       		objArray2.push(obj2);
       		});
        	$.each(obj,function(i,v){
	       		//console.log(v);
	       		var obj3 = {}
	       		$.each(v,function(key,val){
		       		if(key == 'priceAvg20') {
		       			obj3.y = val;
		       		}	 
	       		});
	
	       		objArray3.push(obj3);
       		});
        	$.each(obj,function(i,v){
	       		//console.log(v);
	       		var obj4 = {}
	       		$.each(v,function(key,val){
		       		if(key == 'priceAvg60') {
		       			obj4.y = val;
		       		}	 
	       		});
	
	       		objArray4.push(obj4);
       		});
        	$.each(obj,function(i,v){
	       		//console.log(v);
	       		var obj5 = {}
	       		$.each(v,function(key,val){
		       		if(key == 'priceAvg120') {
		       			obj5.y = val;
		       		}	 
	       		});
	       		
	       		objArray5.push(obj5);
       		});
        	

        	
        	//console.log(objArray);

        	/*var a = obj;
        	console.log(a.itemName);
        	console.log(obj.priceAvg5);
        	console.log(obj.volumeAvg120); */
        	
        	 var testObj = {};
        	 
		     var chartdata = [{        
		 	 		type: "line",
		 	 		dataPoints: objArray
		 	 	},{
		 	 		type: "line",
		 	 		dataPoints: objArray2
		 	 	},{
		 	 		type: "line",
		 	 		dataPoints: objArray3
		 	 	},{
		 	 		type: "line",
		 	 		dataPoints: objArray4
		 	 	},{
		 	 		type: "line",
		 	 		dataPoints: objArray5
		 	 	}];
		   
		     testObj = {
		    		 a : chartdata
		     };
		     chartdrow(testObj);
	    }
	     
	     function chartdrow(chartdata) {

	    	 var chart = new CanvasJS.Chart("chartContainer2", {
	    	 	animationEnabled: true,
	    	 	theme: "light2",
	    	 	title:{
	    	 		text: "Simple Line Chart"
	    	 	},
	    	 	axisY:{
	    	 		includeZero: false
	    	 	},
	    	 	data: chartdata.a
	    	 });
	    	 chart.render();

	    	 }
	     
	     
	     
	     
	     function linechart(obj) {

	       		 var objArray = new Array();
	       		 var objArray2 = new Array();
	       		 var objArray3 = new Array();
	       		 var objArray4 = new Array();
	       		 var objArray5 = new Array();
				// console.log(obj[0].dealDate);
				// return false;
	       		$.each(obj,function(i,v){
		       		//console.log(v);
		       		var obj = {}
		       		$.each(v,function(key,val){
			       		if(key == 'dealDate') {
			       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
			       		}	
			       		if(key == 'priceAvg5') {
			       			obj.y = val;
			       		}
		       		});
		       		objArray.push(obj);
	       		});
	       		$.each(obj,function(i,v){
		       		//console.log(v);
		       		var obj = {}
		       		$.each(v,function(key,val){
			       		if(key == 'dealDate') {
			       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
			       		}	
			       		if(key == 'priceAvg10') {
			       			obj.y = val;
			       		}
		       		});
		       		objArray2.push(obj);
	       		});
	       		$.each(obj,function(i,v){
		       		//console.log(v);
		       		var obj = {}
		       		$.each(v,function(key,val){
			       		if(key == 'dealDate') {
			       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
			       		}	
			       		if(key == 'priceAvg20') {
			       			obj.y = val;
			       		}
		       		});
		       		objArray3.push(obj);
	       		});
	       		$.each(obj,function(i,v){
		       		//console.log(v);
		       		var obj = {}
		       		$.each(v,function(key,val){
			       		if(key == 'dealDate') {
			       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
			       		}	
			       		if(key == 'priceAvg60') {
			       			obj.y = val;
			       		}
		       		});
		       		objArray4.push(obj);
	       		});
	       		$.each(obj,function(i,v){
		       		//console.log(v);
		       		var obj = {}
		       		$.each(v,function(key,val){
			       		if(key == 'dealDate') {
			       			obj.x = val.substring(0,4)+","+val.substring(4,6)+","+val.substring(6,8);
			       		}	
			       		if(key == 'priceAvg120') {
			       			obj.y = val;
			       		}
		       		});
		       		objArray5.push(obj);
	       		});
	       		
	        	 var linedata = {};
	        	 
			     var chartdata = [{        
			 	 		type: "line",
		    	 		showInLegend: true,
		    	 		name: "Total Visit",
		    	 		markerType: "square",
		    	 		xValueFormatString: "DD MMM, YYYY",
		    	 		color: "#F08080",
			 	 		dataPoints: objArray
			 	 	},{
			 	 		type: "line",
		    	 		showInLegend: true,
		    	 		name: "Total Visit",
		    	 		markerType: "square",
		    	 		xValueFormatString: "DD MMM, YYYY",
		    	 		color: "#F08080",
			 	 		dataPoints: objArray2
			 	 	},{
			 	 		type: "line",
		    	 		showInLegend: true,
		    	 		name: "Total Visit",
		    	 		markerType: "square",
		    	 		xValueFormatString: "DD MMM, YYYY",
		    	 		color: "#F08080",
			 	 		dataPoints: objArray3
			 	 	},{
			 	 		type: "line",
		    	 		showInLegend: true,
		    	 		name: "Total Visit",
		    	 		markerType: "square",
		    	 		xValueFormatString: "DD MMM, YYYY",
		    	 		color: "#F08080",
			 	 		dataPoints: objArray4
			 	 	},{
			 	 		type: "line",
		    	 		showInLegend: true,
		    	 		name: "Total Visit",
		    	 		markerType: "square",
		    	 		xValueFormatString: "DD MMM, YYYY",
		    	 		color: "#F08080",
			 	 		dataPoints: objArray5
			 	 	}];
			   
			     linedata = {
			    		 a : chartdata
			     };
			     canvaschart(linedata);
	     	}
	     function canvaschart(linedata) {
			console.log(linedata);

	    	 var chart = new CanvasJS.Chart("chartContainer", {

	    	 	animationEnabled: true,
	    	 	theme: "light2",
	    	 	title:{
	    	 		text: "Site Traffic"
	    	 	},
	    	 	axisX:{
	    	 		valueFormatString: "DD MMM",
	    	 		crosshair: {
	    	 			enabled: true,
	    	 			snapToDataPoint: true
	    	 		}
	    	 	},
	    	 	axisY: {
	    	 		title: "Number of Visits",
	    	 		crosshair: {
	    	 			enabled: true
	    	 		}
	    	 	},
	    	 	toolTip:{
	    	 		shared:true
	    	 	},  
	    	 	legend:{
	    	 		cursor:"pointer",
	    	 		verticalAlign: "bottom",
	    	 		horizontalAlign: "left",
	    	 		dockInsidePlotArea: true,
	    	 		itemclick: toogleDataSeries
	    	 	},
	    	 	data: linedata.a
	    	 });
	    	 chart.render();

	    	 function toogleDataSeries(e){
	    	 	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	    	 		e.dataSeries.visible = false;
	    	 	} else{
	    	 		e.dataSeries.visible = true;
	    	 	}
	    	 	chart.render();
	    	 }

	    	 }
	     
  
	     
	     
	     
	     
	     
    var chartDrowFun = {
   		 
	    chartDrow : function(){
	    	
	        var chartData = '';
	 
	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
	        var chartDateformat     = 'yyyy년MM월dd일';
	        //라인차트의 라인 수
	        var chartLineCount    = 10;
	        //컨트롤러 바 차트의 라인 수
	        var controlLineCount    = 10;
	        
	        //console.log("ajaxdata :::::::::::::::: ", ajaxdata);
	 		
	        function drawDashboard() {
	          // console.log(ajaxdata.length);
	          //console.log(ajaxdata);
	          var data = new google.visualization.DataTable();
	          //그래프에 표시할 컬럼 추가
	          data.addColumn('datetime' , '날짜');
	          data.addColumn('number'   , '가격1');
	          data.addColumn('number'   , '가격2');
	          data.addColumn('number'   , '가격3');
	          data.addColumn('number'   , '가격4');
	          data.addColumn('number'   , '가격5');
	      
	          //그래프에 표시할 데이터
	          var dataRow = [];
	         /*  console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	          console.log(ajaxdata.length);
	          console.log(ajaxdata[0]);
	          console.log(ajaxdata[0].priceAvg5); */
	         
	          for(var i = 0; i < ajaxdata.length; i++){ //랜덤 데이터 생성
	        	  var year = (ajaxdata[i].dealDate).substring(0,4);
	        	  var month = (ajaxdata[i].dealDate).substring(4,6);
	        	  var day = (ajaxdata[i].dealDate).substring(6,8);
	        	  var priceAvg5 = ajaxdata[i].priceAvg5;
	        	  var priceAvg10 = ajaxdata[i].priceAvg10;
	        	  var priceAvg20 = ajaxdata[i].priceAvg20;
	        	  var priceAvg60 = ajaxdata[i].priceAvg60;
	        	  var priceAvg120 = ajaxdata[i].priceAvg120;
	 
	            dataRow = [new Date(year+","+month+","+day), priceAvg5, priceAvg10 , priceAvg20, priceAvg60, priceAvg120];
	            
	            data.addRow(dataRow);
	          }
	  
	            var chart = new google.visualization.ChartWrapper({
	              chartType   : 'LineChart',
	              containerId : 'lineChartArea', //라인 차트 생성할 영역
	              options     : {
	                              isStacked   : 'percent',
	                              focusTarget : 'category',
	                              height          : 500,
	                              width              : '100%',
	                              legend          : { position: "top", textStyle: {fontSize: 13}},
	                              pointSize        : 5,
	                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
	                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
	                                                                  years : {format: ['yyyy년']},
	                                                                  months: {format: ['MM월']},
	                                                                  days  : {format: ['dd일']}
	                                                                  }
	                                                                },textStyle: {fontSize:12}},
	                vAxis              : {minValue: 100,viewWindow:{min:15000},gridlines:{count:-1},textStyle:{fontSize:12}},
	                animation        : {startup: true,duration: 1000,easing: 'in' },
	                annotations    : {pattern: chartDateformat,
	                                textStyle: {
	                                fontSize: 15,
	                                bold: true,
	                                italic: true,
	                                color: '#871b47',
	                                auraColor: '#d799ae',
	                                opacity: 0.8,
	                                pattern: chartDateformat
	                              }
	                            }
	              }
	            });
	 
	            var control = new google.visualization.ControlWrapper({
	              controlType: 'ChartRangeFilter',
	              containerId: 'controlsArea',  //control bar를 생성할 영역
	              options: {
	                  ui:{
	                        chartType: 'LineChart',
	                        chartOptions: {
	                        chartArea: {'width': '60%','height' : 80},
	                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
	                            gridlines:{count:controlLineCount,units: {
	                                  years : {format: ['yyyy년']},
	                                  months: {format: ['MM월']},
	                                  days  : {format: ['dd일']}
	                                  }
	                            }}
	                        }
	                  },
	                    filterColumnIndex: 0
	                }
	            });
	 
	            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
	            date_formatter.format(data, 0);
	 
	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
	            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
	            dashboard.bind([control], [chart]);
	            dashboard.draw(data);
	 
	        }
	          google.charts.setOnLoadCallback(drawDashboard);
	 
	      }
	    }
	 
	$(document).ready(function(){
	  google.charts.load('current', {'packages':['line','controls']});	  
	});
	    	
	 
    google.charts.load('current', {'packages':['corechart']});
    //google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
    	
      // Some raw data (not necessarily accurate)

         /* var dataRow = [];
      	 var data = google.visualization.arrayToDataTable([]);  */
      	 
      	var data = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        data.addColumn('datetime' , '날짜');
        data.addColumn('number'   , '거래량1');
        data.addColumn('number'   , '60일치');

        var dataRow = [];
         // console.log(ajaxdata);
         // return false;
         
    	 for(var i = 0; i < ajaxdata.length; i++){ //랜덤 데이터 생성
       	  var year = (ajaxdata[i].dealDate).substring(0,4);
          var month = (ajaxdata[i].dealDate).substring(4,6);
       	  var day = (ajaxdata[i].dealDate).substring(6,8);
       	  var volume = ajaxdata[i].volume;
       	  var volumeAvg60 = ajaxdata[i].volumeAvg60;
          //var volumeAvg120 = ajaxdata[i].volumeAvg120;

          dataRow = [new Date(year+","+month+","+day),volume, volumeAvg60];
          data.addRow(dataRow);
         } 
      /* var data = google.visualization.arrayToDataTable([
        ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
        ['2004/05',  165,      938,         522,             998,           450,      614.6],
        ['2005/06',  135,      1120,        599,             1268,          288,      682],
        ['2006/07',  157,      1167,        587,             807,           397,      623],
        ['2007/08',  139,      1110,        615,             968,           215,      609.4],
        ['2008/09',  136,      691,         629,             1026,          366,      569.6]
      ]); */

      var options = {
        title : 'Monthly Coffee Production by Country',
        vAxis: {title: 'Cups'},
        hAxis: {title: 'Month'},
        seriesType: 'bars',
        series: {0: {type: 'line'}}        
      };

      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
	
    
    
    
    
</script>
          <!-- 그래프 공간  -->
      	<div style="clear:both">
	       <div id="chartContainer2" style="height: 370px; width: 100%;"></div>
	       <div id="chartContainer" style="height: 370px; width: 100%;"></div>
	       <div id="chart_div" style="height: 370px; width: 100%;"></div>
      	</div>
      	 <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>     
        </div>
        

</body>
</html>
