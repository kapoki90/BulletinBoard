<%@page import="kr.koreait.Kboard.vo.KboardList"%>
<%@page import="kr.koreait.Kboard.service.k_SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//이전 페이지에서 넘어오는 화면에 표시할 페이지번호를 받는다.
		//이전 페이지에서 넘어오는 페이지 번호가 정상적인 숫자라면 넘어온 숫자로 화면에 표시할 페이지 번호를 초기화
		//하고 정상적인 페이지 번호가 넘어오지 않았거나 null이라면 화면에 표시할 페이지 번호는 1을 유지시킨다.
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
		}
		
		KboardList list = k_SelectService.getInstance().selectList(currentPage);
		request.setAttribute("list", list);
		pageContext.forward("k_list.jsp");
	%>
</body>
</html>