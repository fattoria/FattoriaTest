<html>
<head>
	<title>Fattoria Teste - CRUD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body style="margin: 20px">
	<h1>Fattoria Teste - CRUD </h1>

	<header>
		<ul class="nav nav-tabs">
			<li><a href="index.jsp">Listar produtos</a></li>
			<li class="active"><a href="cadastro.jsp">Cadastrar produto</a></li>		
		</ul>
	</header>
	
	<section>
		<h2>Cadastro de Produtos</h2>
		
		<form action="${pageContext.request.contextPath}/crud" method="post">	
			<label>Nome do Produto</label><br>
			<input id="pName" name="pName" type="text" value="${ param.pName }"><br>
			<label>Preço</label><br>
			<input id="pPrice" name="pPrice" type="number" value="${ param.pPrice }"><br>
			<label>Quantidade</label><br>
			<input id="pAmount" name="pAmount" type="number" value="${ param.pAmount }"><br><br>
			<input type="submit" value="Gravar">
			<span class="success">${messages.success}</span>
		</form>
							
	</section>
</body>
</html>