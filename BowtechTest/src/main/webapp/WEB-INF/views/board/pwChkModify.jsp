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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	$('#confirmPw').click(function(){
		var childPw = $('#childPw').val();
		var parentPw = $('#bPw',opener.document).val();
		if(childPw!=parentPw){
			alert('비밀번호가 다릅니다.');
			$('#childPw').val('');
			$('#childPw').focus();
		}else if(childPw==parentPw){
			var bool = confirm('수정페이지로 이동하시겠습니까?');
			if(bool){
				opener.document.writeForm.submit();
				self.close();				
			}else{
				self.close();
			}			
		}
	});	
});
</script>
<body>
<h1>비밀번호를 입력하세요</h1>
<input type="password" id="childPw">
<input type="button" id="confirmPw" value="확인">
</body>
</html>