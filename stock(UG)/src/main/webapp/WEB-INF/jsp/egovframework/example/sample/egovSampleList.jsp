<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
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
    <title><spring:message code="title.sample.stock" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<style>
	.dis-none{
			display:none;
			padding: 10px 10px 10px 10px;
	}
	</style>
	<!-- jQuery -->
    <!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javaScript" language="javascript" defer="defer">
       
        /* 글 수정 화면 function */
        function fn_egov_select(itemId,dealDate) {
        	
        	$("#itemId").val(itemId);
        	console.log(itemId);
        	callAjax(itemId,dealDate);
        	/* console.log("아이디",itemId);
        	console.log("날짜",dealDate); */
        	//$('#seItemId').val('#test');
        	//document.listForm.selectedId.value = itemId;
        }
        
        /* 라디오버튼 실행 */
/* 		function fn_egov_radio() {
        	
        	//console.log("라디오 아이디 "+ itemId);
			//document.getElementById("test").value = '${itemId}';
			console.log(asdf);
			
			var dayType = $(this).val();
			var itemId = $("#itemId").val();
			var dealDate = $("#testDatepicker").val();
			
				return false;
        	callAjax(itemId,dealDate,dayType);
        	//alert("아이디"+itemId);
        } */
        
        $("input:radio[name=calender]").click(function(){
        	var calender = $(this).val();	// 버튼의 값을 가져온다.
        	var _itemId = $("#itemId").val();	// itemid 값을 가져온다.

        	// 버튼을 클릭 시 call에 담긴 매개변수를 가져온다. 그런데 calender='aaa' 디폴트값이 위의 버튼클릭시 값을 새로 가져와서 
        	// 다른버튼을 클릭 하면 새로운 값이 들어간다.
        	callAjax(itemId,dealDate,calender);
			
        	 alert(calender); // 버튼 클릭시 값이 들어가는지 확인
        	   });
        
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
    $( "#testDatepicker" ).datepicker({
    	dateFormat: "yymmdd"
       ,defaultDate:'20200131'
    });
});
        
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="title.sample.stock" /></li>
        		</ul>
        	</div>
        	
        	<!-- // 타이틀 -->
        	<div id="search">
        		거래일<form:input path="searchRegDate" cssClass="txt" id="testDatepicker"/>
        		종목코드/명<form:input path="searchCode" cssClass="txt"/>
        		<ul>
        			<li>
	      	            <span class="btn_blue_l">
	      	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
	      	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	      	            </span>
      	            </li>
      	        </ul>
        	</div>
        	<br>총 <c:out value="${totCnt}"/> 건
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="60"/>
        				<col width="110"/>
        				<col width="100"/>
        				<col width="80"/>
        				<col width="?"/>
        				<col width="60"/>
        			</colgroup>
        			<tr>
        				<!-- <th align="center">No</th> -->
        				<th align="center"><spring:message code="title.sample.item_id" /></th>
        				<th align="center"><spring:message code="title.sample.item_name" /></th>
        				<th align="center"><spring:message code="title.sample.price_open" /></th>
        				<th align="center"><spring:message code="title.sample.price_high" /></th>
        				<th align="center"><spring:message code="title.sample.price_low" /></th>
        				<th align="center"><spring:message code="title.sample.price_close" /></th>
        				<th align="center"><spring:message code="title.sample.price_yester" /></th>
        				<th align="center"><spring:message code="title.sample.price_updown" /></th>
        				<th align="center"><spring:message code="title.sample.volume" /></th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<%-- <td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> --%>
            				<td align="center" class="listtd" ><c:out value="${result.itemId}" /></td>
            				<td align="left" class="listtd" ><a href="javascript:fn_egov_select('<c:out value="${result.itemId}"/>','<c:out value="${result.dealDate}"/>')"><c:out value="${result.itemName}" />&nbsp;</a></td>
            				<td align="center" class="listtd" ><fmt:formatNumber type="number" value="${result.priceOpen}" pattern="#,###"/>&nbsp;</td>
            				<td align="center" class="listtd"><fmt:formatNumber type="number" value="${result.priceHigh}" pattern="#,###"/>&nbsp;</td>
            				<td align="center" class="listtd" ><fmt:formatNumber type="number" value="${result.priceLow}" pattern="#,###"/>&nbsp;</td>
            				<td align="center" class="listtd"><fmt:formatNumber type="number" value="${result.priceClose}" pattern="#,###"/>&nbsp;</td>
            				<c:if test="${result.PD > 0}">
            					<td align="center" class="listtd" style="color:red;"><fmt:formatNumber type="number" value="${result.PD}" pattern="▲#,###"/>&nbsp;</td>
            				</c:if>
            				<c:if test="${result.PD < 0}">
            					<td align="center" class="listtd" style="color:blue;">▼<fmt:formatNumber type="number" value="${result.PD}" pattern="▲#,###; #,###"/>&nbsp;</td>
            				</c:if>
            				<c:if test="${result.PD == 0}">
            					<td align="center" class="listtd"><c:out value="${result.PD}"/>&nbsp;</td>
            				</c:if>
            				<c:if test="${result.FR > 0}">
            					<td align="center" class="listtd" style="color:red;">+<c:out value="${result.FR}"/>&nbsp;</td>
            				</c:if>
            				<c:if test="${result.FR < 0}">
            					<td align="center" class="listtd" style="color:blue;"><c:out value="${result.FR}"/>&nbsp;</td>
            				</c:if>
            				<c:if test="${result.FR == 0}">
            					<td align="center" class="listtd"><c:out value="0"/>&nbsp;</td>
            				</c:if>
            				<td align="center" class="listtd"><fmt:formatNumber type="number" value="${result.volume}" pattern="#,###"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	
        	<h4>주식 그래프</h4>
 			<input type="text" id="itemId"/>
 			
 			<div id="Line_Controls_Chart">
		    	<div class="dis-none" id="chartArea">
		    		<input type="radio" name="calender" value="aaa"/>일
					<input type="radio" name="calender" value="bbb"/>주
				    <input type="radio" name="calender" value="ccc"/>월
	 			
	 			</div>
	      <!-- 라인 차트 생성할 영역 -->
	          <div id="curve_chart" style="width: 700px; height: 500px;"></div>
	      <!-- 컨트롤바를 생성할 영역 -->
	          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
	      <!-- 막대그래프를 생성할 영역 -->
	          <div id="chart_div" style="width: 700px; height: 500px;"></div>
	          
	        </div>
        </div>
    </form:form>
 
  </body>
 
  <script>
  $("input:radio[name='day']:radio[value='일']").prop('checked', true); // 선택하기
  $("input:radio[name='day']:radio[value='일']").prop('checked', false); // 해제하기
  
  
  
  function callAjax(itemId,dealDate,calender='aaa') {
	  
	  console.log(itemId, dealDate, calender);
	  $("#itemId").val(itemId);
	  
	  var _dealDate = $("#dealDate").val();
	  var _itemId = $("#itemId").val();
	  console.log("rrrrrrrr" +_itemId);
	  
	  $.ajax({
          url: "ajax/ListAjax.do",
          data: {"itemId":itemId, "dealDate":dealDate,  "calender":calender},
          /* data: {"itemId":'${data.itemId}', "dealDate":'${data.dealDate}'}, */
          /* type: "post",  */
          dataType: "json",
          async: false,
          success:function(data) {
          	//alert(data+"에이작승이이이이잉");
          	/* alert(id); */
          	initChart(data);
          	console.log("sss"+calender);
          	// 컨트롤 갔다가 매퍼로
          	$("#chartArea").removeClass("dis-none");
          },
          error: function a(e){
          	console.log(e);
      }});
  }
  
  
  function initChart(obj){
	  
	  console.log("obj ==> ", obj);
	  /* obj.data[0].volume */
	  var chartDrowFun = {
			  
			    chartDrow : function(){
			        //var chartData = '';
			        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
			        var chartDateformat     = 'yyyyMMdd';
			        //라인차트의 라인 수
			       // var chartLineCount    = 10;
			        //컨트롤러 바 차트의 라인 수
			        //var controlLineCount    = 10; 
			 
			 
			        function drawChart() {
			          var data = new google.visualization.DataTable();
			          //그래프에 표시할 컬럼 추가
			          data.addColumn('datetime' , '날짜');
			          data.addColumn('number'   , '종가'); 
			          data.addColumn('number'   , '가격이동평균5');
			          data.addColumn('number'   , '가격이동평균10');
			          data.addColumn('number'   , '가격이동평균20');
			          data.addColumn('number'   , '가격이동평균60');
			          data.addColumn('number'   , '가격이동평균120');
			 		
			          //그래프에 표시할 데이터
			          var dataRow = [];
			 	
			          //랜덤 데이터 생성
			        //for(var i = 0; i <obj.data.length; i++){
			        for(var i = 0; i <obj['data'].length; i++){
			        	//var dealDate = obj.data[i].dealDate;
			            var priceClose     = obj.data[i].priceClose;
			            var priceAvg5     = obj.data[i].priceAvg5;
			            var priceAvg10     = obj.data[i].priceAvg10;
			            var priceAvg20     = obj.data[i].priceAvg20;
			            var priceAvg60     = obj.data[i].priceAvg60;
			            var priceAvg120     = obj.data[i].priceAvg120;
			            var year	= obj.data[i].year;
			            var month	= obj.data[i].month;
			            var day		= obj.data[i].day;
			           
			            dataRow = [new Date(year+","+month+","+day),priceClose,priceAvg5,priceAvg10,priceAvg20,priceAvg60,priceAvg120];
			            //dataRow = [new Date(year, month, day),priceClose,priceAvg5,priceAvg10,priceAvg20,priceAvg60,priceAvg120];
			            data.addRow(dataRow);
			        	  }
			
			          
			        	var options = {
			                title: '라인차트',
			               // curveType: 'function',
			                legend: { position: 'right' },
			                //chartArea: {'width': 500,'height' : '100%'},
			                /* hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
			                    years : {format: ['yyyy년']},
			                    months: {format: ['MM월']},
			                    days  : {format: ['dd일']},
			                    hours : {format: ['HH시']}}
			                  },textStyle: {fontSize:12}},
			                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}} */
			              };
			        	
			        	 //var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
				           // date_formatter.format(data, 0); 

			              var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
			            /* var chart = new google.visualization.ChartWrapper({
			              chartType   : 'LineChart',
			              containerId : 'lineChartArea', //라인 차트 생성할 영역
			              options     : {
			            	  			  title : '라인그래프',
			                              isStacked   : 'percent',
			                              focusTarget : 'category',
			                              height          : 500,
			                              width              : 800,//'120%',
			                              legend          : { position: "top", textStyle: {fontSize: 13}},
			                              pointSize        : 5,
			                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
			                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
			                                                                  years : {format: ['yyyy년']},
			                                                                  months: {format: ['MM월']},
			                                                                  days  : {format: ['dd일']},
			                                                                  hours : {format: ['HH시']}}
			                                                                },textStyle: {fontSize:12}},
			                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}}, 
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
			                        chartArea: {'width': 500,'height' : 80},
			                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
			                            gridlines:{count:controlLineCount,units: {
			                                  years : {format: ['yyyy년']},
			                                  months: {format: ['MM월']},
			                                  days  : {format: ['dd일']},
			                                  hours : {format: ['HH시']}}
			                            }}
			                        }
			                  },
			                    filterColumnIndex: 0
			                }
			            });  */
			 
			             //var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
			            //date_formatter.format(data, 0);
			 			
			             /*var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
			            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
			            dashboard.bind([control], [chart]);
			            dashboard.draw(data);  */
			              chart.draw(data, options);
			        }
			        	google.charts.setOnLoadCallback(drawChart);
			        	//google.charts.setOnLoadCallback(drawDashboard);
			          
			    }
	  }
	  
	  google.charts.load('current', {'packages':['corechart']});
	  //google.charts.load('current', {'packages':['line','controls']});
 	  chartDrowFun.chartDrow(); //chartDrow() 실행
 	  
 	 
 	 var chartDrowFun1 = {
			  
			    chartDrow1 : function(){
			    	var chartData = '';
					 
			        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
			        var chartDateformat     = 'yyyy년MM월dd일';
			        //라인차트의 라인 수
			        var chartLineCount    = 10;
			 
			        
			        function drawVisualization(){
			        	var data = new google.visualization.DataTable();
				          //그래프에 표시할 컬럼 추가
				          data.addColumn('string' , '날짜');
				          data.addColumn('number'   , '거래량이동평균60');
				          data.addColumn('number'   , '거래량');
				 		
				          //그래프에 표시할 데이터
				          var dataRow = [];
				 	
				          //랜덤 데이터 생성
				        for(var i = 0; i <obj.data.length; i++){
				        	var dealDate	= obj.data[i].dealDate;
				            var volumeAvg60     = obj.data[i].volumeAvg60;
				            var volume     = obj.data[i].volume;
				            /* var year	= obj.data[i].year;
				            var month	= obj.data[i].month;
				            var day		= obj.data[i].day; */
				            
				            
				            dataRow = [dealDate,volumeAvg60,volume];
				            data.addRow(dataRow);
				        	  }
			        	  
			        	  var options = {
			        	    title : '막대차트',
			        	    /* vAxis: {title: 'Cups'},
			        	    hAxis: {title: 'Month'}, */
			        	   hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
			                    years : {format: ['yyyy년']},
			                    months: {format: ['MM월']},
			                    days  : {format: ['dd일']},
			                    hours : {format: ['HH시']}}
			                  },textStyle: {fontSize:12}},
			                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
			        	    seriesType: 'bars',
			        	    series: {0: {type: 'line'}}
			        	    };
							
			             var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
			            date_formatter.format(data, 0); 
			            
			        	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			        	  
			        	  chart.draw(data, options);
			  	  }
			  	  
			  	  google.charts.setOnLoadCallback(drawVisualization);
			    }
	  }
 	  google.charts.load('current', {'packages':['corechart']});
	  chartDrowFun1.chartDrow1(); //chartDrow() 실행
  }
  
  
  
var id = '';
id = '${itemId}';

$(document).ready(function(){
	if(id){
		callAjax();	
	}
});

  </script>
</html>
