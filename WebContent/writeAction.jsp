<%@page import="java.io.PrintWriter" %>
<%@page import="bbs.BbsDAO" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 <!-- User 클래스 기반으로 자바빈즈 생성 -->
 <jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 
<!-- login 페이지에서 온 값을 생성된 자바빈즈에 각각 저장 -->
 <jsp:setProperty name="bbs" property="bbsTitle" />
 <jsp:setProperty name="bbs" property="bbsContent" />
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
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} else{
		// 입력이 안 된 부분 체크
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
	} else{
		// 정상적으로 입력됐으면 글쓰기 로직 시작
	}
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

		if(result == -1){ // DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 실패')");
			script.println("history.back()");
			script.println("</script>");
		}else { // 정상일 때 실행
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
			
		}
	}

	%>
</body>
</html>