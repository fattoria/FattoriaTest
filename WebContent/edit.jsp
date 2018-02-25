<%@ page import="com.douglasferreira.infra.*" %>
<%@ page import="com.douglasferreira.domain.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<h2>Edição de Produto</h2>
		
	
		<label>Nome do Produto</label><br>
		<input id="pName" name="pName" type="text" value="${ param.pName }"> <span class="alert" style="color:red;">${messages.pName} </span> <br>
		<label>Preço</label><br>
		<input id="pPrice" name="pPrice" type="number" step="any" min="0.01" value="${ param.pPrice }"><br>
		<label>Quantidade</label><br>
		<input id="pAmount" name="pAmount" type="number" min="1" value="${ param.pAmount }"><br>
		<button onClick="save()">Salvar Alterações</button>	

	
					
	</section>

	<script type="text/javascript">
	
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;
	
		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');
	
		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : sParameterName[1];
		        }
		    }
		};
		var pId = getUrlParameter('id');
		var pName = getUrlParameter('name').trim();
		var pPrice = getUrlParameter('price');
		var pAmount = getUrlParameter('amount');
		var pDate = getUrlParameter('date');
		
		$('#pName').val(pName);
		$('#pPrice').val(pPrice);
		$('#pAmount').val(pAmount);
		
		function save(){
			var saveURI = 'editSave.jsp?id=' + pId + '&name=' + $('#pName').val() + '&price=' + $('#pPrice').val() +
					'&amount=' + $('#pAmount').val() + '&date=' + pDate;
			window.location.replace(saveURI);
		}
		
		
	</script>

</body>
</html>