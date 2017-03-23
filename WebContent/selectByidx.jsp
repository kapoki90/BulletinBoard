<%@page import="kr.koreait.Kboard.service.k_updateService"%>
<%@page import="kr.koreait.Kboard.vo.KboardCommentList"%>
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
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		String job = request.getParameter("job");

		k_SelectService service = k_SelectService.getInstance();
		//테이블에서 contentView.jsp로 넘겨줄 글 한 건을 얻어온다.
		KboardVO vo = service.selectByidx(idx);
		
		//request영역으로 k_view에 넘겨줌
		//request.setAttribute("idx", idx);
		request.setAttribute("vo", vo);
		//System.out.println("from selectbyidx:"+vo);
		request.setAttribute("page", currentPage + "");//돌아갈 페이지번호
		request.setAttribute("rn", "\r\n");
		
		
		if (job != null) {
			switch (job) {
			case "reply":
				pageContext.forward("k_reply.jsp");
				break;
			case "update":
				pageContext.forward("k_update.jsp");
				break;
			case "delete":
				pageContext.forward("k_delete.jsp");
				break;
			case "updatecomment":
				pageContext.forward("k_update.jsp");
				break;
			case "deletecomment":
				pageContext.forward("k_delete.jsp");
				break;
			}
		} else {
			
 			int result = k_updateService.getInstance().increment(idx);		// 조회수를 1증가 시킨다.
			
			if(result == 1) {	// 조회수를 증가시킬 글이 테이블에 있는가?
			 	KboardCommentList comment = service.kboardCommentList(idx);
				request.setAttribute("comment", comment); // 댓글 목록을 request 영역에 넣어준다.
				pageContext.forward("k_view.jsp"); 	
			} else {
				out.println("<script>");
				out.println("alert('" + idx + "번 글은 존재하지 않습니다.')");
				out.println("location.href='index.jsp'");
				out.println("</script>");
			}
		}
	%>
</body>
</html>