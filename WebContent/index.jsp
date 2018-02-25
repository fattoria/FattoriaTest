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

		DbConnection connection = null;
				
		try {
			
			connection = DbConnection.getInstance();
			List productsList = connection.getAllProducts();
			out.println("Connected to MySQL at AWS RDS Service");
			session.setAttribute("productsList", productsList);
														
		}
		catch (Exception ex) {
			out.println("Connection attempt to MySQL at AWS RDS Service has failed!");
			ex.printStackTrace();
		}
	
	%>	

	<h1>Fattoria Teste - CRUD </h1>

	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a href="index.jsp">Listar produtos</a></li>
			<li><a href="cadastro.jsp">Cadastrar produto</a></li>		
		</ul>
	</header>
	
	<section>
		<h2>Lista de Produtos Cadastrados</h2>		
	
		<c:forEach items="${productsList}" var="product">
			<ul>
			    <li><c:out value=" ${product.name}"/>
			      	<ul style="list-style-type:none;">
				        <li>Preço: <c:out value="R$ ${product.price}"/></li>
				     	<li>Quantidade em Estoque: <c:out value="${product.amount}"/></li>
				     	<li>Data de Cadastro: <c:out value="${product.date}"/> </li>
				        <li> 
				        	<a href="edit.jsp?id=<c:out value="${product.id}"/>&name=<c:out value=" ${product.name}"/>
				        	&price=<c:out value="${product.price}"/>&amount=<c:out value="${product.amount}"/>&date=<c:out value="${product.date}"/>">Editar</a>
				        	<a href="delete.jsp?id=<c:out value="${product.id}"/>">Deletar</a>       
			            </li>
			        </ul>
		        </li>
 			 </ul>
		</c:forEach>
			
	</section>
			
	<script src="index.js"></script>
	
</body>
</html>