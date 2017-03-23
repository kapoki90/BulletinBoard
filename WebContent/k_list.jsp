<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="1000" align="center" border="1" width="700">
		<tr>
			<th colspan="6"><h2>Bulletin board</h2></th>
		</tr>
		<tr>
			<td width="130" align="center">Number</td>
			<td width="130" align="center">Writer</td>
			<td width="470" align="center">Title</td>
			<td width="100" align="center">Date</td>
			<td width="70" align="center">Hits</td>
			<td width="100" align="center">IP</td>
		</tr>
		<c:forEach var="vo" items="${list.list}">
			<tr>
				<td><c:forEach var="i" begin="1" end="${vo.lev}" step="1">
				&nbsp;&nbsp;&nbsp;
				</c:forEach> <c:if test="${vo.lev == 0}">
					${vo.idx} 
				</c:if></td>

				<td><c:forEach var="i" begin="1" end="${vo.lev}" step="1">
				&nbsp;&nbsp;&nbsp;
				</c:forEach> ${vo.name}</td>
				<td><c:forEach var="i" begin="1" end="${vo.lev}" step="1">
				&nbsp;&nbsp;&nbsp;
				</c:forEach> <c:if test="${vo.lev > 0}">
					└Re:
				</c:if> 					
					<c:set var="title" value="${vo.title}"/>
					<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
					<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
					<a href="selectByidx.jsp?idx=${vo.idx}&page=${list.currentPage}">
						<span class="notice">${title}</span>
					</a>
					[${vo.commentCount}]</td>
				<td>${vo.wdate}</td>
				<td>${vo.hit}</td>
				<td>${vo.ip}</td>
			</tr>
		</c:forEach>


		<tr>
			<td align="right" colspan="6"><input type="button" value="Write"
				onclick="location.href='k_insert.jsp'" /></td>
		</tr>
		<!-- 페이지 하이퍼링크 -->
		<tr>
			<td><c:if test="${list.getStartPage() > 10}">
			[<a href="index.jsp?page=${list.getStartPage()-1}">Previous</a>]
			</c:if></td>

			<td colspan="4" align="center"><c:forEach var="i"
					begin="${list.startPage}" end="${list.endPage}" step="1">
					<!-- 현재 페이지가 아닐경우 하이퍼링크처리 -->
					<c:if test="${i!=list.currentPage}">
			[<a href="index.jsp?page=${i}">${i}</a>]
			</c:if>
					<c:if test="${i==list.currentPage}">
			[${i}]
			</c:if>
				</c:forEach></td>

			<td><c:if test="${list.getEndPage() < list.getTotalPage()}">
			[<a href="index.jsp?page=${list.getEndPage()+1}">Next</a>]
			</c:if></td>

		</tr>
	</table>
</body>
</html>