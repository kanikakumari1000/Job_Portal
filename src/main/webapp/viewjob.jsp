<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- for showing the msg --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="all_component/all_css.jsp"%>
<title>view job</title>
</head>
<body>
	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Job</h5>

				<%-- jstl code for alert message--%>

				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">
						${succMsg}
						<c:remove var="succMsg" />
					</div>


				</c:if>

				<%-- jstl code end --%>

				<%-- Scriptlet tag --%>

				<%
				jobDAO dao = new jobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body text-center">
						<i class="fa-solid fa-clipboard"></i>
					</div>


					<h6><%=j.getTitle()%></h6>
					<%-- for showing Dynamic value we will use expression tag --%>
					<p><%=j.getDescription()%></p>
					<br>
					<div class="form-row">
						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
								value="Location:<%=j.getLocation()%>" readonly>
						</div>
						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
								value="Category:<%=j.getCategory()%>" readonly>
						</div>

						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
								value="Status:<%=j.getStatus()%>" readonly>
						</div>
					</div>
					<h6>
						Publish Date:<%=j.getPdate()%></h6>
					<div class="text-center">
						<a href="editjob.jsp?id=<%=j.getId()%>"
							class="btn bg-success btn-sm text-white">Edit</a>
						<%--using url rewritting concept to get id  --%>
						<a href="delete?id=<%=j.getId()%>"
							class="btn bg-danger btn-sm text-white">Delete</a>
					</div>
				</div>
			</div>

			<%
			}
			%>

			<%-- Scriptlet tag end --%>



		</div>
	</div>
	<%--</div> --%>

</body>
</html>