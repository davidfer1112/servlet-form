package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");

        String idioma = req.getParameter("idioma");
        boolean habilitar = req.getParameter("habilitar") != null &&
                req.getParameter("habilitar").equals("on");
        String secreto = req.getParameter("secreto");

        Map<String,String> errores = new HashMap<>();

        if (username == null || username.isBlank()) {
            errores.put("username","El campo username es requerido");
        }

        if (password == null || password.isBlank()) {
            errores.put("password","El campo password es requerido");
        }

        if (email == null || !email.contains("@")) {
            errores.put("email","El campo email es requerido y debe contener un formato de correo");
        }

        if (pais == null || pais.isBlank()) {
            errores.put("pais","El campo pais es requerido");
        }

        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes","El campo lenguajes es requerido");
        }

        if (roles == null || roles.length == 0) {
            errores.put("roles","El campo roles es requerido");
        }

        if (idioma == null || idioma.isBlank()) {
            errores.put("idioma","El campo idioma es requerido");
        }

        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("    <head>");
                out.println("        <meta charset=\"UTF-8\">");
                out.println("        <title></title>");
                out.println("    </head>");
                out.println("    <body>");
                out.println("        <h1>Resultado formulario</h1>");
                out.println("        <ul>");
                out.println("            <li>Username: " + username + "</li>");
                out.println("            <li>Password: " + password + "</li>");
                out.println("            <li>Email: " + email + "</li>");
                out.println("            <li>Pais: " + pais + "</li>");
                out.println("            <li>Lenguajes: <ul>");
                for (String lenguaje : lenguajes) {
                    out.println("                <li>" + lenguaje + "</li>");
                }
                out.println("            </ul></li>");
                out.println("            <li>Roles: <ul>");
                Arrays.asList(roles).forEach(rol -> {
                    out.println("                <li>" + rol + "</li>");
                });
                out.println("            </ul></li>");
                out.println("            <li>Idioma: " + idioma + "</li>");
                out.println("            <li>Habilitar: " + habilitar + "</li>");
                out.println("            <li>Secreto: " + secreto + "</li>");
                out.println("        </ul>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
//                errores.forEach(error -> {
//                    out.println("            <li style=\"color: red;\">" + error + "</li>");
//                });
//                out.println("            <li><a href=\"/webapp-form\">Volver al formulario</a></li>");
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
