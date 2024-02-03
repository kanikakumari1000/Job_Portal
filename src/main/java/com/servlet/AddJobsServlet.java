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
@WebServlet("/addjobs")
public class AddJobsServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			
			String title=req.getParameter("title");
			String description=req.getParameter("desc");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			
			
			//creating Jobs id and set the value:---
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			
			HttpSession session=req.getSession();
			
			//Creating JobDao object:-----
			
			jobDAO dao=new jobDAO(DBConnect.getConn());
			boolean f=dao.addJobs(j);
			if(f)
			{
				session.setAttribute("succMsg", "job post successfully...");
				resp.sendRedirect("addjob.jsp");
				
			}
			else {
				session.setAttribute("succMsg", "something wrong on server...");
				resp.sendRedirect("addjob.jsp");
				
			}
			
			
			
			
			
		} catch (Exception e) {
		   e.printStackTrace();
		}
		
	}
	

}
