<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.jobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="all_component/all_css.jsp"%>
<title>more_view</title>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				<%

String loc=request.getParameter("loc");
String cat=request.getParameter("cat");
String msg="";

jobDAO dao=new jobDAO(DBConnect.getConn());
List<Jobs> list=null;
if("lo".equals(loc) && "ca".equals(cat)){
	
	list =new ArrayList<Jobs>();
	msg="Job not Avilable";
}
else if("lo".equals(loc) || "ca".equals(cat)){
	list=dao.getJobsORLocationAndCate(cat, loc);
}else{
	list=dao.getJobsORLocationAndCate(cat, loc);
}
 if(list.isEmpty()){
%>
				<h4 class="text-center text-danger">Jobs not Available</h4>
				<%
}
 if(list !=null){
	 
 for(Jobs j:list){
 %>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-clipboard"></i>
						</div>
						<h6><%=j.getTitle() %></h6>
						<p><%=j.getDescription() %></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Loation: <%=j.getLocation() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory() %>" readonly>
							</div>
						</div>
						<h6>
							Publish Date:<%=j.getPdate().toString() %>
						</h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId() %>"
								class="btn bg-success btn-sm text-white">View</a>
						</div>
					</div>
				</div>
				<%
				}
                }else{
				%>
				<h4 class="text-center text-danger"><%=msg%></h4>
				<%
                }
				%>
			</div>
		</div>
	</div>


</body>
</html>