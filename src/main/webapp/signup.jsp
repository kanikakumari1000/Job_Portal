<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%@ include file="all_component/all_css.jsp" %>
<title>SignUp_Page</title>
</head>
<body style="background-color:#f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>
 
 <div class="container-fluid">
 
 <div class="row p-5">
 <div class="col-md-4 offset-md-4">
 <div class="card">
 <div class="card-body">
 <div class="text-center">
 <i class="fa-solid fa-user"></i>
 <h5>Registration</h5>
 </div>
 <c:if test="${not empty succMsg }">
  <h4 class="text-center text-success">${succMsg }</h4>
  <c:remove var="succMsg" />
 </c:if>
 
 <%-- Form start --%>
 <form action="adduser" method="post">
 <div class="form-group">
 <label>Full Name</label>
 <input type="text" required="required"
 class="form-control" id="exampleInputEmail1" name="name" arial-describedby="emailHelp">
 
 
 
  <label for="exampleInputPassword1">Email</label>
  <input type="email" required="required"
 class="form-control" id="exampleInputPassword3" name="email">
 
 <label for="exampleInputPassword1">Enter Password</label>
  <input type="password" required="required"
 class="form-control" id="exampleInputEmail4" name="password">
 <label>Enter Qualification</label>
 <input type="text" required="required"
 class="form-control" id="exampleInputEmail2" name="qualification">
 
 </div>
 <button type="submit" class="btn btn-primary badge-pill btn-block">Register
 </button>
 </form>
 
 </div>
 </div>
 </div>
 </div>
 </div>

</body>
</html>