package org.ats.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.ats.dbconnection.DataSource;

public class TestClass {
public static void main(String[] args) {
	PreparedStatement ps = null;
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

	String password = "hirrr@123";
	try{
	ps = con.prepareStatement("update register set password = sha1(?) where email = 'admin@hirrr.com'");
	ps.setString(1, password);
	
	int a = ps.executeUpdate();
	if(a > 0){
		System.out.println(a);
	}
	
	}catch(Exception e){
		System.out.println(e);
	}
}
}
