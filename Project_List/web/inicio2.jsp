<%-- 
    Document   : inicio2
    Created on : 13-jul-2020, 19:53:34
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project List</title>
    </head>
    <body>
     <div class="topnav">

            <a href="#" ><span style="font-size:25px; cursor:pointer;" onclick="closeNav()" onmouseover="openNav()"><img src="img/menu.png" width="25" height="25" alt="menu"/></span></a>

            <!-- actualizar página -->
            <a href="inicio2.jsp?p_proyecto" onclick="mostrar()"><img src="img/inicio.png" width="25" height="25" alt="inicio"/></a>       
         <a class="active" href="#" style="float:right"><img src="img/exit.png" width="25" height="25" alt="menu"/></a>
            <a style="float:right"><%=session.getAttribute("s_user")%><img src="img/man.png" width="25" height="25" alt="man"/></a>


        </div>
    </body>
</html>
