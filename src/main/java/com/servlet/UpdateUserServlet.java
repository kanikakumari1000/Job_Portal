package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String qualification=req.getParameter("qualification");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			UserDAO dao=new UserDAO(DBConnect.getConn());
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qualification);
			u.setEmail(email);
			u.setPassword(password);
			
			
			boolean f=dao.updateUser(u);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg","User profile Updated");
				resp.sendRedirect("home.jsp");
			}
			else {
				session.setAttribute("succMsg","Something Wrong on Server");
				resp.sendRedirect("home.jsp");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
