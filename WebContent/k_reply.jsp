<%@page import="kr.koreait.Kboard.service.k_InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글달기</title>
</head>
<body>
	<form action="k_replyOk.jsp" method="post">
		<!-- 글작성자 ip를 얻어온다 -->
		
		<input type="hidden" name="ip"
			value="${pageContext.request.remoteAddr}" /> 
		<input type="hidden" name="page" value="${page}" />
		<input type="hidden" name="idx" value="${vo.idx}" />
		<input type="hidden" name="ref" value="${vo.ref}" />
		<input type="hidden" name="lev" value="${vo.lev}" />
		<input type="hidden" name="seq" value="${vo.seq}" />
		
		<table align="center" border="1">
			<tr>
				<td>Name : <input type="text" name="name" />
				</td>
				<td>Password : <input type="password" name="password" />
				</td>
			</tr>
			
			<tr>
				<td colspan="2">Title : <input type="text" name="title" size="80" />
				</td>
			</tr>
			<tr>
				<td colspan="2">Content : <textarea rows="10" cols="80"name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Save" /> <input type="reset" value="Reset" /> <input
					type="button" value="Back to list" onclick="location.href='index.jsp'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>