package org.ats.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SignOutServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(UserActivation.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	HttpSession session = request.getSession();
	PrintWriter out = response.getWriter();
	session.invalidate();
	LOGGER.info("User Session Deleted..");
	
	out.print("{}");
	
	}
}
