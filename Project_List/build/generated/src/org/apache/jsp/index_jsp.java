package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import database.Dba;
import database.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>LOGIN</title>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <link href=\"https://github.com/FcoP-vln/Project_List_FrontEnd.git/estilos.css\" rel=\"stylesheet\" type=\"text/css\"/> <!--for Front-end -->\n");
      out.write("        <link rel=\"icon\" href=\"img/favicon.ico\" type=\"image/ico\"/>\n");
      out.write("        <script src=\"js/md5.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script>\n");
      out.write("            function modificarPASS(accion) {\n");
      out.write("                if (accion === 1) {\n");
      out.write("                    document.getElementById('hd_accion').value = 1;\n");
      out.write("                    var sinCifrar = document.getElementById('ti_contrasenia1').value;\n");
      out.write("                    document.getElementById('ti_contrasenia1').value = hex_md5(sinCifrar);\n");
      out.write("                    f1.submit();\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                if (accion === 2) {\n");
      out.write("                    document.getElementById('hd_accion1').value = 2;\n");
      out.write("                    var sinCifrar = document.getElementById('ti_contrasenia').value;\n");
      out.write("                    document.getElementById('ti_contrasenia').value = hex_md5(sinCifrar);\n");
      out.write("                    f1.submit();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
request.setCharacterEncoding("UTF-8");
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"contenedor-form\">\n");
      out.write("            <div class=\"toggle\">\n");
      out.write("                <span> Crear Cuenta</span>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"formulario\">\n");
      out.write("                 <h3><img src=\"img/favicon.ico\" width=\"45\" height=\"45\" alt=\"menu\"/></h3>\n");
      out.write("\n");
      out.write("                <h2>Inicia Sesión</h2>\n");
      out.write("                <form action=\"autenticacion.jsp\" method=\"POST\">\n");
      out.write("                    <input type=\"text\" name=\"ti_nombre\" placeholder=\"Nombre\" autofocus required>\n");
      out.write("                    <input type=\"password\" id=\"ti_contrasenia1\" name= \"ti_contrasenia1\" placeholder=\"&#9000; Contraseña\" required>\n");
      out.write("                    <input type=\"submit\" name=\"btnLog\" value=\"Iniciar Sesión\" onclick=\"modificarPASS(1);\">\n");
      out.write("                    <input type=\"hidden\" name=\"hd_accion\"  id=\"hd_accion\" value=\"\">\n");
      out.write("               </form> \n");
      out.write("            </div>\n");
      out.write("         ");
  //registrar usuario en BD
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
            
      out.write("\n");
      out.write("            <div class=\"formulario\">\n");
      out.write("                <h2>Crea tu Cuenta</h2>\n");
      out.write("                <form action=\"index.jsp\" method=\"POST\">\n");
      out.write("                    <input type=\"text\" name=\"ti_nombre\" placeholder=\"Nombre\" required>\n");
      out.write("\n");
      out.write("                    <input type=\"email\" name=\"ti_email\" placeholder=\"Correo Electrónico\" required>\n");
      out.write("\n");
      out.write("                    <input type=\"password\" id=\"ti_contrasenia\" name=\"ti_contrasenia\" placeholder=\"Contraseña\" required>\n");
      out.write("\n");
      out.write("                    <input type=\"submit\" name=\"btn_registrar\" id=\"btn_registrar\" value=\"Registrarse\" onclick=\"modificarPASS(2);\">\n");
      out.write("\n");
      out.write("                    <input type=\"hidden\" name=\"hd_accion1\"  id=\"hd_accion1\" value=\"\">\n");
      out.write("                      \n");
      out.write("                </form>\n");
      out.write("            </div>           \n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("        <script src=\"js/jquery-3.1.1.min.js\"></script>  <!--for Front-end -->  \n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
