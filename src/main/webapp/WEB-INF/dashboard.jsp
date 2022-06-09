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

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">

                            <div class="header">
                                <h5 class="title">Nro de nc</h5>
                                <p class="category"></p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                                	<div>
										<h2>${show_nc}</h2>
								   </div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> 
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Año - 2022
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card">

                            <div class="header">
                                <h5 class="title">Nro de om</h5>
                                <p class="category"></p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                                	<div>
                                		<h2>${show_om}</h2>       
                                	</div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> 
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Año - 2022
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card">

                            <div class="header">
                                <h5 class="title">Nro de snc</h5>
                                <p class="category"></p>
                            </div>
                            <div class="content">
                                <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                                	<div>
                                		<h2>0</h2>
                                	</div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> 
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-clock-o"></i> Año - 2022
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                
                </div>


				<!-- inicio de 2da fila -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-audit">
                            <div class="header">
                                <h5 class="title">Auditorías</h5>
                                <p class="category"></p>
                            </div>
                            <div class="content">
                                <div id="chartActivity" class="ct-chart"></div>
                                	<div>
                                		<p>Próxima auditoría</p>
                                	</div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> 
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-check"></i> Año - 2022
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="card card-mensaje">
                            <div class="header">
                                <h5 class="title">Mensajes</h5>
                                <p class="category"></p>
                            </div>
                            <div class="content">
								<div><!-- Espacio para muro -->
									<c:forEach var="m" items="${show_message}">
										<p class="me">${m.admi.first_name} ${m.admi.last_name} dice: ${m.content}</p>
									</c:forEach>
								</div>
								
								<form:form action="/message" method="post" modelAttribute="message">
									<div class="form-group">
										<form:label path="content"><p class="me">Agregar Comentario:</p></form:label>
										<form:textarea path="content" class="form-control"/>
										<form:errors path="content" class="text-danger"/>
										<form:hidden path="admi" value="${user_session.id}"/>
									
									<div class="buttom-mssg">
										<input type="submit" class="btn btn-primary" value="Enviar">
									</div>
									
									</div>
								</form:form>
                                
                            </div>

                                
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
</div>


	
</body>
</html>