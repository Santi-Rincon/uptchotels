<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="co.edu.uptc.uptchotels.model.Hotel,java.util.List" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title> Formulario Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo.css">

</head>

<body>
    <div class="topnav">

        <div class="dropdown">
            <button class="dropbtn">Menú Hotel</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                <a href="hotels">Gestionar Hotel</a>
                <a href="findemployee">Buscar Empleado</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Reserva</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introaddcustomer">Crear Reserva</a>
                <a href="customers">Gestionar Reserva</a>
                <a href="findcustomer">Buscar Reserva</a>
                <a href="findcustomer">Generar Reporte De Reservas</a>
            </div>
        </div>

    </div>

    <div class="content">
        <h1> UPTCHOTEL APP </h1>
        <h2> Bienvenido a la aplicacion! </h2>
        <h2> Haga click en cualquiera de las opciones del menu principal! </h2>
    </div>

    <div class="footer">
        <p>© 2025 UPTCHOTEL App. Todos los derechos reservados.</p>
    </div>

</body>


</html>
