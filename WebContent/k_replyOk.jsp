<%@page import="kr.koreait.Kboard.service.k_InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- k_reply.jsp에서 넘어오는 내용이 VO 클래스에 멤버로 있으면 useBean으로 받고 없으면 별도로 받는다. -->
	<%
		request.setCharacterEncoding("UTF-8");
		int currentPage = Integer.parseInt(request.getParameter("page"));
	%>
	<jsp:useBean id="vo" class="kr.koreait.Kboard.vo.KboardVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
	<%
		k_InsertService.getInstance().reply(vo);
		System.out.println("from relpyok:"+vo);
		response.sendRedirect("index.jsp?page="+currentPage);
	%>
</body>
</html>