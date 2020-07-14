<%-- 
    Document   : index.jsp
    Created on : 13-jul-2020, 16:33:43
    Author     : Francisco
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page import="database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
       
        
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/> <!--for Front-end -->
        <link rel="icon" href="img/favicon.ico" type="image/ico"/>
        <script src="js/md5.js" type="text/javascript"></script>
        <script>
            function modificarPASS(accion) {
                if (accion === 1) {
                    document.getElementById('hd_accion').value = 1;
                    var sinCifrar = document.getElementById('ti_contrasenia1').value;
                    document.getElementById('ti_contrasenia1').value = hex_md5(sinCifrar);
                    f1.submit();
                }

                if (accion === 2) {
                    document.getElementById('hd_accion1').value = 2;
                    var sinCifrar = document.getElementById('ti_contrasenia').value;
                    document.getElementById('ti_contrasenia').value = hex_md5(sinCifrar);
                    f1.submit();
                }
            }
        </script>
    </head>
    <body>
        <%request.setCharacterEncoding("UTF-8");%>
        
        <div class="contenedor-form">
            <div class="toggle">
                <span> Crear Cuenta</span>
            </div>
            <div class="formulario">
                 <h3><img src="img/favicon.ico" width="45" height="45" alt="menu"/></h3>

                <h2>Inicia Sesión</h2>
                <form action="autenticacion.jsp" method="POST">
                    <input type="text" name="ti_nombre" placeholder="Nombre" autofocus required>
                    <input type="password" id="ti_contrasenia1" name= "ti_contrasenia1" placeholder="&#9000; Contraseña" required>
                    <input type="submit" name="btnLog" value="Iniciar Sesión" onclick="modificarPASS(1);">
                    <input type="hidden" name="hd_accion"  id="hd_accion" value="">
               </form> 
            </div>
         <%  //registrar usuario en BD
             if (request.getParameter("btn_registrar") != null) {

                    Dba db = new Dba();
                    db.Conectar();
                    try {
                        if (request.getParameter("hd_accion1").equals("2")) {
                            int contador = db.query.executeUpdate("insert into TBLUSUARIO(nombre, email, contrasenia) values('" + request.getParameter("ti_nombre") + "','" + request.getParameter("ti_email") + "','" + request.getParameter("ti_contrasenia") + "')");

                            if (contador == 1) {
                                out.print("<script>alert('El usuario fue registrado');</script>");
                            }

                            db.commit();
                            db.desconectar();
                        }
                    } catch (Exception e) {

                        e.printStackTrace();
                        out.print("<script>alert('El Usuario NO FUE Registrado"
                                + "...Inténtelo de nuevo');</script>");
                    }
                }
            %>
            <div class="formulario">
                <h2>Crea tu Cuenta</h2>
                <form action="index.jsp" method="POST">
                    <input type="text" name="ti_nombre" placeholder="Nombre" required>

                    <input type="email" name="ti_email" placeholder="Correo Electrónico" required>

                    <input type="password" id="ti_contrasenia" name="ti_contrasenia" placeholder="Contraseña" required>

                    <input type="submit" name="btn_registrar" id="btn_registrar" value="Registrarse" onclick="modificarPASS(2);">

                    <input type="hidden" name="hd_accion1"  id="hd_accion1" value="">
                      
                </form>
            </div>           
        </div>
            
        <script src="js/jquery-3.1.1.min.js"></script>  <!--for Front-end -->  
        <script src="js/main.js"></script>
        
    </body>
</html>
