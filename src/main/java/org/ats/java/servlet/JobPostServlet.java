package org.ats.java.servlet;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ats.dbconnection.DataSource;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JobPostServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(JobPostServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		String useremail = session.getAttribute("email").toString(); // taking emailid from Session
		
		PrintWriter out = null;
		StringBuffer jb = new StringBuffer();
		String line = null;
		PreparedStatement stmt = null;
	
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
		
		try {
			out = response.getWriter();

			// Reading parameters from request and converting it into jsonstring.
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
			JSONObject userdetails = new JSONObject(jb.toString());
			// ........................................................>>>
			
			// Reading data from Json String..............................
			String jobTitle = userdetails.getString("jobTitle");
			String careerLevel = userdetails.getString("careerLevel");
			String noOfVacancies = userdetails.getString("noOfVacancies");
			String location = userdetails.getString("location");
			String skills = userdetails.getString("skills");
			String positionType = userdetails.getString("positionType");
			String description = userdetails.getString("description");
			JSONArray functionsArray = userdetails.getJSONArray("functions");
			String functions = functionsArray.toString();
			JSONArray industriesArray = userdetails.getJSONArray("industries");
			String industries = industriesArray.toString();
			String requiredExperience = userdetails.getString("requiredExperience");
			String education = userdetails.getString("education");
			String receiveFrom = userdetails.getString("receiveFrom");
			JSONArray languagesKnownArray = userdetails.optJSONArray("languagesKnown");
			boolean languagenullflag = false;
			String languagesKnown = "";

			if(languagesKnownArray == null){
				languagenullflag = true;
			}else{
			languagesKnown = languagesKnownArray.toString();
			}
			String annualSalary = userdetails.getString("annualSalary");
			String gender = userdetails.getString("gender");
			String jobExpiryDate = userdetails.getString("jobExpiryDate");
			String changeEmail = userdetails.getString("changeEmail");
			//..................................................>>>
			
			//..... Insert Job Details into Database......................
			String query1 = "insert into jobpost_details(job_title, career_level, no_of_vacancies, job_location, "
					+ "position_type, job_description, desired_skills, required_exp, industry, function, education, sex, languages, "
					+ "receive_application, annual_salary, job_expiry_on, to_email, date_first_posted, job_posted_by, job_status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
			stmt = con.prepareStatement(query1);
			stmt.setString(1, jobTitle);
			stmt.setString(2, careerLevel);
			stmt.setString(3, noOfVacancies);
			stmt.setString(4, location);
			stmt.setString(5, positionType);
			stmt.setString(6, description);
			stmt.setString(7, skills);
			stmt.setString(8, requiredExperience);
			stmt.setString(9, industries);
			stmt.setString(10, functions);
			stmt.setString(11, education);
			stmt.setString(12, gender);
			if(languagenullflag == true){
				stmt.setString(13, "");
			}else{
				stmt.setString(13, languagesKnown);
			}
			stmt.setString(14, receiveFrom);
			stmt.setString(15, annualSalary);
			stmt.setString(16, jobExpiryDate);
			stmt.setString(17, changeEmail);
			stmt.setString(18, useremail);
			stmt.setString(19, "Pending");
			
			int a = stmt.executeUpdate();
			
			if(a > 0){
				LOGGER.info("success");
				out.print("{\"status\" : \"success\"}");
			}else{
				out.print("{\"status\" : \"error\"}");
			}
			//......................................>>>
			
		}catch(Exception e){
			
			out.print("{\"status\" : \"error\"}");
			LOGGER.error(e.getMessage());
			
		}finally {
			// Closing database resources, so that it will return back to the db pool.
		    try { if (stmt != null) stmt.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};
		}
		
	}
	
}
