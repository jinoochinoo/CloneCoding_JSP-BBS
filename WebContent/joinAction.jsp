<%@page import="java.io.PrintWriter" %>
<%@page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 <!-- User 클래스 기반으로 자바빈즈 생성 -->
 <jsp:useBean id="user" class="user.User" scope="page" /> 
<!-- login 페이지에서 온 값을 생성된 자바빈즈에 각각 저장 -->
 <jsp:setProperty name="user" property="userID" />
 <jsp:setProperty name="user" property="userPassword" />
 <jsp:setProperty name="user" property="userName" />
 <jsp:setProperty name="user" property="userGender" />
 <jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JINWOO JSP BBS</title>
</head>
<body>
	<%
	//세션 상태 체크
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	//이미 세션 존재하면 로그인 차단
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 중입니다')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
		user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			
			//세션 부여
			session.setAttribute("userID", user.getUserID());
			}
		}
	%>
</body>
</html>