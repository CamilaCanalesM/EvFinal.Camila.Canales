<%-- 
    Document   : crear
    Created on : 25-08-2023, 2:34:45
    Author     : ccana
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Registro de Usuarios</title>
    </head>

    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-secondary bg-gradient">
                <div class="container">
                    <a class="navbar-brand" href="#">
                        <img src="Logo-CIISA.png" alt="Logo">
                    </a>
                </div>
            </nav>
        </header>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input name="nombre" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese Nombre" required="">
                        </div><br>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input name="apellido" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese Apellido" required="">
                        </div><br>
                        <div class="form-group">
                            <label>Edad</label>
                            <input name="edad" type="number" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese Edad" required="">
                        </div><br>
                        <div class="form-group">
                            <label>Correo</label>
                            <input name="correo" type="email" class="form-control" aria-describedby="emailHelp" placeholder="usuario@ciisa.cl" required="">
                        </div><br>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">REGISTRAR <i class="fa fa-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre");
                String strApellido = request.getParameter("apellido");
                String strEdad = request.getParameter("edad");
                String strCorreo = request.getParameter("correo");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_registro_usuarios?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_usuarios(nombre,apellido,edad,correo) VALUES('" + strNombre + "','" + strApellido + "','" + strEdad + "','" + strCorreo + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

    </body>
</html>
