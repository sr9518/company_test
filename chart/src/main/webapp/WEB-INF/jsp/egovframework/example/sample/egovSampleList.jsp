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
    
    
	<script src="https://code.jquery.com/jquery-3.3.1.js "></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- <link rel="stylesheet" type="text/css" media="screen" href="jgrid/css/jquery-ui-1.11.1.min.css" /> -->
	<link rel="stylesheet" type="text/css" media="screen" href="jgrid/css/ui.jqgrid.css" />
	<script src="jgrid/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="jgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
	<script src="jgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
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
        
       /* $(function() {

    		$("#datepicker").datepicker({
    			dateFormat : 'yy-mm-dd' //Input Display Format 변경
    		});
    	}); */

    </script>
    <style>
    	#abcde{display:none};
    	  .select,
	  #locale {
	    width: 100%;
	  }
	  .like {
	    margin-right: 10px;
	  }
    </style>
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
            				<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.priceOpen}" var="commaPrice" />
            				<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.priceHigh}" var="commaPrice2" />
            				<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.priceLow}" var="commaPrice3" />
            				<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.priceClose}" var="commaPrice4" />
            				<%-- <td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> --%>
            				<td align="center" class="listtd"><a href="javascript:chart_open('<c:out value="${result.itemId}"/>','<c:out value="${result.dealDate}"/>','day')"><c:out value="${result.itemId}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.itemName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${commaPrice}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${commaPrice2}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${commaPrice3}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${commaPrice4}"/>&nbsp;</td>
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
	
	/* $("#jqGrid").jqGrid({
		url: 'http://localhost:8080/chart/testajaxed.do',
		datatype: "json",
		 colModel: [
			{ label: 'Category Name', name: 'itemName', width: 75 }
	   	  ],
	   	  viewrecords: true,
	   	  width: 780,
	   	  height: 200,
	   	  rowNum: 10,
	   	  loadonce: true,
	   	  pager: "#jqGridPager",	// 페이징
	   	  }); */

	
	
	
	
	function chart_open(itemId,dealDate,dayType){
		$("#chartid").val(itemId);
		$("#chartdate").val(dealDate);
		// console.log(dayType);
		var dealDate = dealDate;
		var itemId = itemId;

		// $("#avgtable").attr("display","block");	
		
		// console.log(dealDate);
		// console.log(itemId);
	
		var data = {"dealDate": dealDate, "itemId": itemId,"dayType":dayType};
			$.ajax({
			  url : "/chart/testAjax.do"
			, data: data
			, type: "post"
			, resultType: "json"
			, success:function(data){
			          ajaxdata = data.data3;
			          chartDrowFun.chartDrow(); 
			          drawVisualization();
			          //drawDashboard(data.data3);
					  table_chart(data.data4);
					  //gridtable(data.data4);
			  },
			 error:function(jqXHR, textStatus, errorThrown) {
			     alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			     self.close();
			 }               
			 });
		 }
   	 

 		$(document).ready(function() {
 			ajaxfunc();
 		});
 			function ajaxfunc() {
			var DateData = $("#DateData").val();
				
 			if(DateData == null) {
				var dealDate = "2020-01-31";	
 			}else {
 				var dealDate = DateData;
 			}
 			// console.log("ajaxfunc 1번째 함수 실행");
 			// var dealDate = "2020-01-31";
			var data = {"dealDate":dealDate};
			$.ajax({
				url : "/chart/testAjax2.do"
			  , data: data
			  , type: "post"
			  , resultType: "json"
			  , success:function(data) {
				  console.log(data.data);
				  gridtable(data.data);
				  ajaxfunc2(dealDate);
				  
			  },
			  error:function(jqXHR, textStatus, errorThrown) {
				     alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				     self.close();
				 } 
			});			
 		}
		
	

 		
    google.charts.load('current', {'packages':['corechart']}); 
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
					            	  height         	 : 500,
				                      width              : '100%',
				                      hAxis              : {format: chartDateformat }
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
	                                  months: {format: ['MM월']}
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
	 
    
 
    function drawVisualization() {
    	
      // Some raw data (not necessarily accurate)

         /* var dataRow = [];
      	 var data = google.visualization.arrayToDataTable([]);  */
      	 
      	var data = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        data.addColumn('string' , '날짜');
        data.addColumn('number'   , '거래량1');
        data.addColumn('number'   , '60일치');

        var dataRow = [];
         // console.log(ajaxdata);
         // return false;
         
    	 for(var i = 0; i < ajaxdata.length; i++){ //랜덤 데이터 생성
       	  // var year = (ajaxdata[i].dealDate).substring(0,4);
          // var month = (ajaxdata[i].dealDate).substring(4,6);
       	  // var day = (ajaxdata[i].dealDate).substring(6,8);
       	  var dealDate = ajaxdata[i].dealDate;
       	  var volume = ajaxdata[i].volume;
       	  var volumeAvg60 = ajaxdata[i].volumeAvg60;
          //var volumeAvg120 = ajaxdata[i].volumeAvg120;

          dataRow = [dealDate,volume, volumeAvg60];

          data.addRow(dataRow);
         }
      var options = {
        title : 'Monthly Coffee Production by Country',
        vAxis: {title: 'Cups'},
        hAxis: {title: 'Month'},
        seriesType: 'bars',
        series: {0: {type: 'line'}},
        hAxis : {format: 'yyyy년MM월'}
      };

      var chart = new google.visualization.ComboChart(document.getElementById('ComboChart_div'));
      chart.draw(data, options);
      window.addEventListener('resize', function() { chart.draw(data, options); }, false); //화면 크기에 따라 그래프 크기 변경
    }
	
    
    $(document).ready(function(){
  	  google.charts.load('current', {'packages':['line','controls']});
  	  
  	  $('.dayType').on('click',function(){
  		  //alert($(this).val());
  		  var dayType = $(this).val();
	  	  var itemId = $("#chartid").val();
	  	  var dealDate = $("#chartdate").val();
  		  chart_open(itemId,dealDate,dayType);
  	  }); 	  
  	  
  	});
    

	
	function table_chart(chartdata) {
		// console.log(chartdata);
/* 		var objArray = new Array();
		var table_list = [];
		for(var i=0; i < chartdata.length; i++) {
			var dealDate = chartdata[i].dealDate;
			var priceClose = chartdata[i].priceClose;
			var priceAvg5 = chartdata[i].priceAvg5;
			var priceAvg10 = chartdata[i].priceAvg10;
			var priceAvg20 = chartdata[i].priceAvg20;
			var priceAvg60 = chartdata[i].priceAvg60;
			var volume = chartdata[i].volume;
			var volumeAvg5 = chartdata[i].volumeAvg5;
			var volumeAvg20 = chartdata[i].volumeAvg20;
			var volumeAvg60 = chartdata[i].volumeAvg60;
			objArray[i] = ["deal_date"+":"+dealDate, "price_close"+":"+priceClose, "price_avg5"+":"+priceAvg5, "price_avg10"+":"+priceAvg10, "price_avg20"+":"+priceAvg20, "price_avg60"+":"+priceAvg60, "volume"+":"+volume, "volume_avg5"+":"+volumeAvg5, "volume_avg20"+":"+volumeAvg20, "volume_avg60"+":"+volumeAvg60];
	
		} */
		$("#abcde").css("display","block");
		
		$("#tree").empty();
    var optioned = [ 
        {field:"dealDate",      width:100}, 
        {field:"priceClosetbl", width:75}, 
        {field:"priceAvg5tbl",   width:85}, 
        {field:"priceAvg10tbl",   width:85}, 
        {field:"priceAvg20tbl",   width:90}, 
        {field:"priceAvg60tbl",   width:90}, 
        {field:"volumetbl",   width:75}, 
        {field:"volumeAvg5tbl",   width:90}, 
        {field:"volumeAvg20tbl",   width:90},
        {field:"volumeAvg60tbl",   width:90}
    ];
    
/*    	for(var i = 0; i < chartdata.length; i++){
		
		rowItem = "<tr>"
        		rowItem += "<td align='center'>" + chartdata[i].dealDate + "</td>"
        		rowItem += "<td align='left'>" + chartdata[i].priceClosetbl + "</td>"
        		rowItem += "<td align='right'>" + chartdata[i].priceAvg5tbl + "</td>"
        		rowItem += "<td align='right'>" + chartdata[i].priceAvg10tbl + "</td>"
        		rowItem += "<td align='right'>" + chartdata[i].priceAvg20tbl + "</td>"
        		rowItem += "<td align='right'>" + chartdata[i].priceAvg60tbl + "</td>"    		
        		rowItem += "<td align='right'>" + chartdata[i].volumetbl + "</td>"
        		rowItem += "<td align='right'>" + chartdata[i].volumeAvg5tbl + "</td>"
        		rowItem += "<td align='center'>" + chartdata[i].volumeAvg20tbl + "</td>"
        		rowItem += "<td align='center'>" + chartdata[i].volumeAvg60tbl + "</td>"
        		rowItem += "</tr>"
    		
       		$('#tree').append(rowItem);       	
			console.log("chartdata : " + chartdata[i].dealDate);
   	} */
   	
	var dataed = chartdata;
	//console.log(chartdata);	
	var tree = $("#tree");
	var table = $("<table>").appendTo(tree);
	table.css({"width":"845px","border-collapse": "collapse", "border": "0","cellpadding": "0", "cellspacing": "0"});
	// $("#tree").apeend("<tr><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td><td>거래일</td></tr>");
	
	$.each( dataed, function( index, row) {
	var tr = $("<tr>").appendTo(table);
	$.each( optioned, function( i, fieldInfo ) {
	    var td = $("<td>").appendTo(tr);
	    td.html( row[fieldInfo.field]);
	    td.css({"width": fieldInfo.width+"px","height":"30px", "border-bottom": "1px #E7E7E7 solid"});
		}); 
	});
	
	}

	
	
   	/* function gridtable(griddata) {
		
   		$("#gridtable").empty();
        // 변수 선언
        var i, max, myData, grid = $("#gridtable");
		console.log(griddata);
        // grid 설정
        grid.jqGrid({
            datatype: 'json',
            height: 'auto',
            colNames:['itemId','itemName', 'priceOpen', 'priceHigh','priceLow','priceClose','befoprice','befoprice2','volume'],
            colModel:[
                {name:'itemId',index:'itemId', width:75, align:"center",sorttype:"string"},
                {name:'itemName',index:'itemName', width:75, align:"right",sorttype:"string"},
                {name:'priceOpen',index:'priceOpen', width:85, align:"right",sorttype:"int"},
                {name:'priceHigh',index:'priceHigh', width:85, align:"right",sorttype:"int"},
                {name:'priceLow',index:'priceLow', width:85, align:"right",sorttype:"int"},
                {name:'priceClose',index:'priceClose', width:85, align:"right",sorttype:"int"},
                {name:'befoprice',index:'befoprice', width:75, align:"right",sorttype:"int"},
                {name:'befoprice2',index:'befoprice2', width:85, align:"right",sorttype:"int"},
                {name:'volume',index:'volume', width:85, align:"right",sorttype:"int"}
            ],
            multiselect: true,
            caption: "Manipulating Array Data",
            pager: '#pager',
            rowNum: 10

        });
        // 로컬 데이터
        myData = griddata;
        // 데이터 추가
        for( i=0, max = myData.length ; i<=max ; i++ ){
            grid.jqGrid('addRowData', i+1, myData[i]);
        } 
    } */

      function gridtable(griddata) {
    	console.log("gridtable 실행 작동 확인중");
    	// $("#gridtable").empty();
        $("#gridtable").jqGrid({
          datatype: 'local',
          styleUI: 'Foundation',
          data: griddata,
          colModel: [
        	  {name:'itemId',index:'itemId', width:75, align:"center",sorttype:"string"},
              {name:'itemName',index:'itemName', width:75, align:"right",sorttype:"string"},
              {name:'priceOpen',index:'priceOpen', width:85, align:"right",sorttype:"int"},
              {name:'priceHigh',index:'priceHigh', width:85, align:"right",sorttype:"int"},
              {name:'priceLow',index:'priceLow', width:85, align:"right",sorttype:"int"},
              {name:'priceClose',index:'priceClose', width:85, align:"right",sorttype:"int"},
              {name:'befoprice',index:'befoprice', width:75, align:"right",sorttype:"int"},
              {name:'befoprice2',index:'befoprice2', width:85, align:"right",sorttype:"int"},
              {name:'volume',index:'volume', width:85, align:"right",sorttype:"int"}
          ],
          caption : 'Users Grid',
          height: 'auto',
          sortname: 'stock',
          autowidth: false, // 글로벌 옵션 덮어쓰기
          pager: '#pager',
          rowNum: 10
        });
      }

	    $(document).ready(function() {
	    	ajaxfunc2();
	    });
    	function ajaxfunc2(DateData) {
    		
	   		if(DateData == null) {
				var dealDate = "2020-01-31";	
			}else {
				var dealDate = DateData;
			}	

	    	$('#dataTable').DataTable().destroy(); // ajax로 값 불러올시 데이터 삭제해주는 메소드(dataTable에서 적용가능)
	    	// $('#dataTable').prepend('<input type="text" id="toDate" placeholder="yyyy-MM-dd">');
	    	// $('#dataTable').prepend('<input type="text" id="fromDate" placeholder="yyyy-MM-dd">');
		    	
	    	//console.log("data 삭제 기능 확인");
	        $('#dataTable').DataTable({
	            "language": {
	                "emptyTable": "데이터가 없어요.",
	                "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	                "info": "현재 _START_ - _END_ / _TOTAL_건",
	                "infoEmpty": "데이터 없음",
	                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	                "search": "검색: ",
	                "zeroRecords": "일치하는 데이터가 없어요.",
	                "loadingRecords": "로딩중...",
	                "processing":     "잠시만 기다려 주세요...",
	                "paginate": {
	                    "next": "다음",
	                    "previous": "이전"
	                }
	            },
	        	"ajax": "/chart/testAjax2.do?dealDate="+dealDate,
	        	"columns": [
	        		{targets:0, "data": "itemId" },
	        		{targets:1, "data": "itemName","render" : selectTable },
	        		{targets:2, "data": "priceOpen" },
	        		{targets:3, "data": "priceHigh" },
	        		{targets:4, "data": "priceLow" },
	        		{targets:5, "data": "priceClose" },
	        		{targets:6, "data": "befoprice","render" : befoprice  },
	        		{targets:7, "data": "befoprice2","render" : befoprice2 },
	        		{targets:8, "data": "volume" }
	        	]
	        });
    	}
    	// 전일대비값
        function befoprice(val){
       	
       	 var test = val;
   			// test = Math.abs(val);
       	 if(val > 0){
       		 return '<span style="color:red;">▲'+val+'</span>';
       	 }
       	 if(val < 0){
       		 return '<span style="color:blue;">▼'+val+'</span>';
       	 }
       	 if(val == 0){
       		 return '<span>'+val+'</span>';
       	 }
        }
        // 등락률값
        function befoprice2(val){
        	
       	 if(val > 0){
       		 return '<span style="color:red;">+'+val+'</span>';
       	 }
       	 if(val < 0){
       		 return '<span style="color:blue;">'+val+'</span>';
       	 }
       	 if(val == 0){
       		 return '<span>'+val+'</span>';
       	 }
        }	
        
    function selectTable(data, type, row) {
        return data = '<span style="cursor:pointer;cursor:hand" onclick="javascript:chart_open(' + "'" + row.itemId + "'" + ', ' + row.dealDate + ', ' + "'" + 'day' + "'" + ')">' + data + '</span>';
    }
    	
    $('#myTable').DataTable({
        dom: 'Bfrtip',
        buttons: ['colvis', 'excel', 'print']
    });

	
</script>
	<!-- <div id="tree"></div> -->
	<div style="margin-left:10px;width:900px;clear:both ">
        		<table id="abcde" width="845" border="0" cellpadding="0" cellspacing="0" summary="거래일, 종가, 5일, 10일, 20일, 60일, 거래량, 5일, 20일, 60일">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="100"/>
        				<col width="75"/>
        				<col width="85"/>
        				<col width="85"/>
        				<col width="90"/>
        				<col width="90"/>
        				<col width="75"/>
        				<col width="90"/>
        				<col width="90"/>
        				<col width="90"/>
        			</colgroup>
        			<tr>
        				<th align="center" rowspan="2"><spring:message code="title.sample.deal_date" /></th>
        				<th align="center" rowspan="2"><spring:message code="title.sample.price_close" /></th>
        				<th colspan="4">가격이동평균</th>
        				<th align="center" rowspan="2"><spring:message code="title.sample.volume" /></th>
        				<th colspan="3">거래량이동평균</th>
        			</tr>
        			<tr>
        				<th align="center"><spring:message code="title.sample.price_avg5" /></th>
        				<th align="center"><spring:message code="title.sample.price_avg10" /></th>
        				<th align="center"><spring:message code="title.sample.price_avg20" /></th>
        				<th align="center"><spring:message code="title.sample.price_avg60" /></th>
        				<th align="center"><spring:message code="title.sample.volume_avg5" /></th>
        				<th align="center"><spring:message code="title.sample.volume_avg20" /></th>
        				<th align="center"><spring:message code="title.sample.volume_avg60" /></th>
        			</tr>
        		</table>
        		<div id="tree"></div>
        		<div>
				    <table id="gridtable"></table>
        			<div id="pager"></div>
        		</div>   
        		<div>
        			<table id="myTable"></table>
        		</div>
      </div>
<div>
  <input type="text" name="DateData" id="DateData"/>
  <button type="button" onclick="javascript:ajaxfunc()">날짜검색</button>
<!--     <div id="dataTable_filter" class="dataTables_filter">
  	<label>
  		<input type="text" id="toDate" aria-controls="dataTable"/>
  	</label>
 	 </div> -->
  <table id="dataTable" class="display" style="width:100%">
        <thead>
            <tr>
                <th>종목코드</th>
                <th>종목명</th>
                <th>시가</th>
                <th>고가</th>
                <th>저가</th>
                <th>종가</th>
                <th>전일대비</th>
                <th>등락률</th>
                <th>거래량</th>
            </tr>
        </thead>

    </table>
</div>   		
	
	<input type="hidden" id="chartid"/>
	<input type="hidden" id="chartdate"/>
	
    <!-- 그래프 공간  -->
    <div style="clear: both;">
    		
    		<label for="day"><input type="radio" id="day" name="dayType" value="day" class="dayType"/> 일 </label>
    		<label for="week"><input type="radio" id="week" name="dayType" value="week" class="dayType" /> 주</label>
    		<label for="month"><input type="radio" id="month" name="dayType" value="month" class="dayType" /> 월 </label>
    
			<div id="Line_Controls_Chart">
				<!-- 라인 차트 생성할 영역 -->
				<div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
				<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>     
				<!-- 컨트롤바를 생성할 영역 -->
			</div>
    		<div id="ComboChart_div"></div>
    </div>
	
        

</body>
</html>
