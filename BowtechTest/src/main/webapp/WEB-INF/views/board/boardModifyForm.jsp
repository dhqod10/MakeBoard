<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${conPath }/css/writeForm.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<body>
<script>
$(document).ready(function(){
	var bContentLength = $(this).val().length;
	$('#bContentCnt').text(bContentLength);
	var bNameLength = $('#bName').val().length;
	var bTitleLength = $('#bTitle').val().length;
	var bContetnLength = $('#bContent').val().length;
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 파일 추가 or 빼기 버튼 이벤트  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//추가 이벤트.
	$('#addFile').click(function(){
		var str = '<p><input type="file" name="file" class="file"><span class="deleteFile">-</span></p>';
		var fileCnt = 0;
		$('.file').each(function(idx){
			fileCnt++;
		});
		if(fileCnt>=5){
			alert('파일은 5개까지만 가능합니다.');
		}else{
			$('#fileDiv').append(str);
		}
		$('.deleteFile').click(function(){
			$(this).parent().remove();
		});
	});
	//빼기 이벤트.
	$('.deleteFile').click(function(){
		$(this).parent().remove();
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 작성자 이름 길이 제한  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#bName').keyup(function(){
		var bNameLength = $(this).val().length;
		if(bNameLength>7){
			alert('작성자 이름은 7글자 까지입니다.');
			$(this).val($(this).val().substring(0,7));
			$(this).focus();
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 제목 길이 제한  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#bTitle').keyup(function(){
		var bTitleLength = $(this).val().length;
		if(bTitleLength>30){
			alert('제목은 30글자 까지입니다.');
			$(this).val($(this).val().substring(0,30));
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 내용 길이 제한  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//키업 이벤트.
	$('#bContent').keyup(function(){
		var bContentLength = $(this).val().length;
		$('#bContentCnt').text(bContentLength);
		if(bContentLength>400){
			alert('내용은 400글자 까지입니다.');
			$(this).val($(this).val().substring(0,400));
			bContentLength = $(this).val().length;
			$('#bContentCnt').text(bContentLength);
		}
	});
	//마우스 이벤트(마우스 움직일 때).
	$('#bContent').mousemove(function(){
		var bContentLength = $(this).val().length;
		$('#bContentCnt').text(bContentLength);
		if(bContentLength>400){
			alert('내용은 400글자 까지입니다.');
			$(this).val($(this).val().substring(0,400));
			bContentLength = $(this).val().length;
			$('#bContentCnt').text(bContentLength);
		}
	});
	//마우스 이벤트(마우스 벗어났을 때).
	$('#bContent').mouseleave(function(){
		var bContentLength = $(this).val().trim().length;
		$('#bContentCnt').text(bContentLength);
		if(bContentLength>400){
			alert('내용은 400글자 까지입니다.');
			$(this).val($(this).val().substring(0,400));
			bContentLength = $(this).val().length;
			$('#bContentCnt').text(bContentLength);
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 리셋버튼 클릭시  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#resetBtn').click(function(){
		var bNameLengthNow = $('#bName').val().length;
		var bTitleLengthNow = $('#bTitle').val().length;
		var bContetnLengthNow = $('#bContent').val().length;
		if(bNameLength!=bNameLengthNow||
			bTitleLength!=bTitleLengthNow||
			bContetnLength!=bContetnLengthNow){
			var ok = confirm('작성하던 내용이 있습니다. 그래도 지우시겠습니까?');
			if(ok==true){
				location.reload();
			}else {
				return false;
			}
		}
		location.reload();
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 파일 업로드시 용량 확인  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//동적으로 생성된 태그는 document.on으로 선택해야한다.
	$(document).on('change','.file',function(){
		var fileMaxSize = 1024*1024*5; //최대 파일 사이즈 5MB;
		var fileSize = 0; //모든 파일값의 합.
		var nowFileSize = 0; //현재 파일값.
		var idx=0;
		$('.file').each(function(idx){
			if($(this).val()==''){
				fileSize+=0;
			}else{
				nowFileSize = this.files[0].size;
				fileSize += this.files[0].size;
				if(fileSize>fileMaxSize){ //파일 용량이 MAX값을 초과할 경우.
					var cusFileSize = parseInt((fileSize/(1024*1024))*10)/10;
					alert('파일 용량 5MB를 초과했습니다. ('+cusFileSize+'MB/(5MB)');
					$(this).val('');
					fileSize = fileSize-nowFileSize;
					false;
				}
				alert(fileSize);
			}			
		});
		alert('총 파일 사이즈='+fileSize);
	});	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 텍스트 에어리어 자동 줄 늘림. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//텍스트 에어리어 자동 줄 늘림.
	$("#bContent").on('keydown keyup mousemove mouseleave', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 목록버튼 클릭. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#backBtn').click(function(){
		var pageNum = $('#pageNum').val();
		var bNameLengthNow = $('#bName').val().length;
		var bTitleLengthNow = $('#bTitle').val().length;
		var bContetnLengthNow = $('#bContent').val().length;
		if(bNameLength!=bNameLengthNow||
				bTitleLength!=bTitleLengthNow||
				bContetnLength!=bContetnLengthNow){
			var ok = confirm('작성하던 내용이 있습니다. 목록으로 돌아가시겠습니까?');
			if(ok==true){
				location.href='main.do?pageNum='+pageNum;
			}else {
				return false;
			}
		}
		location.href='main.do?pageNum='+pageNum;
	});
});
</script>
<script>
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 서브밋 확인함수  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
function chkForm(){
	if(writeForm.bName.value.trim()=='' || writeForm.bName.value.length<2){ //작성자 이름 확인.
		alert('작성자 이름이 잘못되었습니다.');
		writeForm.bName.focus();
		return false;
	}else if(writeForm.bTitle.value.trim()=='' || writeForm.bTitle.value.length<2){ //제목 확인.
		alert('제목이 잘못되었습니다.');
		writeForm.bTitle.focus();
		return false;
	}else if(writeForm.bContent.value.trim()==''){ //내용 확인.
		alert('내용을 입력해주세요.');
		writeForm.bContent.focus();
		return false;
	}
	return true;
}
</script>
<div id="writeFormWrap">
	<div id="headline">
		<span>MODIFY</span>
	</div>
	<div>
		<input type="hidden" id="pwChk">
		<form name="writeForm" action="${conPath }/boardModify.do" method="post" enctype="multipart/form-data" onsubmit="return chkForm()">
		<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }">
		<input type="hidden" id="bNum" name="bNum" value="${boardDetail.bNum }">
			<ul id="writeFormUl">
				<li class="writeFormLi">
					<span class="writeFormContentTitle">작성자</span>
					<input type="text" name="bName" id="bName" required="required" placeholder="작성자 이름 2~7글자" value='<c:out value="${boardDetail.bName }"/>'>
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">제목</span>
					<input type="text" name="bTitle" id="bTitle" required="required" placeholder="제목 2~30글자" value='<c:out value="${boardDetail.bTitle }"/>'>
				</li>
				<li class="writeFormLi">
					<textarea name="bContent" id="bContent" placeholder="내용 400글자 이내"><c:out value="${boardDetail.bContent }"/></textarea>
					<div id="bContentCntDiv">
						<span id="bContentCnt">0</span><span>/400</span>
					</div>
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">파일추가</span><span id="addFile">+</span><span id="fileWarningMsg">파일은 총 5개까지 가능합니다.</span>
					<div id="fileDiv">
						<c:forEach var="file" items="${fileList }">
						<p>
							${file.fOrigin_Name }
							<span class="fileSize">(${file.fSize }kb)</span>
							<input type="hidden" class="fileNum" name="fNum" value="${file.fNum }">
							<input type="file" name="file" class="file"><span class="deleteFile">-</span>
						</p>
						</c:forEach>
					</div>
				</li>
			</ul>
			<div id="btnDiv">
				<input type="submit" value="작성완료" id="submitBtn">
				<input type="button" value="리셋" id="resetBtn">
				<input type="button" value="목록" id="backBtn">
			</div>
		</form>
	</div>
</div>
</body>
</html>