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

@WebServlet("/adduser")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String qualification=req.getParameter("qualification");
			String password=req.getParameter("password");
			
			UserDAO dao=new UserDAO(DBConnect.getConn());
			
			User u=new User(name,email,qualification,password,"User");
			boolean f=dao.adduser(u);
			HttpSession session=req.getSession();
			if (f) {
				session.setAttribute("succMsg","User added successfully...");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("succMsg","Something Wrong on server...");
				resp.sendRedirect("signup.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
