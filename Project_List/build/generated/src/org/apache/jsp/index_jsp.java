package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>INICIO</title>\n");
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
      out.write("                    <input type=\"text\" name=\"ti_nombre\" placeholder=\"&#xf004;  Nombre\" autofocus required>\n");
      out.write("                    <input type=\"password\" id=\"ti_contrasenia1\" name= \"ti_contrasenia1\" placeholder=\"&#9000; Contraseña\" required>\n");
      out.write("                    <input type=\"submit\" name=\"btnLog\" value=\"Iniciar Sesión\" onclick=\"modificarPASS(1);\">\n");
      out.write("                    <input type=\"hidden\" name=\"hd_accion\"  id=\"hd_accion\" value=\"\">\n");
      out.write("               </form> \n");
      out.write("            </div>\n");
      out.write("            <div class=\"formulario\">\n");
      out.write("                <h3><img src=\"img/favicon.ico\" width=\"45\" height=\"45\" alt=\"menu\"/></h3>\n");
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
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
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
