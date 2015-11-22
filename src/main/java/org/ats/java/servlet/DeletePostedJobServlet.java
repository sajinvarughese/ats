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
 *	Servlet to delete the posted job by the employer.
 * 
 * @author worklyf
 *
 */
public class DeletePostedJobServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(DeletePostedJobServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String sessionid = session.getAttribute("sessionid") == null ? "" : session.getAttribute("sessionid").toString();
		LOGGER.info("session id :::: "+sessionid);
		PrintWriter out = null;
		
		if(sessionid.equals(session.getId())){
			String jobId = request.getParameter("jobid");
			String useremail = session.getAttribute("email").toString();
			
			LOGGER.info(jobId + " :: "+useremail);
			
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

			String sql1 = "delete from jobpost_details where jobid = ? and job_posted_by = ?";
			ps = con.prepareStatement(sql1);
			ps.setString(1, jobId);
			ps.setString(2, useremail);
				
			int a = ps.executeUpdate();
			
//			int a = 1;
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
