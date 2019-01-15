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
<body>
<div id="mainBoardWrap">
	<input type="hidden" value="${paging.currentPage }" id="pageNum">
	<input type="button" value="엑셀다운로드" id="excelDownload" onclick="location.href='${conPath}/excelDownload.do?target=books'">
	<div id="boardTitleHeadline">BOARD</div>
	<div id="searchDiv">
		<input type="checkbox" name="bName" id="searchBname" value="bName"><label for="searchBname" id="bNameLabel">작성자</label>
		<input type="checkbox" name="bTitle" id="searchBtitle" value="bTitle"><label for="searchBtitle" id="bTitleLabel">제목</label>
		<input type="text" name="search" id="search" value="${searchValue }">
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
			<c:set var="num" value="${searchNameTitleMainTot-(paging.startRow-1) }"/>
			<c:forEach items="${searchTitle }" var="b">
			<tr class="boardListContent">
				<c:if test="${b.bStep==0 }">
					<td class="boardListTd">${num }</td>
					<c:set var="num" value="${num-1 }"/>
				</c:if>
				<c:if test="${b.bStep!=0 }">
					<td class="boardListTdReply">[${b.bParentNum }번글의 답변]</td>
				</c:if>
				<td class="boardListTd"><c:out value="${b.bName }"/></td>				
				<td class="boardListTdTitle">
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
							<span style="color:red; font-size: 13px; position: relative; left: 44px;">[원글삭제된 답변글 입니다]</span>
						</c:if>
					</span>					
				</td>
				<td class="boardListTd">${b.bRdate }</td>
				<td class="boardListTd">${b.bHit }</td>
			</tr>			
			</c:forEach>
		</table>
	</div>
	<div id="boardListBtn">
		<input type="button" id="writeFormBtn" value="글쓰기" onclick="location.href='${conPath}/boardWriteForm.do?pageNum=${paging.currentPage }'">
		<input type="button" id="goMain" value="전체보기" onclick="location.href='${conPath}/main.do?pageNum=${paging.currentPage }'">
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