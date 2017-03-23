<%@page import="kr.koreait.Kboard.service.k_InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기완료</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="vo" class="kr.koreait.Kboard.vo.KboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	k_InsertService.getInstance().insert(vo);
	response.sendRedirect("index.jsp");
%>
</body>
</html>