<%@page import="com.entity.Jobs"%>
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
<%@ include file="all_component/all_css.jsp"%>
<title>one_view</title>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				jobDAO dao = new jobDAO(DBConnect.getConn());
				Jobs j = dao.getJobById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-clipboard"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-comtrol-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-comtrol-sm"
									value="<%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
						Publish Date:
						<%=j.getPdate().toString() %>
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>