

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%@ include file="all_component/all_css.jsp"%>
    <title>Users List</title>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>

    <div class="container-fluid">
        <div class="heading">
            <h6 class="text-center">All Users</h6>
        </div>
        
        	<%-- jstl code for alert message--%>

				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">
						${succMsg}
						<c:remove var="succMsg" />
					</div>


				</c:if>

				<%-- jstl code end --%>
        

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Qualification</th>
                    <th>Button</th>
                </tr>
            </thead>
            <tbody>
                <%
                    UserDAO dao = new UserDAO(DBConnect.getConn());
                    List<User> list = dao.getUsers();

                    for (User u : list) {
                %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getPassword() %></td>
                        <td><%= u.getQualification() %></td>
                        <td><a href="delete_user?id=<%=u.getId() %>" class="btn bg-danger btn-sm text-white">Delete</a></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <%@ include file="all_component/foooter.jsp"%>

</body>
</html>
