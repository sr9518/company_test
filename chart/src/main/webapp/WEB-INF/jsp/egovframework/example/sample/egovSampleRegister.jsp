<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
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
	 <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <c:set var="registerFlag" value="${0 == sampleVO.itemId ? 'create' : 'modify'}"/>
    <title>Sample <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                  <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
    var ajaxdata = {};
    
    $(function(){
    	test();
    });
    
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_egov_save() {
        	frm = document.detailForm;
        	if(!validateSampleVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";
                frm.submit();
            }
        }
        
        	
        function test(){
      	   console.log("call ajax...");
      	   var dealDate = $("#dealDate").val();
     	   var itemId = $("#itemId").val();
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
 	                 initChart(data.data);	 
 	                 readchart(data.data3);
 	                 ajaxdata = data.data3;
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
	     
	     function chartdrow (chartdata) {
	    	 console.log("call chartdata...");
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
        
	     function initChart(obj){
	    	 var exObj = {};
	    	 
	    	/*  console.log(obj);
             console.log(obj.itemId);
             console.log(obj.dealDate);
              */
             var exData = [{
     			type: "spline",
    			name: "Sweden",
    			markerSize: 5,
    	      	axisYType: "secondary",
    			xValueFormatString: "YYYY",
    			yValueFormatString: "#,##0.0\"%\"",
    			showInLegend: true,
    			dataPoints: [
    				{ x: new Date(2004, 00), y: 47.5 },
    				{ x: new Date(2005, 00), y: 84.8 },
    				{ x: new Date(2009, 00), y: 91 },
    				{ x: new Date(2010, 00), y: 90 },
    				{ x: new Date(2011, 00), y: 92.8 },
    				{ x: new Date(2012, 00), y: 93.2 },
    				{ x: new Date(2013, 00), y: 94.8 },
    				{ x: new Date(2014, 00), y: 92.5 }
    			]
    		}];
            
             exObj = {
            	 d  : exData	 
               , d2 : "fff"
             };
             
             //console.log(exObj);
             callChart(exObj);
	     }  
	        
	     
	     function callChart(exData){
	    	 
	    	 console.log(exData.d2);
	    	 
	    	 var chart = new CanvasJS.Chart("chartContainer", {
	        		//theme: "light2", // "light1", "light2", "dark1", "dark2"
	        		animationEnabled: true,
	        		title:{
	        			text: "Internet users"  
	        		},
	        		subtitles: [{
	        			text: "Try Clicking and Hovering over Legends!"
	        		}],
	        		axisX: {
	        			lineColor: "black",
	        			labelFontColor: "black"
	        		},
	        		axisY2: {
	        	      	gridThickness: 0,
	        			title: "% of Population",
	        			suffix: "%",
	        			titleFontColor: "black",
	        			labelFontColor: "black"
	        		},
	        		legend: {
	        			cursor: "pointer",
	        			itemmouseover: function(e) {
	        				e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness * 2;
	        				e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize + 2;
	        				e.chart.render();
	        			},
	        			itemmouseout: function(e) {
	        				e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness / 2;
	        				e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize - 2;
	        				e.chart.render();
	        			},
	        			itemclick: function (e) {
	        				if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	        					e.dataSeries.visible = false;
	        				} else {
	        					e.dataSeries.visible = true;
	        				}
	        				e.chart.render();
	        			}
	        		},
	        		toolTip: {
	        			shared: true
	        		},
	        		data: exData.d
	        	});
	        	chart.render();
	     }
	        
	     
	     window.onload = function () {

	    	 var chart = new CanvasJS.Chart("chartContainer3", {
	    	 	animationEnabled: true,
	    	 	title:{
	    	 		text: "Google - Consolidated Quarterly Revenue",
	    	 		fontFamily: "arial black",
	    	 		fontColor: "#695A42"
	    	 	},
	    	 	axisX: {
	    	 		interval: 1,
	    	 		intervalType: "year"
	    	 	},
	    	 	axisY:{
	    	 		valueFormatString:"$#0bn",
	    	 		gridColor: "#B6B1A8",
	    	 		tickColor: "#B6B1A8"
	    	 	},
	    	 	toolTip: {
	    	 		shared: true,
	    	 		content: toolTipContent
	    	 	},
	    	 	data: [{
	    	 		type: "stackedColumn",
	    	 		showInLegend: true,
	    	 		color: "#696661",
	    	 		name: "Q1",
	    	 		dataPoints: [
	    	 			{ y: 6.75, x: new Date(2010,0) },
	    	 			{ y: 8.57, x: new Date(2011,0) },
	    	 			{ y: 10.64, x: new Date(2012,0) },
	    	 			{ y: 13.97, x: new Date(2013,0) },
	    	 			{ y: 15.42, x: new Date(2014,0) },
	    	 			{ y: 17.26, x: new Date(2015,0) },
	    	 			{ y: 20.26, x: new Date(2016,0) }
	    	 		]
	    	 		}]
	    	 });
	    	 chart.render();

	    	 function toolTipContent(e) {
	    	 	var str = "";
	    	 	var total = 0;
	    	 	var str2, str3;
	    	 	for (var i = 0; i < e.entries.length; i++){
	    	 		var  str1 = "<span style= \"color:"+e.entries[i].dataSeries.color + "\"> "+e.entries[i].dataSeries.name+"</span>: $<strong>"+e.entries[i].dataPoint.y+"</strong>bn<br/>";
	    	 		total = e.entries[i].dataPoint.y + total;
	    	 		str = str.concat(str1);
	    	 	}
	    	 	str2 = "<span style = \"color:DodgerBlue;\"><strong>"+(e.entries[0].dataPoint.x).getFullYear()+"</strong></span><br/>";
	    	 	total = Math.round(total * 100) / 100;
	    	 	str3 = "<span style = \"color:Tomato\">Total:</span><strong> $"+total+"</strong>bn<br/>";
	    	 	return (str2.concat(str)).concat(str3);
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
	          
	          console.log(ajaxdata.length);
	          console.log(ajaxdata[0].priceAvg5);
	         	
	          for(var i = 0; i < ajaxdata.length; i++){ //랜덤 데이터 생성
	        	  var year = (ajaxdata[i].dealDate).substring(0,4);
	        	  var month = (ajaxdata[i].dealDate).substring(4,6);
	        	  var day = (ajaxdata[i].dealDate).substring(6,8);
	        	  var priceAvg5 = ajaxdata[i].priceAvg5;
	        	  var priceAvg10 = ajaxdata[i].priceAvg10;
	        	  var priceAvg20 = ajaxdata[i].priceAvg20;
	        	  var priceAvg60 = ajaxdata[i].priceAvg60;
	        	  var priceAvg120 = ajaxdata[i].priceAvg120;
	 
	            dataRow = [new Date(year, month, day), priceAvg5, priceAvg10 , priceAvg20, priceAvg60, priceAvg120];
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
	                                                                  days  : {format: ['dd일']},
	                                                                  hours : {format: ['HH시']}
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
	                                  days  : {format: ['dd일']},
	                                  hours : {format: ['HH시']}
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
	  chartDrowFun.chartDrow(); //chartDrow() 실행
	});
	    	
	 
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
      // Some raw data (not necessarily accurate)
      
         /* var dataRow = [];
      	 var data = google.visualization.arrayToDataTable([]);  */
      	 
      	var data = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        data.addColumn('datetime' , '날짜');
        data.addColumn('number'   , '거래량1');
        data.addColumn('number'   , '거래량2');
        data.addColumn('number'   , '거래량3');
        data.addColumn('number'   , '거래량4');
        var dataRow = [];
         // console.log(ajaxdata);
         // return false;
         
    	 for(var i = 0; i < ajaxdata.length; i++){ //랜덤 데이터 생성
       	  var year = (ajaxdata[i].dealDate).substring(0,4);
       	  var month = (ajaxdata[i].dealDate).substring(4,6); 
       	  var volumeAvg5 = ajaxdata[i].volumeAvg5;
       	  var volumeAvg20 = ajaxdata[i].volumeAvg20;
       	  var volumeAvg60 = ajaxdata[i].volumeAvg60;
       	  var volumeAvg120 = ajaxdata[i].volumeAvg120;
          //var volumeAvg120 = ajaxdata[i].volumeAvg120;

          dataRow = [new Date(year,month),volumeAvg5, volumeAvg20 , volumeAvg60, volumeAvg120];
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
        series: {5: {type: 'line'}}        };

      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
	     
	     
	     
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<input type="hidden" id="dealDate" name="dealDate" value="${sample.dealDate }"/>
<input type="hidden" id="itemId"  name="itemId" value="${sample.itemId}"/>
<form:form commandName="sampleVO" id="detailForm" name="detailForm">
    <div id="content_pop">
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                    <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                    <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                </li>
    		</ul>
    	</div>
    	<!-- // 타이틀 -->
    	
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
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
    		<c:if test="${registerFlag == 'modify'}">
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
    		</c:if>
    			<tr>
	            	<%-- <td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> --%>
	            	<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${sample.itemId}"/>','<c:out value="${sample.dealDate}"/>')"><c:out value="${sample.itemId}"/></a></td>
	            	<td align="left" class="listtd"><c:out value="${sample.itemName}"/>&nbsp;</td>
	            	<td align="center" class="listtd"><c:out value="${sample.priceOpen}"/>&nbsp;</td>
	            	<td align="center" class="listtd"><c:out value="${sample.priceHigh}"/>&nbsp;</td>
	            	<td align="center" class="listtd"><c:out value="${sample.priceLow}"/>&nbsp;</td>
	            	<td align="center" class="listtd"><c:out value="${sample.priceClose}"/>&nbsp;</td>
            		<fmt:parseNumber var="i" type="number" value="${sample.priceClose-sample2.priceClose}"/>	
            		<c:if test="${i > 0}">
            			<td align="center" class="listtd" style="color:red">▲<fmt:formatNumber type="number" maxFractionDigits="2" value="${sample.priceClose-sample2.priceClose}"/>&nbsp;</td>
            			<td align="center" class="listtd" style="color:red">▲<fmt:formatNumber type="number" maxFractionDigits="2" value="${((sample.priceClose-sample2.priceClose)/(sample.priceClose+(sample.priceClose-sample2.priceClose)))*100}"/>&nbsp;</td>
            		</c:if>
            		<c:if test="${i < 0}">
            			<td align="center" class="listtd" style="color:blue">▼<fmt:formatNumber type="number" maxFractionDigits="2" value="${sample.priceClose-sample2.priceClose}"/>&nbsp;</td>
            			<td align="center" class="listtd" style="color:blue">▼<fmt:formatNumber type="number" maxFractionDigits="2" value="${((sample.priceClose-sample2.priceClose)/(sample.priceClose+(sample.priceClose-sample2.priceClose)))*100}"/>&nbsp;</td>
            		</c:if>
            		<c:if test="${i ==0}">
            			<td align="center" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sample.priceClose-sample2.priceClose}"/>&nbsp;</td>
            			<td align="center" class="listtd"><fmt:formatNumber type="number" maxFractionDigits="2" value="${((sample.priceClose-sample2.priceClose)/(sample.priceClose+(sample.priceClose-sample2.priceClose)))*100}"/>&nbsp;</td>
            		</c:if>
            	    <td align="center" class="listtd"><c:out value="${sample.volume}"/>&nbsp;</td>
               </tr>
    	</table>
      </div>
      <!-- 그래프 공간  -->
      	<div style="clear:both">
	       <div id="chartContainer" style="height: 370px; width: 100%;"></div>
	       <div id="chartContainer2" style="height: 370px; width: 100%;"></div>
	       <div id="chartContainer3" style="height: 370px; width: 100%;"></div>
	       <div id="chart_div" style="height: 370px; width: 100%;"></div>
      	</div>
      	 <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>
    	<div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_selectList();"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_save();">
                            <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                            <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                        </a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_egov_delete();"><spring:message code="button.delete" /></a>
                            <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:document.detailForm.reset();"><spring:message code="button.reset" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
    </div>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="dealDate" value="<c:out value='${searchVO.dealDate}'/>"/>
    <input type="hidden" name="itemId" value="<c:out value='${searchVO.itemId}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>