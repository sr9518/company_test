/** 공통 스크립트 */

/**
 * 모달 설정
 * 
 * url		: 호출할 페이지 경로 (필수값)
 * modalId	: 모달 아이디 (필수값)
 * modalSize: 모달 사이즈 ( lg: 큰팝업 )
 */
var showModal = function(_option){
	var modalUrl, method, success, data, 
		modalSize, modalId, buttonSet;
	
	// 필수값.
	if(!isEmpty(_option.modalUrl)){
		modalUrl = _option.modalUrl;
	}else{
		alert("필수값 미입력");
		return false;
	}
	
	// 옵션값.
	method 	  = (!isEmpty(_option.method)) 	 ? _option.method  	 : "POST";
	modalId	  = (!isEmpty(_option.modalId))	 ? _option.modalId 	 : "basicModal";
	modalSize = (!isEmpty(_option.modalSize))? _option.modalSize : "";
	buttonSet = (!isEmpty(_option.buttonSet))? _option.buttonSet : "";
	
	if(_option.data != undefined){
		data = _option.data;
		$.ajaxSetup({data: data});
	}
	
	$.ajax({
		url:modalUrl,
		method:method,
		success:function(data){
			
			// 태그 추가
			$("body").append(data);

			// 사이즈 설정
			if(modalSize == "lg"){
				$("#"+modalId).addClass("bs-example-modal-lg");
				$("#"+modalId).children(".modal-dialog").addClass("modal-lg");
			}
			
			if(buttonSet){
				$.each(buttonSet,function(index, item){
					buttonSetting(item);
				});
			}
				
			// 모달 띄우기
			$("#"+modalId).modal({backdrop: 'static', keyboard: false});
			
		},
		error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                + request.responseText + "\n" + "error:"
                + error);
        }
	});
}


//버튼 설정 (기본버튼, 커스텀버튼 분기 처리)
function buttonSetting(_option){
	var btnOptType = typeof(_option);
	
	console.log(typeof(btnOptType));
	if(btnOptType == "string"){
		defaultBtn(_option);
	}else if (btnOptType == "object"){
		coustomBtn(_option);
	}else{
		alert("옵션 형식을 확인하세요.(버튼옵션)");
		return false;
	}
}

function reload(){
	location.reload();
}
//기본 옵션
function defaultBtn(_option){
	var btnType = _option;
	var btnTag = "";
	
	switch(btnType){
		case "save" :
			btnTag 	= '<button type="button" id="save" onClick="saveBtn();" class="btn btn-success btn-sm">저장</button> ';// 버튼 태그
			break;
		case "update" :
			btnTag 	= '<button type="button" id="update" onClick="updateBtn();" class="btn btn-warning btn-sm">수정</button> ';// 버튼 태그
			break;
		case "delete" :
			btnTag 	= '<button type="button" id="delete" onClick="deleteBtn();" class="btn btn-danger btn-sm">삭제</button> ';// 버튼 태그
			break;
	}
	
	$(".modal-btnArea").prepend(btnTag);
}

// 커스텀 옵션
function coustomBtn(_option){
	var btnType,btnTag,addClass,btnTitle,confirmUse,confirmMsg;
	
	btnType = (!isEmpty(_option.type)) ? _option.type : "";	// [필수]
	if(btnType == ""){
		alert("필수값 미입력.."); 
		return false;
	}
	
	// 버튼명
	if(btnType == "save") 		 btnTitle = "저장";
	else if(btnType == "update") btnTitle = "수정";
	else if(btnType == "delete") btnTitle = "삭제";
	else if(btnType == "close")  btnTitle = "닫기";
	else btnTitle = btnType;
	
	// [옵션]
	addClass 	= (!isEmpty(_option.addClass))	 ? _option.addClass   : "btn btn-default btn-sm"; 		// 버튼 스타일 (부트스트랩 버튼 css)
	confirmUse 	= (!isEmpty(_option.confirmUse)) ? _option.confirmUse : false;							// confirmUse : 컨펌 사용여부 ( [기본값] false:사용안함)
	confirmMsg 	= (!isEmpty(_option.confirmMsg)) ? _option.confirmMsg : "저장 하시겠습니까?";				// confirmMsg : 컨펌 내용
	btnTag 	= ' <button type="button" id="'+btnType+'" class="'+ addClass +'">'+btnTitle+'</button>';// 버튼 태그

	// 버튼 추가
	$(".modal-btnArea").prepend(btnTag);

	// 익명함수
	var event = (!isEmpty(_option.click))? _option.click : false;
	if(event){
		$("#"+btnType).on('click',function(e){
			// 컨펌 사용체크
			if(confirmUse){
				if(confirm(confirmMsg)){
					event();
				}
			}else{
				event();
			}
			if(btnType == "close"){
				reload();
				//$("#basicModal").remove();
				//$("body").removeClass("modal-open").attr('style','');
			}
		});
	}
}

/**
 * 부트스트랩 테이블 (grid)
 */
$.fn.initTable = function (_options){
   var $Table = $(this);
   var columsData,pagination,url,onLoadSuccess,onClickRow;
   
   // 필수값
   if(_options.columsData != undefined && _options.url != undefined){
	   columsData = _options.columsData;
	   url = _options.url;
   }else{
	   alert("필수값 미입력...(url, columsData)");
	   return false;
   }
   
   //옵션 기본값 설정
   pagination 	 = (_options.pagination != undefined) 	? _options.pagination 	: true;
   onLoadSuccess = (_options.onLoadSuccess != undefined)? _options.onLoadSuccess: "";
   onClickRow 	 = (_options.onClickRow != undefined) 	? _options.onClickRow 	: "";
   
//   var params = {};
//   $(_options.searchForm).find('input, select').each(function() {
//	   var type = $(this).prop('type');
//	   var tagName = $(this).prop('tagName')
//	   if ('text' == type || 'select' == tagName) {
//		   params[$(this).prop('name')] = this.value;
//	   }
//   });
   
//   console.log('params:');
//   console.log(params);
   
   $Table.bootstrapTable({
     url: url,
     columns: columsData,   		// 컬럼 설정
     pagination: pagination,		// 페이징 설정
     pageSize: 5,					// 페이지 사이
     pageList: "[5,10,20,40,50]",	// 페이지 리스트
     paginationVAlign: "both",		
     paginationDetailHAlign	: "right",
     showRefresh: "true",
	 //showToggle: "true",
	 //showColumns: "true",
     //data:params,
	 queryParams: "searchParams",			// 검색 파라미터
	 //responseHandler: "responseHandler",	// 검색 결과 
     // 로딩 메시지
     formatLoadingMessage: function () {
         return '조회중..';
     },
     // 페이지 옵션
     formatRecordsPerPage: function(pageNumber){
         return pageNumber;
     },
     // 페이지 옵션2 (토탈, 현재페이지 정보)
     formatShowingRows: function(pageFrom, pageTo, totalRows){
         return '<h5>전체 ' + totalRows + ' 건</h5>';
     },
     // 데이터가 성공적으로로드되면 발생
     onLoadSuccess : function(data){
    	 if(onLoadSuccess){
	    	 $.each(onLoadSuccess, function (index, item) { 
	    		 $Table.bootstrapTable(item.option,item.val);
	    	 });
    	 }
     },
     // 행을 클릭했을 때 이벤트 발생..
     onClickRow: function(row, $el, field){
		 if(onClickRow){
			 var data = {};
			 $.each(onClickRow.data, function(key,val){
				data[key] = row[val];
			 });
			 if(onClickRow.modal != undefined){
				 var _thisModal = onClickRow.modal;
				 showModal(_thisModal);
			 }
			 
		 }
		 /*if(onClickRow && onClickRow.modalUse == true){
			 var data = {};

			 $.each(onClickRow.data, function(index,item){
				data[item.field] = row[item.field];
			 });
			 
			 // 모달 호출
			 showModal({
				 modalUrl:onClickRow.modalUrl, 
				 modalId:onClickRow.modalId, 
				 data:data, 
				 modalSize:"lg", 
				 buttonSet : onClickRow.buttonSet 
			 });
		 }*/
     },
     onResetView: function(){
    	tableStyleSet();
     },
     responseHandler: function(res){;
    	 return res;
     }
     
   });   
}

//부트스트랩 테이블 스타일
function tableStyleSet(){
	var put;
	var dropCopy, pageCopy, totalRowCopy;
	
	var $target = $("div.bootstrap-table.bootstrap3 > div.fixed-table-pagination");
	
	// 태그 복제
	totalRowCopy = $target.eq(0).find("div.pagination-detail span.pagination-info > h5").clone("true");
	dropCopy 	 = $target.eq(0).find("div.pagination-detail span.btn-group.dropdown").clone("true");
	
	// 상단 태그 제거
	$target.eq(0).find("div").detach();	// 상단 페이지네이션, limit박스 제거
	$("div.bootstrap-table.bootstrap3 > .fixed-table-toolbar").detach();	// 상단 툴바 제거
	// 상단 태그 추가
	$target.eq(0).find("div.pagination-detail").html(dropCopy);	// limit 박스 추가
	$(".totalRow").html(totalRowCopy);	// total 추가
	$(".tableFrmGroup").html(dropCopy).css("display","inline-block");	// limit 박스 추가, 스타일 변경
	
	// 하단 태그 제거
	$target.eq(1).find("div.pagination-detail").remove();	// 하단 페이지정보 제거
	$target.eq(1).css("text-align","center").find(".pagination").removeClass("pull-right");	// 하단 페이지네이션 스타일 변경(가운데정렬)
}

// 빈값체크
var isEmpty = function(value){ 
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true 
	}else{ 
		return false 
	} 
};

//input name(태그 네임) == data key(데이터 키 값)
//입력 태그에 값 넣기
var addValue = function (data){
	$.each(data, function(key, value){
		$("form").find("input[name='" + key + "']").val(value);
		$("form").find("select[name='" + key + "']").val(value);
		$("form input:radio[name='" + key + "'][value='" + value + "']").prop('checked', true);
		$("form input:checkbox[name='" + key + "'][value='" + value + "']").prop('checked', true);
	});
}

/**
 * form 태그 쿼리스트링으로 반환.
 */
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();

    console.log("쿼리스트링반환 call");
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }

            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });

    return o;

};

/**
 * 프로그래스바 on/off
 * @returns
 */
function showLoading() {

}
function hideLoading() {

}

/**
 * 공통 Ajax Call
 */
jQuery.ajaxCall = function(options) {
    var default_value =  {
        timeout : 15 * 1000
        , async : true
        , cache: false
        , dataType: "json"
        , type: "POST"
        , contentType : "application/x-www-form-urlencoded; charset=UTF-8"
        , bLoading : "Y"
    };
    var opts = $.extend({}, default_value, options);

    /*
    // 검색 조건
    var autoHistory = setHistoryAction();
    opts.data.autoHistory = autoHistory;
    */
    var xhr = this.ajax({
        url: opts.url,
        timeout: opts.timeout,
        async: opts.async,
        cache: opts.cache,
        type: opts.type,
        processData: opts.processData,
        contentType: opts.contentType,
        dataType: opts.dataType,
        data: opts.data,
        beforeSend: function(xhr, settings) {
            if(opts.bLoading == "Y") {
                showLoading();	// 로딩 시작
            }
            xhr.setRequestHeader("call_type", "ajax");
            if (opts.beforeSend) {
                opts.beforeSend(xhr, settings);
            }
        },
        success: function (data, textStatus, xhr) {
            if (opts.success) {
                hideLoading();	//로딩 끝
                try{
                    opts.success(data, textStatus, xhr);
                } catch(e){
                    alert("화면 로딩 중 에러가 발생했습니다. \nerr_message : " + e);
                    return;
                }
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            if(xhr.responseText != undefined) {
                if(xhr.responseText.indexOf("<title>Login Error</title>") > 0) {
                    top.location.href="/manager/login.do";
                    return;
                }
            }

            hideLoading();	//로딩 끝
            if (opts.error) {
                opts.error(xhr, textStatus, errorThrown);
            }
        },
        complete: function (xhr, textStatus) {
            hideLoading();	//로딩 끝
            if (opts.complete) {
                opts.complete(xhr, textStatus);
            }
        }
    });
    return xhr;
};

/**
 * ajax form 전송
 * 
 * @param frmId	: form 아이디
 * @param v_url	: url
 * @param v_msg	: 결과 메세지
 * @returns
 */
function fnSave(param,v_msg,v_url) {
    console.log("fnSave..call()",param,v_msg,v_url);
    
    $.ajaxCall({
        url : v_url,
        data : param,
        success : function(data) {
            if (data.result > 0) {
                alert(v_msg);
                fnGoList();
            } else {
                alert("실패하였습니다.");
                return false;
            }
        }
    });

}

