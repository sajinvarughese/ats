package org.ats.java.servlet;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.ats.dbconnection.DataSource;
import org.ats.mail.SendMail;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RegisterServlet extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(RegisterServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		StringBuffer jb = new StringBuffer();
		String line = null;
		PreparedStatement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
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

			String username = userdetails.getString("name");
			String email = userdetails.getString("email");
			String password = userdetails.getString("pwd");
			String datetime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss")
					.format(new Date());

			// Creating email data for verifying the users registered.
			String stringToEncode = email + "~||~" + datetime;
			byte[] str = Base64.encodeBase64(stringToEncode.getBytes());
			String verification_link = "http://localhost:8080/ats/ActivateUser?verificationLink="
					+ new String(str);
			String mailData = "You need to verify your User name and email address. \n"
					+ "User Name : "
					+ email
					+ "\n"
					+ "Password : "
					+ password
					+ "\n"
					+ "Please click on the link below to continue \n"
					+ verification_link;
			// ....................................................>>>

			String query1 = "select * from register where email = ?";
			stmt = con.prepareStatement(query1);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next()) { // checking user already registered
				if (rs.getString("user_status").equals("1")) { // checking user
																// already
																// verified
																// his/her
																// emailid
					out.print("{\"status\" : \"Emailid Already Registered\"}");
				} else {
					out.print("{\"status\" : \"Already Registered. Confirm emailid\"}");
				}
			} else {
				// if user registering for the first time.

				String query = "Insert into register(full_name, email, password, user_status, time) values(?, ?, sha1(?), ?, ?)";
				ps = con.prepareStatement(query);
				ps.setString(1, username);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, "0");
				ps.setString(5, datetime);

				int a = ps.executeUpdate();

				if (a > 0) {
					System.out.println("inserted successfully");
					SendMail.sendMail(email, "Email verification", mailData);

					out.print("{\"status\" : \"success\"}");
				} else {
					out.print("{\"status\" : \"Registration not Successfull\"}");
				}
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			out.print("{\"status\" : \"error\"}");
		} finally {
			// Closing database resources, so that it will return back to the db pool.

		    try { if (rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps != null) ps.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (stmt != null) stmt.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};
		}
		
	}
	
}
