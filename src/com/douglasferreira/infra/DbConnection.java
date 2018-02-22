package com.douglasferreira.infra;

import java.sql.*;

public final class DbConnection {

	private static DbConnection currentInstance;
	
	private final String connectionURL = "jdbc:mysql://drflab.c0uktfaczuj2.sa-east-1.rds.amazonaws.com/DRFDB";
	private final String user = "sa";
	private final String password = "drffattoria";
	private final String driver = "com.mysql.jdbc.Driver";
	private Connection currentConnection;
		
	private DbConnection() throws Exception {
		Class.forName(driver);
		currentConnection = DriverManager.getConnection(connectionURL, user, password);
	}
	
	public static DbConnection GetInstance() throws Exception {
	
		if(currentInstance == null) {
			
			DbConnection _instance = new DbConnection();
			currentInstance = _instance;
			return currentInstance;
		}
		else {
			return currentInstance;
		}
		
	}
	
	public Connection getCurrentConnection() {
		return currentConnection;
}
		
	
}
