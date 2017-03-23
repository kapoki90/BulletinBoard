<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 내용</title>
<script type="text/javascript" src="comment_2.js">
	function chk() {
		f = document.writed_comment;
		if (!f.name.value || f.name.value.trim().length == 0) {
			alert('Please Enter name.');
			f.name.value = "";
			f.name.focus();
			return false;
		}
		if (!f.password.value || f.password.value.trim().length == 0) {
			alert('Please Enter password.');
			f.password.value = "";
			f.password.focus();
			return false;
		}
		if (!f.content.value || f.content.value.trim().length == 0) {
			alert('Please Enter content.');
			f.content.value = "";
			f.content.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<table border="0">
		<tr>
			<!-- ref:어떤글의 답글인가 알아내기위한 변수 -->
			<input type="hidden" name="ref" value="${vo.ref}" />
			<input type="hidden" name="lev" value="${vo.lev}" />
			<input type="hidden" name="seq" value="${vo.seq}" />

			<td>Number: ${vo.idx}</td>
			<td align="center">Date: ${vo.wdate}</td>
			<td align="right">Ip: ${vo.ip}</td>
		</tr>
		<tr>
			<td>Title:</td>
			<td colspan="2"><c:set var="title" value="${vo.title}" /> <c:set
					var="title" value="${fn:replace(title, '>', '&gt;')}" /> <c:set
					var="title" value="${fn:replace(title, '<', '&lt;')}" /> ${title}</td>


		</tr>
		<tr>
			<td>Content:</td>
			<td colspan="2"><textarea rows="10" cols="80" name="content"
					readonly="readonly">${vo.content}</textarea></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="button"
				onclick="location.href='index.jsp?page=${page}'" value="Back to list" /> <input
				type="button" value="Reply"
				onclick="location.href='selectByidx.jsp?idx=${vo.idx}&page=${page}&job=reply'" />
				<input type="button" value="Modify"
				onclick="location.href='selectByidx.jsp?idx=${vo.idx}&page=${page}&job=update'" />
				<input type="button"
				onclick="location.href='selectByidx.jsp?idx=${vo.idx}&page=${page}&job=delete'"
				value="Delete" /></td>
		</tr>
	</table>

	<!-- 댓글입력폼 -->
	<form action="k_commentOK.jsp" method="post" name="writed_comment">
		<table border="0">
			<tr>
				<input type="hidden" name="page" value="${page}" size="5" />
				<input type="hidden" name="idx" value="${vo.idx}" size="5" />
				<input type="hidden" name="ref" value="${vo.idx}" size="5" />
				<input type="hidden" name="mode" value="save" size="5" />
				<input type="hidden" name="ip"
					value="${pageContext.request.remoteAddr}" />

				<td width="50">Name</td>
				<td colspan="2"><input type="text" name="name" /></td>
				<td>Password</td>
				<td colspan="2"><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td valign="middle">Content</td>
				<td colspan="5"><textarea rows="5" cols="70" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="submit" value="Save" onclick="return chk()"/>
					<input class="button" type="reset" value="Reset" /></td>
			</tr>

			<!-- 댓글리스트 -->
			<c:if test="${comment.list.size() == 0}">
				<tr>
					<td colspan="6">No registered comments.</td>
				</tr>
			</c:if>

			<c:if test="${comment.list.size()>=1}">
				<c:forEach var="co" items="${comment.list}">
					<tr>
						<td>Name:</td>
						<td colspan="2"><input type="text" name="name2${co.idx}"
							value="${co.name}"></td>

						<td>Password:</td>
						<td colspan="2"><input type="password"
							name="password2${co.idx}"></td>
					</tr>
					<tr>
						<td valign="middle">Content</td>
						<td colspan="5"><textarea rows="4" cols="70"
								name="content2${co.idx}">${co.content}</textarea></td>
					</tr>
					<tr>
						<td>Date:</td>
						<fmt:setLocale value="en_us"/>
						<td colspan="2"><fmt:formatDate value="${co.writeDate}"
								pattern="yyyy.MM.dd(E)" /></td>
						<td>Modify<input type="radio" name="radiobtn"
							onclick="comment_2('update', '${co.idx}')" /></td>
						<td>Delete<input type="radio" name="radiobtn"
							onclick="comment_2('delete', '${co.idx}')" /></td>
						<td><input type="submit" value="Ok" /></td>
					</tr>
					<tr>
						<td colspan="6"></td>
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>
