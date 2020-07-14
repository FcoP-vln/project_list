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
        <script type="text/javascript" src="TREE/dtree.js"></script>	
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

                <h2 style="color:#818181;">Hola <% out.print(session.getAttribute("s_user")); %></h2>

                <br>
                <br>

                <%  if (request.getParameter("p_proyecto") == null) { %>
                <h3 id="mostrarTitPro1"></h3><button type="button" class="btn" data-toggle="modal" data-target="#myModalS" style="color:#fe1a04;">&#43; SECCION</button>
                    <%
                    } else {
                    %>    
                <h3 id="mostrarTitPro"><%=request.getParameter("p_proyecto")%></h3> <button type="button" class="btn" data-toggle="modal" data-target="#myModalS" style="color:#fe1a04;">&#43; SECCION</button>
                <%
                    }
                %>              

                <ul id="menuProyecto" class="menuProyecto">         

                    <li>
                        <%
                            if (request.getParameter("secciones") != null) {
                        %>
                        <label for="nivel2-1"><b><%=request.getParameter("secciones")%></b></label><button type="button" class="btn" data-toggle="modal" data-target="#myModalT">&#43;</button>
<button type="button" data-toggle="modal" data-target="#myModalGS" id="btnGestionS" name="btnGestionS" value="50">&#8803;</button>
                        <% } else {%>
                        <label for="nivel2-1"></label>                  
<button type="button" data-toggle="modal" data-target="#myModalGS" id="btnGestionS" name="btnGestionS" value="50">&#8230;</button>
                        <%
                            }
                        %>              

                        <hr>  

                    </li>
                    <li>
                        <%
                            if (request.getParameter("id_tarea") != null) {
                        %>
                        <label for="nivel2-1"><b><%=request.getParameter("p_tarea")%></b></label>
                        <button type="button" data-toggle="modal" data-target="#myModalGT" id="btnGestion" name="btnGestionT" value="50">&#9776</button>

                        <% }
                        %>              

                        <hr>  

                    </li>

                </ul>  
            </div>


            <table>
                <tbody>
                    <tr>
                        <td style="width: 20%;">
                            <br>
                            <div class="dtree">
                                <p><a href="javascript: d.openAll();">Desplegar Todos</a> | <a href="javascript: d.closeAll();">Cerrar Todos</a></p>
                                <script type="text/javascript">
                                    d = new dTree('d');
                                    d.add(0, -1, 'Proyectos');


                                    <%
                                        Dba dbT = new Dba();
                                        dbT.Conectar();
                                        dbT.query.execute("SELECT tblproyecto.IDPROYECTO, tblproyecto.NOMBREPRO FROM TBLPROYECTO where tblproyecto.IDUSER = '" + session.getAttribute("id_user") + "' ");
                                        ResultSet rs1 = dbT.query.getResultSet();
                                        while (rs1.next()) {
                                    %>
                                    d.add(<%=rs1.getString(1)%>, 0, '<%=rs1.getString(2)%>', '', 'PROYECTO');

                                    <% }
                                        dbT.desconectar();
                                    %>


                                    <%
                                        Dba db2 = new Dba();
                                        db2.Conectar();
                                        db2.query.execute("SELECT s.idseccion+100, a.idproyecto,  s.nombre, a.nombrepro, s.idseccion FROM tblproyecto a, tblseccion s where a.idproyecto=s.idproyecto");
                                        ResultSet rs2 = db2.query.getResultSet();
                                        while (rs2.next()) {
                                    %>

                                    d.add(<%=rs2.getString(1)%>,<%=rs2.getString(2)%>, '<%=rs2.getString(3)%>', 'inicio2.jsp?secciones=<%=rs2.getString(3)%>&p_proyecto=<%=rs2.getString(4)%>&idSecc=<%=rs2.getString(5)%>', 'Es una Sección', '', 'img/folder2.gif', 'img/folder_open2.gif');

                                    <% }
                                        db2.desconectar();
                                    %>

                                    <%
                                        Dba db3 = new Dba();
                                        db3.Conectar();
                                        db3.query.execute("select distinct t.idtarea, s.idseccion+100, t.nomtarea, s.idseccion, t.idtarea from tbltarea t, tblseccion s, tblproyecto a where t.idseccion=s.idseccion");
                                        ResultSet rs3 = db3.query.getResultSet();
                                        while (rs3.next()) {
                                    %>

                                    d.add(<%=rs3.getString(1)%>, <%=rs3.getString(2)%>, '<%=rs3.getString(3)%>', 'inicio2.jsp?idSecc=<%=rs3.getString(4)%>&p_tarea=<%=rs3.getString(3)%>&id_tarea=<%=rs3.getString(5)%>', 'TAREA');

                                    <% }
                                        db3.desconectar();
                                    %>


                                    document.write(d);

                                </script>

                            </div>   
                        </td>

                    </tr>
                </tbody>
            </table>







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

            <!-- The Modal SECCIONES -->
            <div class="modal" id="myModalS">
                <div class=" modal-dialog ">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header border-dark" > 
                            <h4 class="modal-title" style="color: #818181;">Añadir Sección</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <form name="añadirS" action="inicio2.jsp" method="GET"> 
                            <!-- Modal body -->
                            <div class="modal-body">
                                <% if (request.getParameter("idproyecto") != null) {

                                %>


                                <input type="text" name="secciones" id="n_seccion" placeholder="Agrega una sección" required>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer border-dark" style="align-content: center;">

                                <input type="hidden" name="idproyecto" value="<%=request.getParameter("idproyecto")%>"/>

                                <button type="submit" name="btn_añadirS" value="" id="btn_añadirS" class="btn btn-danger">Añadir sección</button>
                                <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>
                                <%
                                } else {
                                %>
                                <label style="color: #f1f1f1">DEBE seleccionar un proyecto en el menú lateral Proyectos*</label>
                                <%}
                                %>
                            </div>
                        </form>
                    </div>    
                </div>
            </div>

        </div>



        <!-- The Modal Tareas -->
        <div class="modal" id="myModalT">
            <div class=" modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header border-dark" > 
                        <h4 class="modal-title" style="color: #818181;">Añadir TAREA</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form name="añadir" action="inicio2.jsp?" method="GET"> 
                        <!-- Modal body -->
                        <div class="modal-body">

                            <% if (request.getParameter("idSecc") != null) {

                            %> 
                            <input type="text" name="ti_tarea" id="n_tarea" placeholder="Agrega tu tarea" required>

                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer border-dark" style="align-content: center;">
                            <input type="hidden" name="idSecc" value="<%=request.getParameter("idSecc")%>" />
                            <input type="hidden" name="el_idpT" value="<%=session.getAttribute("id_user")%>">
                            <button type="submit" name="btn_añadirT" value="" id="btn_añadirT1" class="btn btn-danger">Añadir tarea</button>
                            <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>

                            <%
                            } else {
                            %>
                            <label style="color: #f1f1f1">Actualice y elija una sección en el menú*</label>
                            <%}
                            %>

                        </div>
                    </form>
                </div>    
            </div>
        </div>

        <!-- ************************************************************ADMINISTRAR *************-->            
        <!-- GESTIONAR SECCIONEEEESS *************-->

        <div class="modal" id="myModalGS">
            <div class=" modal-dialog ">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header border-dark" > 
                        <h4 class="modal-title" style="color: #f1f1f1;">Gestionar Sección</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form name="añadirS" action="inicio2.jsp" method="GET"> 
                        <!-- Modal body -->
                        <div class="modal-body">
                            <input type="text" name="secciones" id="n_seccion" placeholder="Agrega una sección" value="<%=request.getParameter("secciones")%>" required>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer border-dark" style="align-content: center;">
                            <input type="hidden" name="ti_seccionM" value="<%=request.getParameter("idSecc")%>"/>
                            <button type="submit" name="btn_eliminarS" value="" id="btn_eliminarS" class="btn btn-danger">Eliminar</button>
                        </div>
                    </form>
                </div>    
            </div>
        </div>

                            <!-- gestionar Tarea -->
    <div class="modal" id="myModalGT">
                    <div class=" modal-dialog modal-lg">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header border-dark" > 
                                <h4 class="modal-title" style="color: #f1f1f1;">Gestionar TAREA</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <form name="añadir" action="inicio2.jsp?" method="GET"> 
                                <!-- Modal body -->
                                 <% if(request.getParameter("id_tarea")!=null){
                                            
                                        %> 
                                <div class="modal-body">
                                    <input type="text" name="ti_tarea" id="n_Gtarea" value="<%=request.getParameter("p_tarea")%>" required readonly="readonly"> 
                                </div>
                                       
                                <!-- Modal footer -->
                                <div class="modal-footer border-dark" style="align-content: center;">
                               
                                    <input type="hidden" name="id_tarea" value="<%=request.getParameter("id_tarea")%>"/>
                                    <input type="hidden" name="el_idpGT" value="<%=session.getAttribute("id_user")%>">

                                    <button type="submit" name="btn_eliminarT" value="" id="btn_eliminarT1" class="btn btn-danger">Eliminar tarea</button>
                                    <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>
                               
                                     <%
                                            }else{
                                    %>
                                    <label>DEBE seleccionar la tarea del árbol*</label>
                              <%}
                                 %>
                                </div>
                            </form>
                        </div>    
                    </div>
                </div>
                                

        <!-- Para registrar Proyecto -->
        <% //para registrar PROYECTO
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

        <!--para registrar Sección-->
        <% //para registrar SECCION

            if (request.getParameter("btn_añadirS") != null) {

                Dba db = new Dba();
                db.Conectar();
                try {

                    int contador = db.query.executeUpdate("insert into TBLSECCION(nombre, idproyecto) values('" + request.getParameter("secciones") + "','" + request.getParameter("idproyecto") + "')");

                    if (contador == 1) {
                        out.print("<script>alert('La Sección fue registrada correctamente');</script>");
                    }

                    db.commit();
                    db.desconectar();

                } catch (Exception e) {

                    e.printStackTrace();
                    out.print("<script>alert('La sección NO FUE añadida"
                            + "...Inténtelo de nuevo');</script>");
                }
            }
        %>

        <!--para registrar Tarea-->
        <% //para registrar TAREA

            if (request.getParameter("btn_añadirT") != null) {

                Dba db = new Dba();
                db.Conectar();
                try {

                    int contador = db.query.executeUpdate("insert into TBLTAREA(nomtarea, idseccion, idusuario) values('" + request.getParameter("ti_tarea") + "', '" + request.getParameter("idSecc") + "', '" + request.getParameter("el_idpT") + "')");

                    if (contador == 1) {
                        out.print("<script>alert('La Tarea fue registrada correctamente');</script>");
                    }

                    db.commit();
                    db.desconectar();

                } catch (Exception e) {

                    e.printStackTrace();
                    out.print("<script>alert('La tarea NO FUE añadido"
                            + "...Inténtelo de nuevo');</script>");
                }
            }
        %>

        <!-- *****ELIMINAR SECCIONES ******** -->
<%
            if (request.getParameter("btn_eliminarS") != null) {
                  
                try {
                    Dba db = new Dba();
                    db.Conectar();
 
                   int contador = db.query.executeUpdate("delete from tblseccion WHERE idseccion='" + request.getParameter("ti_seccionM") + "'");

                    if (contador >= 1) {
                        db.query.executeUpdate("delete from tbltarea t WHERE t.idseccion='" + request.getParameter("ti_seccionM") + "'");
                     
                        out.print("<script>alert('La sección FUE ELIMINADA correctamente REFRESQUE la página!!!');</script>");
                    }
                    
                    db.commit();
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
        
        
        <!--******Eliminar TAREAAAAAS *********-->
        <%
            if (request.getParameter("btn_eliminarT") != null) {

                try {
                    Dba db = new Dba();
                    db.Conectar();

                    int contador = db.query.executeUpdate("delete from tbltarea WHERE idtarea='" + request.getParameter("id_tarea") + "' ");

                    if (contador >= 1) {
                        out.print("<script>alert('La Tarea fue Eliminada correctamente');</script>");
                    }

                    db.commit();
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

    </body>
</html>
