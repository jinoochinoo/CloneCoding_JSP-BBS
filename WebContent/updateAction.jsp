<%@page import="java.io.PrintWriter" %>
<%@page import="bbs.BbsDAO" %>
<%@page import="bbs.Bbs" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 
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
	}  
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		
		// 'bbsID = 세션ID' 같은지 확인
		// bbs 인스턴스에 전달 받은 bbsID 값으로 데이터 호출
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}  else{// 입력값 확인
		if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				// 정상적으로 입력이 되었다면 글 수정 로직을 수행한다
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정하기 실패')");
					script.println("history.back()");
					script.println("</script>");
				// 글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정하기 성공')");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}
		 %>

</body>
</html>