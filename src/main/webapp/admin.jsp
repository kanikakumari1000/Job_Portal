
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin_Pannel</title>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="all_component/all_css.jsp" %>
  </head>
  <style>
  .back-img{
	background-image:url("image/admin.jpg");
	width:100%;
	height:80vh;
	background-repeat:no-repeat;
	background-size:cover;
}
  
  </style>
  <body>
  
  <c:if test="${userobj.role ne 'admin' }">
  <c:redirect url="login.jsp"></c:redirect>
  </c:if>
    <%@ include file="all_component/navbar.jsp" %>
    
    <div class="container-fluid back-img">
    <div class="text-center">
    <h1 class="text-white p-4">
    Welcome Admin
    </h1>
    </div>
    </div>
    
    
    <%@ include file="all_component/foooter.jsp" %>
    
  </body>
</html>
