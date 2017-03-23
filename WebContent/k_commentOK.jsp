<%@page import="kr.koreait.Kboard.service.k_updateService"%>
<%@page import="kr.koreait.Kboard.service.k_SelectService"%>
<%@page import="kr.koreait.Kboard.vo.KboardCommentVO"%>
<%@page import="kr.koreait.Kboard.service.k_DeleteService"%>
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
	<%
		//	한글 깨짐 방지하고 FreeboardCommentVO 클래스의 멤버는 useBean으로 받고 나머지는 별도로 받는다.
		request.setCharacterEncoding("UTF-8");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String mode = request.getParameter("mode");
		String name2 = request.getParameter("name2"+request.getParameter("idx"));
		String password2 = request.getParameter("password2"+request.getParameter("idx"));
		String content2 = request.getParameter("content2"+request.getParameter("idx"));
		
	%>
	<jsp:useBean id="vo" class="kr.koreait.Kboard.vo.KboardCommentVO">
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
	<%
		
		KboardCommentVO covo = k_SelectService.getInstance().selectByidx_co(idx);
		out.println("<script>");
		switch (mode) {
		//암호비교를 위해 idx로 KboardCommentVO 객체 생성
		case "save":
			k_InsertService.getInstance().insertComment(vo);
			break;
		case "update":
			System.out.println(mode);
			vo.setName(name2);vo.setContent(content2);vo.setPassword(password2);
			if (covo.getPassword().trim().equals(vo.getPassword().trim())) {
				k_updateService.getInstance().updateComment(vo);
				out.println("alert('" +"number :"+ idx + " Modification Complete.')");
			} else {
				out.println("alert('Incorrect password.')");
			}
			break;

		case "delete":
			System.out.println("name2: "+name2+"password2 "+password2+"content2: "+content2);
			vo.setPassword(password2);
			if (covo.getPassword().trim().equals(vo.getPassword().trim())) {
				k_DeleteService.getInstance().deleteComment(idx);
				out.println("alert('" +"number :"+ idx + " Deletion complete.')");
			} else {
				out.println("alert('Incorrect password.')");
			}
			break;
		}
		out.println("location.href='selectByidx.jsp?page=" + currentPage + "&idx=" + vo.getRef() + "'");
		out.println("</script>");
		//response.sendRedirect("selectByidx.jsp?page=" + currentPage + "&idx=" + vo.getRef());
		
		
	%>

</body>
</html>