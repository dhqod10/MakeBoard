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
<script>
$(document).ready(function(){
	$('#modifyFormBtn').click(function(){
		var bPw = $('#bPw').val();
		var url = '${conPath}/pwChkModify.do?bPw='+bPw;
		window.open(url,'child' ,'width=500, height=150, left=500'); 
	});
	$('#deleteBtn').click(function(){
		var bPw = $('#bPw').val();
		var bNum = $('#bNum').val();
		var pageNum = $('#pageNum').val();
		var url = '${conPath}/pwChkDelete.do';
		window.open(url,'child' ,'width=500, height=150, left=500');
	});
	/* $('.fileName').click(function(){
		var fNum = $(this).parent().find('.fileNum').val();
		var comSubmit = new ComSubmit();
		location.href="${conPath}/boardFileDownload.do?fNum="+fNum;
	}); */
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 답변달기 버튼 클릭  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//원글의 번호를 갖고가서 원글의 정보를 알아야한다. 동일Group으로 설정, 선 답글들의 Step을 올려야 하기 때문에.
	$('#boardReply').click(function(){
		var bNum = $('#bNum').val();
		var pageNum = $('#pageNum').val();
		location.href="${conPath}/boardReplyForm.do?bNum="+bNum+"&pageNum="+pageNum;
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 작성자 길이제한  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//작성자 길이 제한두기.
	//키업 이벤트.
	$('#cName').keyup(function(){
		var cNameLeng = $(this).val().length;
		if(cNameLeng>6){
			alert('작성자는2~6글자 입니다.');
			$(this).val($(this).val().substring(0,6));
			$(this).focus();
		}
	});
	//해당 테그를 벗어날 경우.
	$('#cName').blur(function(){
		var cNameLeng = $(this).val().length;
		if(cNameLeng>6){
			alert('작성자는2~6글자 입니다.');
			$(this).val($(this).val().substring(0,6));
			$(this).focus();
		}
	});
	//마우스 무브 이벤트.
	$('#cName').mousemove(function(){
		var cNameLeng = $(this).val().length;
		if(cNameLeng>6){
			alert('작성자는2~6글자 입니다.');
			$(this).val($(this).val().substring(0,6));
			$(this).focus();
		}
	});
	//마우스 리브 이벤트.
	$('#cName').mouseleave(function(){
		var cNameLeng = $(this).val().length;
		if(cNameLeng>6){
			alert('작성자는2~6글자 입니다.');
			$(this).val($(this).val().substring(0,6));
			$(this).focus();
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 비밀번호 정규식  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#cPw').keyup(function(){
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var bool = regex.test($(this).val());
		if(bool==true){
			$('#statusCpw').text('사용가능한 비밀번호 입니다.');
			$('#statusCpw').css('color','green');
			$('#cPwChk').val(0);
		}else{
			$('#statusCpw').text('숫자/문자/특수문자 포함 8~15글자 형식을 지켜주세요.');
			$('#statusCpw').css('color','red');
			$('#cPwChk').val(1);
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 내용 길이 제한  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//키업 이벤트.
	$('#cContent').keyup(function(){
		var bContentLength = $(this).val().length;
		$('#cComentCnt').text(bContentLength);
		if(bContentLength>100){
			alert('내용은 100글자 까지입니다.');
			$(this).val($(this).val().substring(0,100));
			bContentLength = $(this).val().length;
			$('#cComentCnt').text(bContentLength);
		}
	});
	//해당 태그를 벗어날 경우.
	$('#cContent').blur(function(){
		var bContentLength = $(this).val().length;
		$('#cComentCnt').text(bContentLength);
		if(bContentLength>100){
			alert('내용은 100글자 까지입니다.');
			$(this).val($(this).val().substring(0,100));
			bContentLength = $(this).val().length;
			$('#cComentCnt').text(bContentLength);
		}
	});
	//마우스 이벤트(마우스 움직일 때).
	$('#cContent').mousemove(function(){
		var bContentLength = $(this).val().length;
		$('#cComentCnt').text(bContentLength);
		if(bContentLength>100){
			alert('내용은 100글자 까지입니다.');
			$(this).val($(this).val().substring(0,100));
			bContentLength = $(this).val().length;
			$('#cComentCnt').text(bContentLength);
		}
	});
	//마우스 이벤트(마우스 벗어났을 때).
	$('#cContent').mouseleave(function(){
		var bContentLength = $(this).val().trim().length;
		$('#cComentCnt').text(bContentLength);
		if(bContentLength>100){
			alert('내용은 100글자 까지입니다.');
			$(this).val($(this).val().substring(0,100));
			bContentLength = $(this).val().length;
			$('#cComentCnt').text(bContentLength);
		}
	});
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글입력 버튼  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$('#comentWrite').click(function(){
		var cName = $('#cName').val();
		var cPwChk = $('#cPwChk').val();
		var cContent = $('#cContent').val();
		var cPw = $('#cPw').val();
		var pageNum = $('#pageNum').val();
		var bNum = $('#bNum').val();
		if(cName.length<2){
			alert('작성자 이름이 잘못되었습니다.');
			$('#cName').focus();
			return false;
		}else if(cPwChk==1){
			alert('비밀번호가 잘못되었습니다.');
			$('#cPw').focus();
			return false;
		}else if(cPwChk==''){
			alert('비밀번호를 입력해주세요.');
			$('#cPw').focus();
		}else if(cContent.trim()==""){
			alert('내용을 입력해주세요.');
			$('#cContent').val($('#cContent').val().trim());
			$('#cContent').focus();
			return false;
		}		
		cName = encodeURI(encodeURIComponent(cName));
		cPw = encodeURI(encodeURIComponent(cPw));
		cContent = encodeURI(encodeURIComponent(cContent));
		$.ajax({
			url:'${conPath}/comentWriteAjax.do',
			type:'get',
			data:'bNum='+bNum+'&cName='+cName+'&cPw='+cPw+'&cContent='+cContent+'&pageNum='+pageNum,
			datatype:'html',
			success: function(data){
				$('#comentListAjaxDiv').html(data);
				$('#cName').val('');
				$('#cContent').val('');
				$('#cPw').val('');
				$('#cPwChk').val(1);
				$('#statusCpw').text('');
			}
		});
	});
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 삭제버튼 클릭시  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//댓글'X'버튼 클릭 시 숨긴 비밀번호 입력창 보이게 하기. 기존 열려있던 창은 닫아야함.
		$('.comentDeleteBtn').each(function(idx){
			$(this).click(function(){
				$('.cDeleteHiddenBox').each(function(idxHiddenBox){
					if(idx==idxHiddenBox){
						$(this).css('display','block');
					}else{
						$(this).css('display','none');
					}
				});
			});
		});
		//댓글 비밀번호 입력창 닫기 클릭시.
		$('.cDeleteCloseBtn').each(function(idx){
			$(this).click(function(){
				$('.cDeleteHiddenBox').each(function(idxHiddenBox){
					if(idx==idxHiddenBox){
						$(this).css('display','none');
					}
				});
			});
		});
		//비밀번호 넣고 확인버튼 클릭시.
		$('.cDeleteOkBtn').each(function(idx){
			$(this).click(function(){
				$('.cDeletePw').each(function(idxPw){
					if(idxPw==idx){
						var originPw = $(this).next().val();
						var nowPw = $(this).val();
						if(originPw==nowPw){						
							var cNum = $(this).siblings('.cNumHidden').val();
							var pageNum = $('#pageNum').val();
							var bNum = $('#bNum').val();
							$.ajax({
								url: '${conPath}/commentDeleteAjax.do',
								type: 'get',
								data: 'cNum='+cNum+'&pageNum='+pageNum+'&bNum='+bNum,
								datatype: 'html',
								success: function(data){
									$('#comentListAjaxDiv').html(data);
								}
							});
						}else {
							alert('비밀번호를 확인해주세요.');
							$(this).val('');
							$(this).focus();
						}
					}
				});
			});
		});
		
	});
</script>
<body>
<div id="writeFormWrap">
	<div id="headline">
		<span>DETAIL</span>
	</div>
	<div>		
		<form name="writeForm" action="${conPath }/boardModifyForm.do" method="get">
		<input type="hidden" name="bPw" id="bPw" value="${boardDetail.bPw }">
		<input type="hidden" name="bNum" id="bNum" value="${boardDetail.bNum }">
		<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum }">
			<ul id="writeFormUl">
				<li class="writeFormLi">
					<span class="writeFormContentTitle">작성자</span>
					<input type="text" name="bName" id="bName" required="required" value='<c:out value="${boardDetail.bName }"/>' readonly="readonly">
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">제목</span>
					<input type="text" name="bTitle" id="bTitle" required="required" value="<c:out value='${boardDetail.bTitle }'/>" readonly="readonly">
				</li>
				<li class="writeFormLi">
					<textarea name="bContent" id="bContent" readonly="readonly"><c:out value="${boardDetail.bContent }"/></textarea>
				</li>
				<li class="writeFormLi">
					<span class="writeFormContentTitle">파일</span>
					<p>
						<c:forEach var="file" items="${fileList }">
							<p>
								<a href="<c:url value='boardFileDownload.do?fNum=${file.fNum}'/>" class="fileName">${file.fOrigin_Name }</a>
								<span class="fileSize">(${file.fSize }kb)</span>
								<input type="hidden" class="fileNum" value="${file.fNum }">
							</p>							
						</c:forEach>
					</p>
				</li>
			</ul>
			<div id="btnDiv">
				<input type="button" value="수정하기" id="modifyFormBtn">
				<input type="button" value="답변달기" id="boardReply">
				<input type="button" value="삭제하기" id="deleteBtn">
				<input type="button" value="목록" onclick="location.href='main.do?pageNum=${param.pageNum}'" id="backBtn">
			</div>
		</form>
	</div>	
	<div id="comentWriteDiv">
		<div id="comentWriteHeadline">
			COMENT WRITE
		</div>
		<div id="comentInputDiv">
			<div id="comentWriterDiv">
				<span class="comentWriterSpan">작성자</span>
				<input type="text" name="cName" id="cName" placeholder="작성자 이름 2~6글자 ">
			</div>
			<div id="comentPWDiv">
				<span class="comentWriterSpan">비밀번호</span>
				<input type="password" name="cPw" id="cPw" placeholder="문자/숫자/특수문자 포함 8~15글자">
				<span id="statusCpw"></span>
				<input type="hidden" id="cPwChk" value="1">
			</div>
		</div>
		<div id="comentTextareaDiv">
			<textarea name="cContent" id="cContent" placeholder="100글자 이내"></textarea>
			<div id="cComentCntDiv">
				<span id="cComentCnt">0</span><span>/100</span>
			</div>
		</div>
		<div id="comentBtnDiv">
			<input type="button" id="comentWrite" value="댓글달기">
			<input type="button" id="comentReset" value="리셋">
		</div>
	</div>
	<div id="comentListDiv">
		<div id="comentListHeadline">
			COMENT LIST
		</div>
		<div id="comentListAjaxDiv">
		<c:if test="${empty comentList }">
			<div id="noComent">댓글이 없습니다.</div>
		</c:if>
		<c:if test="${not empty comentList }">		
		<c:forEach items="${comentList }" var="com">
			<div class="comentListContentDiv">
				<div class="cNameList">
					작성자 : <c:out value="${com.cName }"/>
				</div>
				<div class="cContentList">
					<textarea class="cContentListTextarea"><c:out value="${com.cContent }"/></textarea>					
				</div>
				<div class="cListBtn">
					<input type="button" class="comentDeleteBtn" value="X">					
				</div>
				<div class="cDeleteHiddenBox">
					<span class="cDeleteMsg">PASSWORD</span><span class="cDeleteCloseBtn">X</span>
					<input type="password" class="cDeletePw">
					<input type="hidden" class="cPwList" value='<c:out value="${com.cPw }"/>'>
					<input type="hidden" class="cNumHidden" value='<c:out value="${com.cNum }"/>'>
					<input type="button" class="cDeleteOkBtn" value="OK">
				</div>
			</div>
		</c:forEach>
		</c:if>
		</div>		
	</div>
</div>
</body>
</html>