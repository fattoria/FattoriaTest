<html>
<head>
	<title>Fattoria Teste - CRUD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		
		<form action="${pageContext.request.contextPath}/cadastro" method="post" id="cadastroForm">	
			<label>Nome do Produto</label><br>
			<input id="pName" name="pName" type="text" value="${ param.pName }"> <span class="alert" style="color:red;">${messages.pName} </span> <br>
			<label>Preço</label><br>
			<input id="pPrice" name="pPrice" type="number" step="any" min="0.01" value="${ param.pPrice }"><br>
			<label>Quantidade</label><br>
			<input id="pAmount" name="pAmount" type="number" min="1" value="${ param.pAmount }"><br><br>
			<input type="submit" value="Gravar"> <br>
			<span class="success" style="color:green;">${messages.success}</span>
		</form>
					
	</section>
<!-- 	<script type="text/script" src="cadastro.js"></script> -->
</body>
</html>