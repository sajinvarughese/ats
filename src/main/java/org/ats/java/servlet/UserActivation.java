package org.ats.java.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.ats.dbconnection.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class UserActivation extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(UserActivation.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		LOGGER.info("inside Servlet");
		String emailId = "";
		String time = "";
		String key = request.getParameter("verificationLink");
		byte[] value = Base64.decodeBase64(key);

		String decodedString = new String(value); // Decoded Email~||~time id
		System.out.println(decodedString);
		if(decodedString.contains("~||~")){
		 emailId = decodedString.split("\\~\\|\\|\\~")[0];
		 time = decodedString.split("\\~\\|\\|\\~")[1];
		}

		HttpSession session = request.getSession();
		/* Changing the user status from 0 to 1 if user exists. if already verified nothing doing */
		
		ResultSet rs = null;
		ResultSet rs1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		PreparedStatement ps = null;
		DataSource ds = null;
		Connection con = null;
		try {
			ds = DataSource.getInstance();
			con = ds.getConnection();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		try {
			String query1 = "select * from register where email = ? and time = ?";
			ps2 = con.prepareStatement(query1);
			ps2.setString(1, emailId);
			ps2.setString(2, time);
			rs = ps2.executeQuery();

			if (rs.next()) {
				String str = rs.getString("user_status");
				if (str.equals("1")) {
					LOGGER.info("Emailid already verified.");
					session.setAttribute("alertString","Emailid already verified.");
					response.sendRedirect("login.jsp");
				} else {
					String query = "update register set user_status = ? where email = ?";
					ps = con.prepareStatement(query);
					ps.setString(1, "1");
					ps.setString(2, emailId);

					int a = ps.executeUpdate();

					if (a > 0) {
						
						/* Moving data from register table to userlogin table*/
						String query2 = "select * from register where user_status = ? and email = ?";
						ps3 = con.prepareStatement(query2);
						ps3.setString(1, "1");
						ps3.setString(2, emailId);
						rs1 = ps3.executeQuery();
						if(rs1.next()){
							String query3 = "insert into userlogin(user_id, full_name, emailid, password, user_type) values(?, ?, ?, ?, ?)";
							ps4 = con.prepareStatement(query3);
							ps4.setString(1, rs1.getString("user_id"));
							ps4.setString(2, rs1.getString("full_name"));
							ps4.setString(3, rs1.getString("email"));
							ps4.setString(4, rs1.getString("password"));
							ps4.setString(5, "Employer");
							
							int b = ps4.executeUpdate();
							if(b > 0){
								// data successfully moved.
								LOGGER.info("Emailid verified.");
								session.setAttribute("alertString","Emailid verified.");
								response.sendRedirect("login.jsp");
								
							}
							
						}
						
						
					}
				}
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());;
		}finally {
			// Closing database resources, so that it will return back to the db pool.

		    try { if (rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (rs1 != null) rs1.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps != null) ps.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps2 != null) ps2.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps3 != null) ps3.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (ps4 != null) ps4.close(); } catch (Exception e) {e.printStackTrace();};
		    try { if (con != null) con.close(); } catch (Exception e) {e.printStackTrace();};
		}
		
	}
	
	
}
