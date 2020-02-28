<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">

<script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table-locale-all.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/extensions/export/bootstrap-table-export.min.js"></script>
<style>
	a {text-decoration:none};
	 .select,
  #locale {
    width: 100%;
  }
  .like {
    margin-right: 10px;
  }
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		var usertype = document.getElementById('usertype').value;
		var bong = document.getElementById('bong').value;
		var bun = document.getElementById('bun').value;
		var search = document.getElementById('search').value;
		var text = document.getElementById('text').value;
		location.href = "list?page=${pageMaker.page}&perPageNum="+sel+"&usertype="+usertype+"&bong="+bong+"&bun="+bun+"&search="+search+"&text="+text;
	}
	function searchBtn() {
		var usertype = document.getElementById('usertype').value;
		var bong = document.getElementById('bong').value;
		var bun = document.getElementById('bun').value;
		var search = document.getElementById('search').value;
		var text = document.getElementById('text').value;
		location.href = "list?page=${pageMaker.page}&perPageNum=${pageMaker.perPageNum}&usertype="+usertype+"&bong="+bong+"&bun="+bun+"&search="+search+"&text="+text;
	}
	
</script>
</head>
<body>
	<table id="jqGrid"></table>
	<div>
		<select name="usertype" id="usertype">
			<option value="0">전체</option>
			<option value="1">번역봉사자</option>
			<option value="2">기관방문</option>
			<option value="3">일반</option>
			<option value="4">신청 일시중지</option>
			<option value="5">페널티 일시중지</option>
			<option value="6">직원 일시중지</option>
			<option value="7">활동재개테스트</option>
		</select>

		
		<select name="bong" id="bong">
			<option value="">전체</option>
			<option value="0">새싹</option>
			<option value="1">열매</option>
		</select>
		
		<select name="bun" id="bun">
			<option value="0">모두</option>
			<option value="1">아동서신</option>
			<option value="2">후원자서신</option>
		</select>
		<%-- <c:out value="${list.bun eq '2' ? 'selected' : '' }"/> --%>
		<select name="search" id="search">
			<option value="n">이름</option>
			<option value="im">아이디/이메일</option>
			<option value="p">휴대전화</option>
			<option value="s">담당직원</option>
		</select>
		<input type="text" id="text" name="text">
		<input type="button" onclick="searchBtn()" id="searchBtn" value="검색">
		
	</div>
	<div style="height:30px">
		<div style="float:left">
			총  ${pageMaker.totalCount }명 
		</div>
		<div style="float:right">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option>선택</option>
				<option value="10">
					<c:if test="${pageMaker.perPageNum == 10 }">selected</c:if>10건</option>
				<option value="20">
					<c:if test="${pageMaker.perPageNum == 20 }">selected</c:if>20건</option>
				<option value="30">
					<c:if test="${pageMaker.perPageNum == 30 }">selected</c:if>30건</option>
				<option value="50">
					<c:if test="${pageMaker.perPageNum == 50 }">selected</c:if>50건</option>
			</select>
		</div>
	</div>
	<table>
		<tr>
			<td>NO</td>
			<td>유형구문</td>
			<td>봉사단계</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>아이디</td>
			<td>이메일</td>
			<td>번역구분</td>
			<td>담당직원</td>
			<td>가입일</td>
		</tr>
		<c:forEach items="${list }" var="list">	
			<tr>
				<td>${list.id }</td>
				<td>
					<c:choose>
						<c:when test="${list.usertype eq '0'}">
							전체
						</c:when>
						<c:when test="${list.usertype eq '1'}">
							번역봉사자
						</c:when>
						<c:when test="${list.usertype eq '2'}">
							기관방문
						</c:when>
						<c:when test="${list.usertype eq '3'}">
							일반
						</c:when>
						<c:when test="${list.usertype eq '4'}">
							신청 일시중지
						</c:when>
						<c:when test="${list.usertype eq '5'}">
							페널티 일시중지
						</c:when>
						<c:when test="${list.usertype eq '6'}">
							직원 일시중지
						</c:when>
						<c:when test="${list.usertype eq '7'}">
							활동재개테스트
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.bong eq '0'}">
							새싹
						</c:when>
						<c:when test="${list.bong eq '1'}">
							열매
						</c:when>
					</c:choose>
				</td>
				<td><a href="content?id=${list.id }">${list.name }</a></td>
				<td>${list.birth }</td>
				<td>${list.userid }</td>
				<td>${list.email }</td>
				<td>
					<c:choose>
						<c:when test="${list.bun eq '0'}">
							모두
						</c:when>
						<c:when test="${list.bun eq '1'}">
							아동서신
						</c:when>
						<c:when test="${list.bun eq '2'}">
							후원자서신
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.staff eq '0'}">
							김직원
						</c:when>
						<c:when test="${list.staff eq '1'}">
							이직원
						</c:when>
						<c:when test="${list.staff eq '2'}">
							박직원
						</c:when>
					</c:choose>
				</td>
				<td>${list.writeday }</td>
			</tr>
		</c:forEach>
	</table>
	
<ul style="display:flex; list-style:none;padding-left:350px;">
   <c:if test="${pageMaker.prev}">
      <li><a href="list${pageMaker.makeQuery(pageMaker.startPage -1)}">&laquo;</a></li>
   </c:if>
 
   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
       <li style="padding-left:15px"
         <c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />
        >
         <a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
   </c:forEach> 
    
   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
      <li><a href="list${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
   </c:if>
</ul>
		<span style="float:right">
			<input type="button" onclick="location.href='write2'" value="등록">
		</span>       
		
		<div class="toolbar">
  <button id="load" class="btn btn-secondary">Load 10000 Rows</button>
  <button id="append" class="btn btn-secondary">Append 10000 Rows</button>
  Total rows: <span id="total"></span>
</div>

<div class="select">
  <select class="form-control" id="locale">
    <option value="af-ZA">af-ZA</option>
    <option value="ar-SA">ar-SA</option>
    <option value="ca-ES">ca-ES</option>
    <option value="cs-CZ">cs-CZ</option>
    <option value="da-DK">da-DK</option>
    <option value="de-DE">de-DE</option>
    <option value="el-GR">el-GR</option>
    <option value="en-US" selected>en-US</option>
    <option value="es-AR">es-AR</option>
    <option value="es-CL">es-CL</option>
    <option value="es-CR">es-CR</option>
    <option value="es-ES">es-ES</option>
    <option value="es-MX">es-MX</option>
    <option value="es-NI">es-NI</option>
    <option value="es-SP">es-SP</option>
    <option value="et-EE">et-EE</option>
    <option value="eu-EU">eu-EU</option>
    <option value="fa-IR">fa-IR</option>
    <option value="fi-FI">fi-FI</option>
    <option value="fr-BE">fr-BE</option>
    <option value="fr-FR">fr-FR</option>
    <option value="he-IL">he-IL</option>
    <option value="hr-HR">hr-HR</option>
    <option value="hu-HU">hu-HU</option>
    <option value="id-ID">id-ID</option>
    <option value="it-IT">it-IT</option>
    <option value="ja-JP">ja-JP</option>
    <option value="ka-GE">ka-GE</option>
    <option value="ko-KR">ko-KR</option>
    <option value="ms-MY">ms-MY</option>
    <option value="nb-NO">nb-NO</option>
    <option value="nl-NL">nl-NL</option>
    <option value="pl-PL">pl-PL</option>
    <option value="pt-BR">pt-BR</option>
    <option value="pt-PT">pt-PT</option>
    <option value="ro-RO">ro-RO</option>
    <option value="ru-RU">ru-RU</option>
    <option value="sk-SK">sk-SK</option>
    <option value="sv-SE">sv-SE</option>
    <option value="th-TH">th-TH</option>
    <option value="tr-TR">tr-TR</option>
    <option value="uk-UA">uk-UA</option>
    <option value="ur-PK">ur-PK</option>
    <option value="uz-Latn-UZ">uz-Latn-UZ</option>
    <option value="vi-VN">vi-VN</option>
    <option value="zh-CN">zh-CN</option>
    <option value="zh-TW">zh-TW</option>
  </select>
</div>

<div id="toolbar">
  <button id="remove" class="btn btn-danger" disabled>
    <i class="glyphicon glyphicon-remove"></i> Delete
  </button>
</div>
<table
  id="table"
  data-toolbar="#toolbar"
  data-search="true"
  data-show-refresh="true"
  data-show-toggle="true"
  data-show-fullscreen="true"
  data-show-columns="true"
  data-show-columns-toggle-all="true"
  data-detail-view="true"
  data-show-export="true"
  data-click-to-select="true"
  data-detail-formatter="detailFormatter"
  data-minimum-count-columns="2"
  data-show-pagination-switch="true"
  data-pagination="true"
  data-id-field="id"
  data-page-list="[10, 25, 50, 100, all]"
  data-show-footer="true"
  data-side-pagination="server"
  data-url="https://examples.wenzhixin.net.cn/examples/bootstrap_table/data"
  data-response-handler="responseHandler">
  	<c:forEach items="${list }" var="list">	
  		<tr>
  			<td>${list.name }</td>
  			<td>${list.userid }</td>
  			<td>${list.birth }</td>
  		</tr>
  	</c:forEach>
</table>

<script>
  var $table = $('#table')
  var $remove = $('#remove')
  var selections = []

  function getIdSelections() {
    return $.map($table.bootstrapTable('getSelections'), function (row) {
      return row.id
    })
  }

  function responseHandler(res) {
    $.each(res.rows, function (i, row) {
      row.state = $.inArray(row.id, selections) !== -1
    })
    return res
  }

  function detailFormatter(index, row) {
    var html = []
    $.each(row, function (key, value) {
      html.push('<p><b>' + key + ':</b> ' + value + '</p>')
    })
    return html.join('')
  }

  function operateFormatter(value, row, index) {
    return [
      '<a class="like" href="javascript:void(0)" title="Like">',
      '<i class="fa fa-heart"></i>',
      '</a>  ',
      '<a class="remove" href="javascript:void(0)" title="Remove">',
      '<i class="fa fa-trash"></i>',
      '</a>'
    ].join('')
  }

  window.operateEvents = {
    'click .like': function (e, value, row, index) {
      alert('You click like action, row: ' + JSON.stringify(row))
    },
    'click .remove': function (e, value, row, index) {
      $table.bootstrapTable('remove', {
        field: 'id',
        values: [row.id]
      })
    }
  }

  function totalTextFormatter(data) {
    return 'Total'
  }

  function totalNameFormatter(data) {
    return data.length
  }

  function totalPriceFormatter(data) {
    var field = this.field
    return '$' + data.map(function (row) {
      return +row[field].substring(1)
    }).reduce(function (sum, i) {
      return sum + i
    }, 0)
  }

  function initTable() {
    $table.bootstrapTable('destroy').bootstrapTable({
      height: 550,
      locale: $('#locale').val(),
      columns: [
        [{
          field: 'state',
          checkbox: true,
          rowspan: 2,
          align: 'center',
          valign: 'middle'
        }, {
          title: 'Item ID',
          field: 'id',
          rowspan: 2,
          align: 'center',
          valign: 'middle',
          sortable: true,
          footerFormatter: totalTextFormatter
        }, {
          title: 'Item Detail',
          colspan: 3,
          align: 'center'
        }],
        [{
          field: 'name',
          title: 'Item Name',
          sortable: true,
          footerFormatter: totalNameFormatter,
          align: 'center'
        }, {
          field: 'price',
          title: 'Item Price',
          sortable: true,
          align: 'center',
          footerFormatter: totalPriceFormatter
        }, {
          field: 'operate',
          title: 'Item Operate',
          align: 'center',
          clickToSelect: false,
          events: window.operateEvents,
          formatter: operateFormatter
        }]
      ]
    })
    $table.on('check.bs.table uncheck.bs.table ' +
      'check-all.bs.table uncheck-all.bs.table',
    function () {
      $remove.prop('disabled', !$table.bootstrapTable('getSelections').length)

      // save your data, here just save the current page
      selections = getIdSelections()
      // push or splice the selections if you want to save all data selections
    })
    $table.on('all.bs.table', function (e, name, args) {
      console.log(name, args)
    })
    $remove.click(function () {
      var ids = getIdSelections()
      $table.bootstrapTable('remove', {
        field: 'id',
        values: ids
      })
      $remove.prop('disabled', true)
    })
  }

  $(function() {
    initTable()

    $('#locale').change(initTable)
  })
</script>
</body>
</html>