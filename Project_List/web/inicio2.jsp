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
        <title>|Project List|</title>
        <link rel="icon" href="img/favicon.ico" type="image/ico"/>

        <link href="css/listaStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/InicioEstilos.css" rel="stylesheet" type="text/css"/>   

        <link href="TREE/dtree.css" rel="stylesheet" type="text/css"/>
        <link href="css/cssmodal.css" rel="stylesheet" type="text/css"/>
        <link href="css/modal.css" rel="stylesheet" type="text/css"/>

        <script src="js/mainP.js"></script>       
        <script type="text/javascript" src="TREE/dtree.js"></script>	
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="topnav">

            <a href="#" ><span style="font-size:25px; cursor:pointer;" onclick="closeNav()" onmouseover="openNav()"><img src="img/menu.png" width="25" height="25" alt="menu"/></span></a>
            <!-- actualizar página -->
            <a href="inicio2.jsp?p_proyecto" onclick="mostrar()"><img src="img/inicio.png" width="25" height="25" alt="inicio"/></a>       
            <!-- Exit seguro -->
            <a class="active" href="index.jsp" style="float:right"><img src="img/exit.png" width="25" height="25" alt="menu"/></a>
            <a class="btn" name="mConfig" data-toggle="modal" data-target="#myModal_Datos" href="#" style="float:right"><img src="img/man.png" width="25" height="25" alt="user"/></a>
            <a style="float:right"><%=session.getAttribute("s_user")%></a>

        </div>

        <div class="row">
            <%java.text.DateFormat df1 = new java.text.SimpleDateFormat("E MMM dd");%> 
            <div id="mySidenav" class="column_side">
                <a href="#hoy" id="m_hoy"><img src="img/hoy.png" width="25" height="25" alt="hoy" onclick="mostrarfecha()"/> Today<span id="fechaHoy"> <%=df1.format(new java.util.Date())%></span></a>

                <ul id="menu2">
                    <li><input type="checkbox" name="list2" id="nivel1-2"><span><label for="nivel1-2"><b>PROJECTS</b></label><button type="button" class="btn" data-toggle="modal" data-target="#myModal">&#43;</button></span>

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

                <h2 style="color:#818181;">Hello <% out.print(session.getAttribute("s_user")); %></h2>

                <br>
                <%  if (request.getParameter("p_proyecto") == null) { %>
                <h3 id="mostrarTitPro1"></h3><button type="button" class="btn" data-toggle="modal" data-target="#myModalS" style="color:#fe1a04;">&#43; SECTION</button>
                    <%
                    } else {
                    %>    
                <h3 id="mostrarTitPro"><%=request.getParameter("p_proyecto")%></h3> <button type="button" class="btn" data-toggle="modal" data-target="#myModalS" style="color:#fe1a04;">&#43; SECTION</button>
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

            <!-- ********************DATA TREE*************************************** -->
            <table>
                <tbody>
                    <tr>
                        <td style="width: 20%;">
                            <br>
                            <div class="dtree">
                                <p><a href="javascript: d.openAll();">Open all</a> | <a href="javascript: d.closeAll();">Close all</a></p>
                                <script type="text/javascript">
                                    d = new dTree('d');
                                    d.add(0, -1, 'Projects');


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

                                    d.add(<%=rs2.getString(1)%>,<%=rs2.getString(2)%>, '<%=rs2.getString(3)%>', 'inicio2.jsp?secciones=<%=rs2.getString(3)%>&p_proyecto=<%=rs2.getString(4)%>&idSecc=<%=rs2.getString(5)%>', 'It is a section!', '', 'img/folder2.gif', 'img/folder_open2.gif');

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

                                    d.add(<%=rs3.getString(1)%>, <%=rs3.getString(2)%>, '<%=rs3.getString(3)%>', 'inicio2.jsp?idSecc=<%=rs3.getString(4)%>&p_tarea=<%=rs3.getString(3)%>&id_tarea=<%=rs3.getString(5)%>', 'It is a task!');

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
            <br>
            <br>
            <br>
            <br>


            <!-- The Modal Proyectos -->
            <div class="modal" id="myModal">
                <div class=" modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header border-dark" > 
                            <h4 class="modal-title" style="color: #818181;">ADD PROJECT</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <form name="añadir" action="inicio2.jsp" method="GET"> 
                            <!-- Modal body -->
                            <div class="modal-body">
                                <p>Project's name: </p><input type="text" name="p_proyecto" placeholder="add project" autofocus id="n_proyecto"  required>
                                <br><br>
                                <p>Color:</p>

                                <select name="color" class="color_pro">
                                    <option value="#818181">Select</option>
                                    <option style="color:#0071c5;" value="#0071c5">&#10687; Dark blue</option>
                                    <option style="color:#40E0D0;" value="#40E0D0">&#10687; Turquoise</option> 
                                    <option style="color:#008000;" value="#008000">&#10687; Green</option> 
                                    <option style="color:#FFD700;" value="#FFD700">&#10687; Yellow</option> 
                                    <option style="color:#FF8C00;" value="#FF8C00">&#10687; Orange</option> 
                                    <option style="color:#FF0000;" value="#FF0000">&#10687; Red</option>                                   
                                </select>

                                <br><br>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer border-dark">

                                <input type="hidden" name="el_id" value="<%=session.getAttribute("id_user")%>">
                                <button type="button" class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancel</button>
                                <button type="submit" name="btn_añadir1" value="" id="btn_añadir" class="btn btn-danger">Add new</button>

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
                            <h4 class="modal-title" style="color: #818181;">ADD SECTION</h4>
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

                                <button type="submit" name="btn_añadirS" value="" id="btn_añadirS" class="btn btn-danger">Add new section</button>
                                <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancel</button>
                                <%
                                } else {
                                %>
                                <label style="color: #f1f1f1">Select a project from the Projects side menu *</label>
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
            <div class=" modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header border-dark" > 
                        <h4 class="modal-title" style="color: #818181;">ADD TASK</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form name="añadir" action="inicio2.jsp?" method="GET"> 
                        <!-- Modal body -->
                        <div class="modal-body">

                            <% if (request.getParameter("idSecc") != null) {

                            %> 
                            <input type="text" name="ti_tarea" id="n_tarea" placeholder="Add a task" required>

                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer border-dark" style="align-content: center;">
                            <input type="hidden" name="idSecc" value="<%=request.getParameter("idSecc")%>" />
                            <input type="hidden" name="el_idpT" value="<%=session.getAttribute("id_user")%>">
                            <button type="submit" name="btn_añadirT" value="" id="btn_añadirT1" class="btn btn-danger">Add new task</button>
                            <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>

                            <%
                            } else {
                            %>
                            <label style="color: #f1f1f1">Refresh and select a section from the menu*</label>
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
                        <h4 class="modal-title" style="color: #f1f1f1;">Manage section</h4>
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
                            <button type="submit" name="btn_eliminarS" value="" id="btn_eliminarS" class="btn btn-danger">Remove</button>
                        </div>
                    </form>
                </div>    
            </div>
        </div>

        <!-- gestionar Tarea -->
        <div class="modal" id="myModalGT">
            <div class=" modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header border-dark" > 
                        <h4 class="modal-title" style="color: #f1f1f1;">Manage Task</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form name="añadir" action="inicio2.jsp?" method="GET"> 
                        <!-- Modal body -->
                        <% if (request.getParameter("id_tarea") != null) {

                        %> 
                        <div class="modal-body">
                            <input type="text" name="ti_tarea" id="n_Gtarea" value="<%=request.getParameter("p_tarea")%>" required readonly="readonly"> 
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer border-dark" style="align-content: center;">

                            <input type="hidden" name="id_tarea" value="<%=request.getParameter("id_tarea")%>"/>
                            <input type="hidden" name="el_idpGT" value="<%=session.getAttribute("id_user")%>">

                            <button type="submit" name="btn_eliminarT" value="" id="btn_eliminarT1" class="btn btn-danger">Remove task</button>
                            <button type="button"  class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>

                            <%
                            } else {
                            %>
                            <label>Select task from the tree*</label>
                            <%}
                            %>
                        </div>
                    </form>
                </div>    
            </div>
        </div>


        <!-- EMPIEZA MIS_DATOS **************************************************** -->

        <div class="modal" id="myModal_Datos">
            <div class=" modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header border-dark" > 
                        <h4 class="modal-title" style="color: #818181;">My Data</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form name="añadir" action="inicio2.jsp" method="GET"> 
                        <!-- Modal body -->
                        <div class="modal-body">
                            <table border="1" style="margin: auto;">
                                <thead style="color: #95999c; background-color: #171a1d">
                                    <tr>
                                        <th>User ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                    </tr>
                                </thead>
                                <tbody style="color:#818181;">

                                    <%
                                        Dba db1 = new Dba();
                                        db1.Conectar();

                                        db1.query.executeUpdate("Select u.idusuario, u.nombre, u.email, u.contrasenia from tblusuario u where u.idusuario='" + session.getAttribute("id_user") + "'");

                                        ResultSet rs = db1.query.getResultSet();

                                        while (rs.next()) {
                                            String id, nombre, email, pass;
                                            id = rs.getString(1);
                                            nombre = rs.getString(2);
                                            email = rs.getString(3);
                                            pass = rs.getString(4);

                                    %>  
                                    <tr>  
                                        <td align="center"><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><%=email%></td>
                                        <td><%=pass%></td>
                                    </tr>   
                                    <%}
                                    %>

                                </tbody>
                            </table>              
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer border-dark">
                            <button type="button" class="btn border-dark" style="color: #818181; background-color: rgba(0,0,0,.3);" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>    
            </div>
        </div>

        <!-- TERMINA MIS_DATOS**************************************************** -->



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
                        out.print("<script>alert('The Project was successfully registered');</script>");
                    }

                    db.commit();
                    db.desconectar();
                } catch (Exception e) {

                    e.printStackTrace();
                    out.print("<script>alert('The Project was not registered correctly"
                            + "...Try again!');</script>");
                }
        %>   <script>
            window.location.href = 'inicio2.jsp';
        </script>
        <%
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
                        out.print("<script>alert('The section was successfully registered');</script>");
                    }

                    db.commit();
                    db.desconectar();

                } catch (Exception e) {

                    e.printStackTrace();
                    out.print("<script>alert('The section was not registered correctly"
                            + "...Try again!');</script>");
                }
        %>   <script>
            window.location.href = 'inicio2.jsp';
        </script>
        <%
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
                        out.print("<script>alert('The task was successfully registered');</script>");
                    }

                    db.commit();
                    db.desconectar();

                } catch (Exception e) {

                    e.printStackTrace();
                    out.print("<script>alert('The task was not registered correctly"
                            + "...Try again!');</script>");
                }
        %>   <script>
            window.location.href = 'inicio2.jsp';
        </script>
        <%
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

                        out.print("<script>alert('The section WAS DELETED correctly!!!');</script>");
                    }
                    db.commit();
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>   <script>
            window.location.href = 'inicio2.jsp';
        </script>
        <%
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
                        out.print("<script>alert('The task WAS DELETED correctly');</script>");
        %>   <script>
            window.location.href = 'inicio2.jsp';
        </script>
        <%        }

                    db.commit();
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

        <script src="js/modal_1.js"></script>
        <script src="js/modal.js"></script>


    </body>
</html>
