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
</script>
<body>
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
</body>
</html>