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
<link href="${conPath }/css/boardList.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	$('#searchBtn').click(function(){
		var boolBname = $('#searchBname').is(':checked');
		var boolBtitle = $('#searchBtitle').is(':checked');
		var searchValue = $('#search').val();
		var pageNum = $('#pageNum').val();
		searchValue = encodeURI(encodeURIComponent(searchValue)); 
		if(boolBname==true && boolBtitle==false){
			//작성자 이름으로 검색.
			alert(searchValue);
			location.href='${conPath}/searchName.do?searchValue='+searchValue;
		}else if(boolBname==false && boolBtitle==true) {
			//제목으로 검색.
			location.href='${conPath}/searchTitle.do?searchValue='+searchValue;
		}else if(boolBname==true && boolBtitle==true) {
			//작성자와 제목모두 검색.
			location.href='${conPath}/searchNameTitle.do?searchValue='+searchValue;
		}else {
			//전체 리스트 불러오기.
			alert('검색 조건을 선택해주세요');
			$('#search').focus();
		}
	});
});
</script>
<body>
<div id="mainBoardWrap">
	<input type="hidden" value="${paging.currentPage }" id="pageNum">
	<input type="button" value="전체 목록 " id="excelDownloadListAll" onclick="location.href='${conPath}/excelDownload.do?target=excelDownloadListAll&startRow=${paging.startRow }&endRow=${paging.endRow }'">
	<input type="button" value="현재 목록 " id="excelDownloadNowPage" onclick="location.href='${conPath}/excelDownload.do?target=excelDownloadNowPage&startRow=${paging.startRow }&endRow=${paging.endRow }'">
	<div id="boardTitleHeadline">BOARD</div>
	<div id="searchDiv">
		<input type="checkbox" name="bName" id="searchBname" value="bName"><label for="searchBname" id="bNameLabel">작성자</label>
		<input type="checkbox" name="bTitle" id="searchBtitle" value="bTitle"><label for="searchBtitle" id="bTitleLabel">제목</label>
		<input type="text" name="search" id="search">
		<input type="button" id="searchBtn" value="검색">
	</div>
	<div id="boardListTable">
		<table>
			<tr id="boardListSubject">
				<td class="boardListTd">No</td>
				<td class="boardListTd">Writer</td>
				<td class="boardListTdTitleSubject">Title</td>
				<td class="boardListTd">Date</td>
				<td class="boardListTd">Hits</td>
			</tr>			
			<c:set var="num" value="${boardTot-(paging.startRow-1) }"/>
			<c:forEach items="${boardList }" var="b">
			<tr class="boardListContent">
				<c:if test="${b.bStep==0 }">
					<td class="boardListTd">${num }</td>
				</c:if>
				<c:if test="${b.bStep!=0 }">
					<td class="boardListTdReply">${num }[답글]</td>
				</c:if>
				<td class="boardListTd"><c:out value="${b.bName }"/></td>				
				<td class="boardListTdTitle">					
					<c:if test="${b.bStatus==0 }">
						<c:forEach var="i" begin="1" end="${b.bIndent }">
						<c:if test="${i==b.bIndent }">&nbsp;<b>ㄴ</b></c:if>
						<c:if test="${i!=b.bIndent }">&nbsp;</c:if>
					</c:forEach>
						<c:set var="TitleLength" value="${fn:length(b.bTitle) }"/>
						<a href="${conPath }/boardDetail.do?bNum=${b.bNum }&pageNum=${paging.currentPage}">
							<c:if test="${TitleLength>20 }">
								<c:out value="${fn:substring(b.bTitle,0,20) }"/>...
							</c:if>
							<c:if test="${TitleLength<=20 }">
								<c:out value="${b.bTitle }"/>
							</c:if>
						</a>					
						<span class="fileImg" style="position: relative;">
							<c:if test="${b.fileCnt>0 }">
								<img style="width:25px; position:absolute; top: 0px;" src="${conPath }/usingImg/pict--file-computer-pictograms-vector-stencils-library.png" alt="disImg">
							</c:if>
							<c:if test="${b.commentCnt!=0 }">
								<span style="color:red; font-size:13px; position: absolute; left: 25px;">[${b.commentCnt }]</span>
							</c:if>
							<c:if test="${b.parentStatus==1 }">
								<span style="color:red; font-size: 13px; position: relative; left: 44px;">[원글이 삭제된 답변글 입니다]</span>
							</c:if>
						</span>	
					</c:if>
					<c:if test="${b.bStatus!=0 }">
						<span id="deletedText">
							<c:forEach var="i" begin="1" end="${b.bIndent }">
								<c:if test="${i==b.bIndent }">&nbsp;<b>ㄴ</b></c:if>
								<c:if test="${i!=b.bIndent }">&nbsp;</c:if>
							</c:forEach>
							작성자에 의해 삭제된 글 입니다.
						</span>
					</c:if>								
				</td>
				<td class="boardListTd">${b.bRdate }</td>
				<td class="boardListTd">${b.bHit }</td>
			</tr>
			<c:set var="num" value="${num-1 }"/>		
			</c:forEach>
		</table>
	</div>
	<div id="boardListBtn">
		<input type="button" id="writeFormBtn" value="글쓰기" onclick="location.href='${conPath}/boardWriteForm.do?pageNum=${paging.currentPage }'">
	</div>
	<div id="boardPageDiv">
		<div class="startPage"><a href="${conPath }/main.do?pageNum=1">◀◀</a></div>
		<c:if test="${paging.startPage>paging.blockSize }">
			<span><a href="${conPath }/main.do?pageNum=${paging.startPage-1 }">◀</a></span>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i==paging.currentPage }">
				<div class="pageNum pageNumSelected"><b>${i }</b></div>
			</c:if>
			<c:if test="${i!=paging.currentPage }">
				<div class="pageNum"><a href="${conPath }/main.do?pageNum=${i }">${i }</a></div>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<span><a href="${conPath }/main.do?pageNum=${paging.endPage+1 }">▶</a></span>
		</c:if>
		<div class="endPage"><a href="${conPath }/main.do?pageNum=${paging.pageCnt }">▶▶</a></div>
	</div>
</div>
</body>
</html>