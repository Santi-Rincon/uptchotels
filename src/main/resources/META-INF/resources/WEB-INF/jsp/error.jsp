<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error en la operación</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/estilo3.css">
</head>
<body>
    <div class="error-container">
        <h1>UPTCHOTELS APP</h1>
        <p class="error-message-page">
            <strong>Error:</strong> ${sessionScope.error}
        </p>
        <a href="/hotelapp" class="btn-back">Volver al Inicio</a>
    </div>
</body>
</html>