<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job_Portal</title>
    <%@ include file="all_component/all_css.jsp" %>
  </head>
  <style>
  .back-img{
	background-image:url("image/image2.jpg");
	width:100%;
	height:80vh;
	background-repeat:no-repeat;
	background-size:cover;
	
}
.zoom-img {
    width: 100%;
    transition: transform 0.3s ease;
  
}
.zoom-img:hover {
    transform: scale(1.7);
    background:white;
}

  
  </style>
  <body>
    <%@ include file="all_component/navbar.jsp" %>
    
   <%--  DEMO CODE FOR COMMECTION OBJECT
   <% Connection conn=DBConnect.getConn();
    out.print(conn);
    %>
   --%> 
    
    <div class="container-fluid back-img">
    <div class="text-center">
    <h1 class="text-white p-4"><i class="fa-solid fa-book"></i>
    Online job Portal
    </h1>
    </div>
    </div>
    
    
    <%@ include file="all_component/foooter.jsp" %>
    
  </body>
</html>
