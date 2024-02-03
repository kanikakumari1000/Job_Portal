
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.jobDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User_View_Page</title>
<%@ include file="all_component/all_css.jsp"%>
</head>
<body>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>
							<div class="form-group col-md-5">
								<select name="loc" class="custom-select">
									<option value="">choose...</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Odisha">Odisha</option>
									<option value="WestBangal">WestBangal</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
								</select>
							</div>
							<div class="form-group col-md-5">
								<select class="custom-select" name="cat" id="">
									<option value="ca" selected>choose..</option>
									<option value="IT">IT</option>
									<option value="DEVELOPER">DEVELOPER</option>
									<option value="BANKING">BANKING</option>
									<option value="ENGINEER">ENGINEER</option>
									<option value="TEACHER">TEACHER</option>
								</select>
							</div>
							<button class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
				<% jobDAO dao= new jobDAO(DBConnect.getConn());
				  List<Jobs> list=dao.getAllJobsForUser();
				  for(Jobs j: list){
				%>
				<div class="card-mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-clipboard"></i>
						</div>
						<h6><%=j.getTitle() %>.</h6>
						<%
				 if(j.getDescription().length() > 0 && j.getDescription().length() < 120 ){
				 %>
						<p><%=j.getDescription() %>
						</p>
						<%
				 }
				 else{
					%>
					<p> <%=j.getDescription().substring(0, 120) %>...</p>
						<%
				 }
					%>

						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory() %>" readonly>
							</div>
						</div>
						<h6>Publish Date:<%=j.getPdate().toString() %></h6>
						<div class="text-center">
						<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm btn-success text-white">
						</a>
						</div>
					</div>
				</div>
				<%
				}
				  %>

				

			</div>

		</div>
	</div>


</body>
</html>