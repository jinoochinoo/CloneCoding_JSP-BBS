<%@page import="java.io.PrintWriter" %>
<%@page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 <!-- User 클래스 통해 자바빈즈 활용 -->
 <jsp:useBean id="user" class="user.User" scope="page" /> 
<!-- login 페이지에서 온 값 userID, userPassword 자바빈즈에 각각 저장 -->
 <jsp:setProperty name="user" property="userID" />
 <jsp:setProperty name="user" property="userPassword" />
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
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1){
			// 자바스크립트 실행
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			
			// 로그인 성공하면 세션 부여
			session.setAttribute("userID", user.getUserID());
			
		} else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 다릅니다')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>