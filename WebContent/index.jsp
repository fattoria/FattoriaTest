<%@ page import="com.douglasferreira.infra.*" %>
<%@ page import="com.douglasferreira.domain.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
	<title>Fattoria Teste - CRUD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body style="margin: 20px">

	<% 

		DbConnection connection = null;
	
		try {
			
			connection = DbConnection.GetInstance();
			Produto p = new Produto("Chinelo Havaianas", 25, 40);
			connection.CreateObject(p);
			out.println("Connected to MySQL at AWS RDS Service");
											
		}
		catch (Exception ex) {
			out.println("Connection attempt to MySQL at AWS RDS Service has failed!");
		}
		finally {
			//currentConnection.getCurrentConnection().close();
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
		<ul id="ProdutosId">
		</ul>	
	</section>
	
	<script src="index.js"></script>
	
</body>
</html>