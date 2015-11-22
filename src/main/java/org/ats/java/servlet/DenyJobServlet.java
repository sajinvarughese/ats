package org.ats.java.servlet;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ats.dbconnection.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet which deny one specific job and deny all job according to the parameter
 * @author worklyf
 *
 */
public class DenyJobServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(DenyJobServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String userType = session.getAttribute("userType") == null ? "" : session.getAttribute("userType").toString();
		
		PrintWriter out = null;
		
		if(userType.equals("Admin")){
			String jobId = request.getParameter("jobid");
			String status = request.getParameter("status") == null ? "" : request.getParameter("status");
			
			
			// DataBase connection code...............................
			DataSource ds = null;
			Connection con = null;
			PreparedStatement ps = null;
			try {
				ds = DataSource.getInstance();
				con = ds.getConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			// ...................................................>>>>
			try{			

			out = response.getWriter();
			String sql1 = "";
			if(status.equals("All")){
				sql1 = "update jobpost_details set job_status = ? where job_posted_by = (select * from (select job_posted_by  from jobpost_details where jobid = ?) as x)";
			}else{
				sql1 = "update jobpost_details set job_status = ? where jobid = ?";			
			}
			ps = con.prepareStatement(sql1);
			ps.setString(1, "Denied");
			ps.setString(2, jobId);
	
			int a = ps.executeUpdate();
			
			if(a > 0){
				out.print("{\"status\" : \"success\"}");
			}else{
				out.print("{\"status\" : \"error\"}");
			}
			
			}catch(Exception e){
				LOGGER.info("Error:" + e.getMessage());
				out.print("{\"status\" : \"error\"}");
			}finally{
				
			// Closing database resources, so that it will return back to the db pool.
		    try { if (ps != null) ps.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};	
		}
	
		}else{
			try{
			out = response.getWriter();
			out.print("{\"status\" : \"error\"}");
			
			}catch(Exception e){
				LOGGER.error(e.getMessage());
			}
		}
		
	}
}
