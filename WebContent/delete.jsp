<%@ page import="com.douglasferreira.infra.*" %>
<%@ page import="com.douglasferreira.domain.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Iterator" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Fattoria Teste - CRUD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body style="margin: 20px">
	
	<% 
		String pId = request.getParameter("id");
		DbConnection connection = null;
				
		try {
						
			connection = DbConnection.getInstance();
			connection.deleteObject(Integer.parseInt(pId));
			out.println("Connected to MySQL at AWS RDS Service");
																	
		}
		catch (Exception ex) {
			out.println("Connection attempt to MySQL at AWS RDS Service has failed!");
			ex.printStackTrace();
		}
	
	%>	

	<h1>Fattoria Teste - CRUD </h1>
	<h2>Produto deletado com sucesso</h2>

	<% response.sendRedirect("index.jsp"); %>
	
</body>
</html>