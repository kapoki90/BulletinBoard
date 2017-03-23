<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="k_deleteOK.jsp" method="post">

		<input type="hidden" name="idx" value="${vo.idx}" /> <input
			type="hidden" name="page" value="${page}" />
		<table>
			<tr>
				<td readonly="readonly">Number: ${vo.idx}</td>
				<td align="right" readonly="readonly">Date: ${vo.wdate}</td>
				<td align="right" readonly="readonly">Ip: ${vo.ip}</td>
			</tr>
			<tr>
				<td>Title:</td>
				<td><input type="text" name="title" value=${vo.title} readonly="readonly"></td>
			</tr>

			<tr>
				<td>Content:</td>
				<td><textarea rows="10" cols="80" name="content" readonly="readonly">${vo.content}</textarea></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Delete" /> <input type="reset" value="Reset" /> <input
					type="button" value="Back to list"
					onclick="location.href='index.jsp?page=${page}'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>