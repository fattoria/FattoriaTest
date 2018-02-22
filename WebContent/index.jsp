<%@ page import="com.douglasferreira.infra.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
	<title>Fattoria Teste - CRUD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	
</head>

<body style="margin: 20px">

	<% 
		try {
			DbConnection currentConnection = DbConnection.GetInstance();
			out.println("Connected to MySQL at AWS RDS Service");
			//out.println(currentConnection.getCurrentConnection().getCatalog());
								
		}
		catch (Exception ex) {
			out.println("Connection attempt to MySQL at AWS RDS Service has failed!");
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
	</section>
</body>
</html>