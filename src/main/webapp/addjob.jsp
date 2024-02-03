<%-- jstl uri for running jstl code --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="all_component/all_css.jsp"%>
<title>Add_job</title>
</head>
<body style="background-color: #f0f1f2">
  <c:if test="${userobj.role ne 'admin' }">
  <c:redirect url="login.jsp"></c:redirect>
  </c:if>


	<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fa-solid fa-users"></i>
						
						<%-- jstl code for alert message--%>
						
						<c:if test="${not empty succMsg }">
						<div class="alert alert-success" role="alert">
                          ${succMsg}
                          <c:remove var="succMsg"/>
                        </div>
                        
						
						</c:if>
						
						<%-- jstl code end --%>

						<h5>Add Jobs</h5>
					</div>
					<form action="addjobs" method="post">
						<div class="form-group">
							<label>Enter Title</label> 
							<input type="text" name="title"
								required class="form-control">
						</div>
						<div class="form-row">
						<div class="form-group col-md-4">
							<label>Location</label>
							<select name="location"
								class="custom-select" id="inlineFormCustomSelectPref">
								<option selected>choose...</option>
								<option value="Odisha">Odisha</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="WestBangal">WestBangal</option>
								<option value="Delhi">Delhi</option>
								<option value="Hyderabad">Hyderabad</option>

							</select>
						</div>
						<div class="form-group col-md-4">
						<label>Category</label>
							<select name="category"
								class="custom-select" id="inlineFormCustomSelectPref">
								<option selected>choose...</option>
								<option value="IT">IT</option>
								<option value="Developer">Developer</option>
								<option value="Banking">Banking</option>
								<option value="Teacher">Teacher</option>
								<option value="Engineer">Engineer</option>

							</select>
						</div>
						<div class="form-group col-md-4">
						<label >Status</label>
						<select class="form-control" name="status">
						<option class="Active" value="Active">Active</option>
						<option class="Inactive" value="Inactive">Inactive</option>
						
						</select>
						
						</div>
						
						</div>
						<div class="form-group">
						<label >Enter Description</label>
						<textarea class="form-control" required row="6" cols="" name="desc"></textarea>
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>