
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="all_component/all_css.jsp"%>
<title>Edit_Profile</title>
</head>
<body>
<body style="background-color:#f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-solid fa-user-plus"></i>
							<h6>Edit Profile</h6>
						</div>
						<form action="update_profile" method="post">
							<input type="hidden" name="id" value="${userobj.id}">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" required id="exampleInputName"
									aria-describedby="emailHelp" name="name"
									value="${userobj.name }">
							</div>
							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
									class="form-control" required id="exampleInputQualification"
									aria-describedby="emailHelp" name="qualification"
									value="${userobj.qualification }">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" required id="exampleInputEmail"
									aria-describedby="emailHelp" name="email"
									value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword">Enter Password</label> <input type="password"
									class="form-control" required id="exampleInputPassword"
									aria-describedby="emailHelp" name="password"
									value="${userobj.password}">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Update</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="all_component/foooter.jsp" %>
</body>
</html>