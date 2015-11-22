package org.ats.java.servlet;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ats.dbconnection.DataSource;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ApproveJobsServlet extends HttpServlet{

	/**
	 * Return all Jobs Posted by the Employers
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(FetchPostedJobsServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PrintWriter out = null;
		// DataBase connection code...............................
		DataSource ds = null;
		Connection con = null;
		try {
			ds = DataSource.getInstance();
			con = ds.getConnection();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		// ...................................................>>>>
		try{
		out = response.getWriter();
		String userType = session.getAttribute("userType").toString();
		if(userType.equals("Admin")){
		
		String query = "select jobid, job_title, job_location, job_expiry_on, job_posted_by   from jobpost_details where job_status = ?";
		ps = con.prepareStatement(query);
		ps.setString(1, "Pending");
		rs = ps.executeQuery();
		JSONArray obj = new JSONArray();
		while(rs.next()){
			JSONObject list1 = new JSONObject();
            list1.put("jobId",rs.getString("jobid"));
            list1.put("jobTitle",rs.getString("job_title"));
            list1.put("jobLocation",rs.getString("job_location"));
            list1.put("jobExpiry", rs.getString("job_expiry_on"));
            list1.put("jobPostedBy", rs.getString("job_posted_by"));
            
            obj.put(list1);
		}
		
		out.print(obj.toString());
		}
		}catch(Exception e){
			LOGGER.error(e.getMessage());
		}finally{
			// Closing database resources, so that it will return back to the db pool.
		    try { if (rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps != null) ps.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};	
		}
	
	}
	
}
