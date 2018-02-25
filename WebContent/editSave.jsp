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
	

	<h1>Fattoria Teste - CRUD </h1>

	<% 
		String pId = request.getParameter("id");
		String pName = request.getParameter("name");
		String pPrice = request.getParameter("price");
		String pAmount = request.getParameter("amount");
		String pDate = request.getParameter("date");
		DbConnection connection = null;
				
		try {
						
			connection = DbConnection.getInstance();
			Product p = new Product(pName, Float.parseFloat(pPrice), Integer.parseInt(pAmount));
			p.setId(Integer.parseInt(pId));
			connection.updateObject(p.getId(), p);
			out.println("Produto Alterado com Sucesso");
			out.println("Connected to MySQL at AWS RDS Service");
			
																	
		}
		catch (Exception ex) {
			out.println("Connection attempt to MySQL at AWS RDS Service has failed!");
			ex.printStackTrace();
		}
	
	%>	

	<% response.sendRedirect("index.jsp"); %>
	
</body>
</html>