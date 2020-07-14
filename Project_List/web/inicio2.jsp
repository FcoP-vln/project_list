<%-- 
    Document   : inicio2
    Created on : 13-jul-2020, 19:53:34
    Author     : Francisco
--%>
<%@page import="java.sql.ResultSet"%>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);

    try {
        if (session.getAttribute("s_user") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

%>

<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project List</title>
    <script src="js/mainP.js"></script>

    </head>
    <body>

        <div class="topnav">

            <a href="#" ><span style="font-size:25px; cursor:pointer;" onclick="closeNav()" onmouseover="openNav()"><img src="img/menu.png" width="25" height="25" alt="menu"/></span></a>

            <!-- actualizar página -->
            <a href="inicio2.jsp?p_proyecto" onclick="mostrar()"><img src="img/inicio.png" width="25" height="25" alt="inicio"/></a>       

            <!-- Exit seguro -->
            <a class="active" href="controladorsalir.do" style="float:right"><img src="img/exit.png" width="25" height="25" alt="menu"/></a>

            <a style="float:right"><%=session.getAttribute("s_user")%><img src="img/man.png" width="25" height="25" alt="man"/></a>

        </div>

        <div class="row">
            <%java.text.DateFormat df1 = new java.text.SimpleDateFormat("E MMM dd");%> 
            <div id="mySidenav" class="column_side">
                <a href="#hoy" id="m_hoy"><img src="img/hoy.png" width="25" height="25" alt="hoy" onclick="mostrarfecha()"/>  Hoy<span id="fechaHoy"> <%=df1.format(new java.util.Date())%></span></a>

                <ul id="menu2">
                    <li><input type="checkbox" name="list2" id="nivel1-2"><label for="nivel1-2"><b> 
                                Proyectos </b></label><button type="button" class="btn" data-toggle="modal" data-target="#myModal">&#43;</button>

                        <ul class="interior">


                            <%

                                try {
                                    Dba db = new Dba();
                                    db.Conectar();
                                    db.query.execute("SELECT nombrepro, idproyecto, color FROM tblproyecto where tblproyecto.IDUSER = '" + session.getAttribute("id_user") + "' ");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {
                                        String proyecto, id, color;
                                        proyecto = rs.getString(1);
                                        id = rs.getString(2);
                                        color = rs.getString(3);

                            %>
                            <li><a href="inicio2.jsp?p_proyecto=<%=proyecto%>&idproyecto=<%=id%>&p_color=<%=color%>&secciones=" style="color:<%=color%>;">&#9775;<span> <%=proyecto%></span></a></li>

                            <%        }
                                    db.desconectar();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            %> 
                        </ul>
                        <hr>   
                    </li>
                </ul>

            </div>
                        
                        
                        <div id ="main" class="column middle">
                            
                            
                        </div>

<!-- The Modal Proyectos -->
                <div class="modal" id="myModal">
                    <div class=" modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header border-dark" > 
                                <h4 class="modal-title" style="color: #818181;">Añadir Proyecto</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <form name="añadir" action="inicio2.jsp" method="GET"> 
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <p>Nombre del proyecto: </p><input type="text" name="p_proyecto" id="n_proyecto" required>
                                    <br><br>
                                    <p>Color del proyecto</p>

                                    <select name="color" class="color_pro">
                                        <option value="#818181">Seleccionar</option>
                                        <option style="color:#0071c5;" value="#0071c5">&#10687; Azul oscuro</option>
                                        <option style="color:#40E0D0;" value="#40E0D0">&#10687; Turquesa</option> 
                                        <option style="color:#008000;" value="#008000">&#10687; Verde</option> 
                                        <option style="color:#FFD700;" value="#FFD700">&#10687; Amarillo</option> 
                                        <option style="color:#FF8C00;" value="#FF8C00">&#10687; Naranja</option> 
                                        <option style="color:#FF0000;" value="#FF0000">&#10687; Rojo</option>                                   
                                    </select>

                                    <br><br>
                              
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer border-dark">

                                    <input type="hidden" name="el_id" value="<%=session.getAttribute("id_user")%>">
                                    <button type="button" class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" name="btn_añadir1" value="" id="btn_añadir" class="btn btn-danger">Añadir</button>

                                </div>
                            </form>
                        </div>    
                    </div>
                </div>


        </div>


 <%               
                if (request.getParameter("btn_añadir1") != null) {

                    java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
                    String f_crea;
                    f_crea = df.format(new java.util.Date());
                    
                    Dba db = new Dba();
                    db.Conectar();
                    try {

                        int contador = db.query.executeUpdate("insert into TBLPROYECTO(nombrepro, fechacrea, color, iduser) values('" + request.getParameter("p_proyecto") + "','" + f_crea + "','" + request.getParameter("color") + "','" + request.getParameter("el_id") + "')");

                        if (contador == 1) {
                            out.print("<script>alert('El Proyecto fue registrado correctamente');</script>");
                        }
                        
                        db.commit();
                        db.desconectar();
                    } catch (Exception e) {

                        e.printStackTrace();
                        out.print("<script>alert('El Proyecto NO FUE añadido"
                                + "...Inténtelo de nuevo');</script>");
                    }
                }
            %>


    </body>
</html>
