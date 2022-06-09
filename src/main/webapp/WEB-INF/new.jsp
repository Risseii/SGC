<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- Para CSS -->
<link rel="stylesheet" type="text/css" href="/css/style1.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&family=Kurale&family=Livvic:wght@300&family=Sansita+Swashed&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
	
		<!-- Lado izquierdo -->
    	<div id="sidebar">
    	
		    	<div class="sidebar-header">
		    		<a href="/dashboard">
		            	<h4>Dashboard</h4>
		            </a>
		        </div>
	    	
	            <ul class="list-unstyled components">
	                <li>
	                    <a href="">
	                        <i class="pe-7s-user"></i>
	                        <p>Perfil</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="/show">
	                        <i class="pe-7s-note2"></i>
	                        <p>No conformidades</p>
	                    </a>
	                </li>
	                 <li>
	                    <a href="">
	                        <i class="pe-7s-note2"></i>
	                        <p>Salidas no conformes</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <i class="pe-7s-news-paper"></i>
	                        <p>Proveedores</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <i class="pe-7s-science"></i>
	                        <p>Auditorías</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    	
	    <!-- Main -->
	     <div class="main-panel">
        
	        <!-- Nav top -->
	        <nav class="navbar navbar-default navbar-fixed">
	            <div class="container-fluid">
	                <div class="navbar-header">
	                    <h4>Bienvenida <c:out value="${user_session.getFirst_name()}"/>!</h4>  
	                </div>
	                
	                <div>
	                    <a href="/logout" class="btn btn-danger">Cerrar sesión</a> 
	                </div>
	            </div>
	        </nav>
	 		<!-- Nav top -->
	    
	    	
		<div class="card-nc">
        <form:form method="post" action="/create" modelAttribute="noconformity">
					<h4>No conformidad</h4>
					<div class="form-group">
						<form:label path="number">Número:</form:label>
						<form:input path="number" class="form-control"/>
						<form:errors path="number" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="area">Área:</form:label>
						<form:input path="area" class="form-control"/>
						<form:errors path="area" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="proceso">Proceso:</form:label>
						<form:input path="proceso" class="form-control"/>
						<form:errors path="proceso" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="fecha">Fecha:</form:label>
						<form:input type="date" path="fecha" class="form-control"/>
						<form:errors path="fecha" class="text-danger"/>
					</div>
					
					<div class="form-group">
						<form:label path="fuente">Fuente:</form:label>
						<form:input path="fuente" class="form-control"/>
						<form:errors path="fuente" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="tipo">Tipo de hallazgo:</form:label>
						<form:input path="tipo" class="form-control"/>
						<form:errors path="tipo" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="description">Descripción:</form:label>
						<form:input path="description" class="form-control"/>
						<form:errors path="description" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label path="analisis">Análisis de causas:</form:label>
						<form:textarea path="analisis" class="form-control"/>
						<form:errors path="analisis" class="text-danger"/>
					</div>
					
					<form:hidden path="user" value="${user_session.getId()}" />
					<input type="submit" value="Guardar" class="btn btn-primary sap">
				
				</form:form>
     </div>
    </div>


</body>
</html>