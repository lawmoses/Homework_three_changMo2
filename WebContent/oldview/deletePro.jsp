<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% 
request.setCharacterEncoding("euc-kr");
%>
<%  
	String boardid = request.getParameter("boardid");
 	if (boardid==null) boardid = "1";
  	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum == "") {
		pageNum = "1";	}
%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String passwd = request.getParameter("passwd");
  BoardDBBean dbPro = BoardDBBean.getInstance();
  int check = dbPro.deleteArticle(num, passwd, boardid); 
  
  if(check==1){
%>	  
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
<% 
	}else{
%>
   <script language="JavaScript">      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
   </script>
<%    } %>