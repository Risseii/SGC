<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	    
	    	<div class="derecho">
	    		
	    		<div class="add">
	    			<a href="/new" class="btn btn-primary purple">Agregar NC</a>
	    		</div>
		    	
		    	<table class="table table-hover">
					<thead>
						<tr>
							<th>Nro</th>
							<th>Fecha</th>
							<th>Area</th>
							<th>Proceso</th>
							<th>Fuente</th>
							<th>Acciones</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="a" items="${show_nc}">
							<tr>
								<td><c:out value="${a.number}"/></td>
								<td><fmt:formatDate value="${a.fecha}" pattern="dd-MMM-yy"/></td>
								<td><c:out value="${a.area}"/></td>
								<td><c:out value="${a.proceso}"/></td>
								<td><c:out value="${a.fuente}"/></td>
					
							<c:if test="${a.user.id == user_session.id}">
								<td class="space">
									<a href="/show/edit/${a.getId()}" class="btn btn-warning edi">Editar</a>
									<a href="" class="btn btn-warning pac">Agregar PAC</a>
									<form action="/delete/${a.getId()}" method="POST">
										<input type="hidden" name="_method" value="DELETE">
										<button type="submit" class="btn btn-danger">Eliminar</button>
									</form>
								</td>
							</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	    	
	    	</div>
	    	
		</div>

</body>
</html>