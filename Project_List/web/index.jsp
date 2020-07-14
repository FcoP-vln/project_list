<%-- 
    Document   : index.jsp
    Created on : 13-jul-2020, 16:33:43
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO</title>
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
        
        
        
    </body>
</html>
