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
	$('#bName').blur(function(){
		var bNameLength = $(this).val().length;
		if(bNameLength>7){
			alert('작성자 이름은 7글자 까지입니다.');
			$(this).val($(this).val().substring(0,7));
			$(this).focus();
		}
	});
	$('#bName').mouseleave(function(){
		var bNameLength = $(this).val().length;
		if(bNameLength>7){
			alert('작성자 이름은 7글자 까지입니다.');
			$(this).val($(this).val().substring(0,7));
			$(this).focus();
		}
	});
	$('#bName').mousemove(function(){
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
			$(this).focus();
		}
	});
	$('#bTitle').blur(function(){
		var bTitleLength = $(this).val().length;
		if(bTitleLength>30){
			alert('제목은 30글자 까지입니다.');
			$(this).val($(this).val().substring(0,30));
			$(this).focus();
		}
	});
	$('#bTitle').mouseleave(function(){
		var bTitleLength = $(this).val().length;
		if(bTitleLength>30){
			alert('제목은 30글자 까지입니다.');
			$(this).val($(this).val().substring(0,30));
			$(this).focus();
		}
	});
	$('#bTitle').mousemove(function(){
		var bTitleLength = $(this).val().length;
		if(bTitleLength>30){
			alert('제목은 30글자 까지입니다.');
			$(this).val($(this).val().substring(0,30));
			$(this).focus();
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
	$('#bContent').blur(function(){
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
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 비밀번호 정규식  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#bPw').keyup(function(){
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var bool = regex.test($(this).val());
		if(bool==true){
			$('#statusPw').text('사용가능한 비밀번호 입니다.');
			$('#statusPw').css('color','green');
			$('#pwChk').val('true');
		}else{
			$('#statusPw').text('숫자/문자/특수문자 포함 8~15글자 형식을 지켜주세요.');
			$('#statusPw').css('color','red');
			$('#pwChk').val('false');
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 리셋버튼 클릭시  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#resetBtn').click(function(){
		var bNameLength = $('#bName').val().length;
		var bTitleLength = $('#bTitle').val().length;
		var bContetnLength = $('#bContent').val().length;
		if(bNameLength>0||bTitleLength>0||bContetnLength>0){
			var ok = confirm('작성하던 내용이 있습니다. 그래도 지우시겠습니까?');
			if(ok==true){
				location.reload();
			}
		}
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
				/* alert(fileSize); */
			}			
		});
		/* alert('총 파일 사이즈='+fileSize); */
	});	
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 텍스트 에어리어 자동 줄 늘림. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//텍스트 에어리어 자동 줄 늘림.
	$("#bContent").on('keydown keyup mousemove mouseleave', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
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
		<span>WRITE</span>
	</div>
	<div>
		<input type="hidden" id="pwChk">
		<form name="writeForm" action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data" onsubmit="return chkForm()">
			<ul id="writeFormUl">
				<li class="writeFormLi">
					<span class="writeFormContentTitle">작성자</span>
					<input type="text" name="bName" id="bName" required="required" placeholder="작성자 이름 2~7글자">
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">제목</span>
					<input type="text" name="bTitle" id="bTitle" required="required" placeholder="제목 2~30글자">
				</li>
				<li class="writeFormLi">
					<textarea name="bContent" id="bContent" placeholder="내용 400글자 이내"></textarea>
					<div id="bContentCntDiv">
						<span id="bContentCnt">0</span><span>/400</span>
					</div>
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">파일추가</span><span id="addFile">+</span><span id="fileWarningMsg">파일은 총 5개까지 가능합니다.</span>
					<div id="fileDiv">
						<p><input type="file" name="file" class="file"><span class="deleteFile">-</span></p>
					</div>
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">비밀번호</span>
					<input type="password" name="bPw" id="bPw" required="required" placeholder="숫자/문자/특수문자 포함 8~15글자">
					<span id="statusPw"></span>
				</li>
			</ul>
			<div id="btnDiv">
				<input type="submit" value="작성완료" id="submitBtn">
				<input type="button" value="리셋" id="resetBtn">
				<input type="button" value="목록" onclick="location.href='main.do?pageNum=${pageNum}'" id="backBtn">
			</div>
		</form>
	</div>
	
</div>
</body>
</html>