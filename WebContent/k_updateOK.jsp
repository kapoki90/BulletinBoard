<%@page import="kr.koreait.Kboard.service.k_updateService"%>
<%@page import="kr.koreait.Kboard.service.k_SelectService"%>
<%@page import="kr.koreait.Kboard.vo.KboardVO"%>
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
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
	%>

	<jsp:useBean id="bean_vo" class="kr.koreait.Kboard.vo.KboardVO">
		<jsp:setProperty property="*" name="bean_vo" />
	</jsp:useBean>
	
	<%
		//	비밀번호를 비교하기 위해 삭제할 글번호에 해당되는 글을 얻어온다.
		KboardVO vo = k_SelectService.getInstance().selectByidx(idx);

		out.println("<script>");
		if (vo.getPassword().trim().equals(bean_vo.getPassword().trim())) {
			k_updateService.getInstance().update(bean_vo);
			out.println("alert('" + bean_vo.getIdx() + "번 글 수정완료!!!')");
		} else {
			out.println("alert('비밀번호가 올바르지 않습니다.')");
		}
		out.println("location.href='index.jsp?page=" + currentPage + "'");
		out.println("</script>");
	%>
</body>
</html>