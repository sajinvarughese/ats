package org.ats.java.servlet;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ats.dbconnection.DataSource;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response){
	
			PrintWriter out = null;
			StringBuffer jb = new StringBuffer();
			String line = null;
			ResultSet rs = null;
			PreparedStatement ps = null;
			
			HttpSession session = request.getSession(); //creating session object
		
			// database Connection code..........................
			  DataSource ds = null;
			  Connection con = null;
			  try {
					ds = DataSource.getInstance();
					con =  ds.getConnection();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			 //.......................................> 
		try{  
			out = response.getWriter();
			
			// Reading parameter from request and convert it to jsonstring.................... 
			BufferedReader reader = request.getReader(); 
			while ((line = reader.readLine()) != null)
				jb.append(line);
		
				JSONObject userdetails = new JSONObject(jb.toString());
			
			//...................................................>>
				
				String email = userdetails.getString("email");
				String password = userdetails.getString("pwd");
		
				String query = "select * from userlogin where emailid = ? and password = sha1(?)";
				ps = con.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, password);
				
				rs = ps.executeQuery();
				if(rs.next()){
					//Login Success
					session.setAttribute("email", rs.getString("emailid"));
					session.setAttribute("fullName", rs.getString("full_name"));
					session.setAttribute("sessionid", session.getId());
					session.setAttribute("userType", rs.getString("user_type"));
					if(rs.getString("user_type").equals("Admin")){
						out.print("{\"status\" : \"admin\"}");
					}else{
						out.print("{\"status\" : \"success\"}");
					}
				}else{
					out.print("{\"status\" : \"error\"}");
				}
		
		}catch(Exception e){
			out.print("{\"status\" : \"error\"}");
			LOGGER.error(e.getMessage());
		}finally {
			// Closing database resources, so that it will return back to the db pool.
		    try { if (rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps != null) ps.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};
		}
		
	}
	
}
