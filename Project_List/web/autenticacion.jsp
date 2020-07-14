<%-- 
    Document   : autenticacion
    Created on : 13-jul-2020, 18:51:50
    Author     : Francisco
--%>

<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>


<%request.setCharacterEncoding("UTF-8");%>



<%
    if (request.getParameter("ti_nombre") != null) {

        Dba db1 = new Dba();
        db1.Conectar();
        try {
            if (request.getParameter("hd_accion").equals("1")) {
                db1.query.execute("select idusuario from tblusuario where nombre = '" + request.getParameter("ti_nombre") + "'");
                ResultSet rs1 = db1.query.getResultSet();
                while (rs1.next()) {
                    session.setAttribute("id_user", rs1.getString(1));

                }
                db1.query.execute("select nombre, contraseña, idusuario from tblusuario");
                ResultSet rs = db1.query.getResultSet();
                String centinela = "n";

                while (rs.next()) {

                    if (request.getParameter("ti_nombre").equals(rs.getString(1)) && request.getParameter("ti_contrasenia1").equals(rs.getString(2))) {
                        centinela = "s";

                    }

                    if (centinela.equals("s")) {
                        //guardar variables de session
                        session.setAttribute("s_user", request.getParameter("ti_nombre"));
                        session.setAttribute("s_pass", request.getParameter("ti_contrasenia1"));

                        //llamar jsp correspondiente desde linea de comando
                        request.getRequestDispatcher("inicio2.jsp?ti_nombre=" + request.getParameter("ti_nombre") + "&secciones=Secciones&p_proyecto=BIENVENIDO  " + request.getParameter("ti_nombre") + "!!!").forward(request, response);
                    } else {
                        out.print("<script>alert('El Usuario NO EXISTE, o contraseña ERRÓNEA"
                                + "...Inténtelo de nuevo');</script>");
%>
<script>
    window.location.href = 'index.jsp';
</script>
<%
                    }
                }

            }
            db1.commit();
            db1.desconectar();
        } catch (Exception e) {

            e.printStackTrace();

        }
    }

%>
