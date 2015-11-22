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
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet which fetches the details with jobId and userType (Admin can view all job posted job)
 * @author worklyf
 *
 */
public class SingleJobDetailServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(SingleJobDetailServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		String jobid = request.getParameter("jobid") == null ? "" : request.getParameter("jobid");
		String useremail = session.getAttribute("email") == null ? "" : session.getAttribute("email").toString();
		String userType = session.getAttribute("userType") == null ? "" : session.getAttribute("userType").toString();
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
			String query = "";
			
			// Admin can see job details of all jobs. but Employers only see the job they posted.
			if(userType.equals("Admin")){
				query = "select * from jobpost_details where jobid = ?";
			}else{
				query = "select * from jobpost_details where jobid = ? and job_posted_by = ?";
			}
			ps = con.prepareStatement(query);
			ps.setString(1, jobid);
			
			if(userType.equals("Employer")){ 
			ps.setString(2, useremail);
			}
			
			rs = ps.executeQuery();
			
			JSONObject obj = new JSONObject();
			while(rs.next()){
				obj.put("jobId",rs.getString("jobid"));
				obj.put("jobTitle",rs.getString("job_title"));
				obj.put("jobStatus",rs.getString("job_status"));
				obj.put("jobLocation", rs.getString("job_location"));
				obj.put("jobExpiry", rs.getString("job_expiry_on"));
				obj.put("reqExperience", rs.getString("required_exp"));
				obj.put("noOfVacancies", rs.getString("no_of_vacancies"));
				obj.put("jobDescription", rs.getString("job_description"));
				obj.put("jobEducation", rs.getString("education"));
				obj.put("jobSkills", rs.getString("desired_skills"));
			}
			
			out.print(obj.toString());
			
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
