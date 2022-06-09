<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Para CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster+Two&display=swap" rel="stylesheet">
</head>
<body>
	<div class="content">
				 <!-- Nav pills -->
			    <ul class="nav nav-pills" role="tablist">
			      <li class="nav-item">
			        <a class="nav-link active" data-toggle="pill" href="#login">Iniciar sesión</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" data-toggle="pill" href="#regis">Registrarse</a>
			      </li>
			    </ul>
				
				<!-- Tab panes -->
    			<div class="tab-content">
      			
				<div id="regis" class="container tab-pane fade">
				<form:form method="post" action="/register" modelAttribute="nuevoUsuario">
					
					<div class="form-group">
						<form:label path="first_name">Nombre</form:label>
						<form:input path="first_name" class="form-control"/>
						<form:errors path="first_name" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="last_name">Apellido</form:label>
						<form:input path="last_name" class="form-control"/>
						<form:errors path="last_name" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="email">Email</form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="password">Password</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="confirm">Confirmacion</form:label>
						<form:password path="confirm" class="form-control"/>
						<form:errors path="confirm" class="text-danger"/>
					</div>
					<input type="submit" value="Registrarme" class="btn btn-primary sap">
				
				</form:form>
			</div>
		
			<div id="login" class="container tab-pane active">
				<form:form method="post" action="/login" modelAttribute="nuevoLogin">
					<div class="form-group">
						<form:label path="email">Email</form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="password">Password</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<input type="submit" value="Inicia sesion" class="btn btn-primary sap">
				</form:form>
			
	
			</div>	
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>