package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	static String url ="jdbc:mysql://localhost:3306/techblog";
	static String un = "root";
	static String pwd = "kIrik@123";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//create a connection;
				con = DriverManager.getConnection(url,un,pwd);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
