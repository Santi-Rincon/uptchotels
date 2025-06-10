<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% request.setCharacterEncoding("UTF-8"); %>
        <%@ page import="java.util.*, co.edu.uptc.uptchotels.model.Hotel" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <title>Buscar Hotel</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/estilo4.css">
            </head>

            <body>
                <div class="topnav">

                    <div class="dropdown">
                        <button class="dropbtn">Menú Hotel</button>
                        <div class="dropdown-content">
                            <a href="${pageContext.request.contextPath}/introcreatehotel">Crear Hotel</a>
                            <a href="hotels">Gestionar Hotel</a>
                            <a href="findhotel">Buscar Hotel</a>
                        </div>
                    </div>
            
                    <div class="dropdown">
                        <button class="dropbtn">Menú Reserva</button>
                        <div class="dropdown-content">
                            <a href="${pageContext.request.contextPath}/introcreatebooking">Crear Reserva</a>
                            <a href="bookings">Gestionar Reserva</a>
                            <a href="reportbooking">Generar Reporte De Reservas</a>
                        </div>
                    </div>
            
                </div>

                <div class="content">
                    <h1 class="title">Buscar Hotel por Nombre</h1>

                    <form action="findhotel" method="post" class="search-form">
                        <label for="searchName">Nombre Del Hotel:</label>
                        <input type="text" id="searchName" name="searchName">
                        <button type="submit">Buscar</button>
                    </form>

                    <% String searchName=request.getParameter("searchName"); if (searchName !=null &&
                        !searchName.trim().isEmpty()) { List<Hotel> list = (List<Hotel>)
                            session.getAttribute("hotellist");
                            Hotel found = null;
                            if (list != null) {
                            for (Hotel hotel : list) {
                            if (String.valueOf(hotel.getName()).equals(searchName)) {
                            found = hotel;
                            break;
                            }
                            }
                            }
                            %>
                            <% if (found !=null) { %>
                                <table class="employee-table" style="margin-top: 20px; width: 50%;">
                                    <tr>
                                        <th>Nombre</th>
                                        <td>
                                            <%= found.getName() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Ciudad</th>
                                        <td>
                                            <%= found.getCity() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Dirección</th>
                                        <td>
                                            <%= found.getAddress() %>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>Email</th>
                                        <td>
                                            <%= found.getEmail() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Teléfono</th>
                                        <td>
                                            <%= found.getPhone() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Habitaciones</th>
                                        <td>
                                            <%= found.getRoomCapacity() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Estado</th>
                                        <td>
                                            <%= found.isStatus() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Acciones</th>
                                        <td>
                                            <a href="edithotel?name=<%= found.getName() %>" class="btn edit">Modificar</a>
                                            <a href="deletehotel?name=<%= found.getName() %>" class="btn delete">Eliminar</a>
                                        </td>
                                    </tr>
                                </table>
                                <% } else { %>
                                    <p style="margin-top: 20px;">Hotel con Nombre <strong>
                                            <%= searchName %>
                                        </strong> no encontrado.</p>
                                    <% } } %>
                </div>

                <div class="footer">
                    <p>© 2025 UPTCHOTELS App. Todos los derechos reservados.</p>
                </div>
            </body>

            </html>