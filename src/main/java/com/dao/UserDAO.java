package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.entity.User;
import com.mysql.cj.QueryReturnType;
import com.mysql.cj.protocol.Resultset;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean adduser(User u) 
	{
		boolean f=false;
		try {
			String sql="insert into user(name,email,password,qualification,role) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			
			ps.setString(5, "user");
			
			int i= ps.executeUpdate();
			if(i==1) 
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	//Validate user:----
	public User loginUser(String email, String password) {
		User u=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				
				u.setRole(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	//Update Edit profile:-----
	
	public boolean updateUser(User u) {
		boolean f=false;
		try {
			String sql="update user set name=?,qualification=?,email=?, password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	//Get user details:----
	
	
	public List<User> getUsers() {
	    List<User> list = new ArrayList<User>();

	    try {
	        String sql = "SELECT id, name, email, password, qualification FROM user";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setQualification(rs.getString("qualification"));
	            list.add(user);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	//Delete User method:-----
	public boolean deleteUsers( int id) {
		boolean f=false;
		try {
			String sql=" delete from user where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return f;
	}


}
