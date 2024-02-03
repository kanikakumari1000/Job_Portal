package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.jobDAO;
import com.entity.Jobs;
@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			int id= Integer.parseInt(req.getParameter("id"));
			String title=req.getParameter("title");
			String description=req.getParameter("desc");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");

			
			Jobs j= new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			
HttpSession session=req.getSession();
			
			//Creating JobDao object:-----
			
			jobDAO dao=new jobDAO(DBConnect.getConn());
			boolean f=dao.updateJob(j);
			if(f)
			{
				session.setAttribute("succMsg", "job update successfully...");
				resp.sendRedirect("viewjob.jsp");
				
			}
			else {
				session.setAttribute("succMsg", "something wrong on server...");
				resp.sendRedirect("viewjob.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
