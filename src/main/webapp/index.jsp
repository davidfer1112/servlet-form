<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Formulario de usurios</title>
</head>
<body>

<h1>Formulario de registro</h1>

<%--<%--%>
<%--    if (errores != null && errores.size() > 0) {--%>
<%--%>--%>
<%--<ul class="alert alert-danger">--%>
<%--    <%--%>
<%--        for (String error : errores.values()) {--%>
<%--    %>--%>
<%--    <li><%=error%>--%>
<%--    </li>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</ul>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>

<div class="px-5">
    <form action="/webapp-form/registro" method="post">

        <%----%>
        <div class="row mb-3">
            <label for="username" class="col-form-label col-sm-2">Usuario</label>
            <div class="col-sm-4">
                <input type="text" name="username" id="username" class="form-control" value="${param.username}">
            </div>
            <%
                if (errores != null && errores.containsKey("username")) {
                    out.println("<p class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("username") + "</p>");
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label for="password" class="col-form-label col-sm-2">Contraseña</label>
            <div class="col-sm-4">
                <input type="password" name="password" id="password" class="form-control">
            </div>
            <%
                if (errores != null && errores.containsKey("password")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("password")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label for="email" class="col-form-label col-sm-2">Correo</label>
            <div class="col-sm-4">
                <input type="text" name="email" id="email" class="form-control" value="${param.email}">
            </div>
            <%
                if (errores != null && errores.containsKey("email")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("email")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="pais"></label>
            <div class="col-sm-4">
                <select name="pais" id="pais" class="form-select">
                    <option value="">-- selecionar --</option>
                    <option value="ES" ${param.pais.equals("ES")? "selected": ""}>España</option>
                    <option value="CO" ${param.pais.equals("CO")? "selected": ""}>Colombia</option>
                    <option value="Cl" ${param.pais.equals("CL")? "selected": ""}>Chile</option>
                    <option value="AR" ${param.pais.equals("AR")? "selected": ""}>Argentina</option>
                    <option value="MX" ${param.pais.equals("MX")? "selected": ""}>Mexico</option>
                </select>
            </div>
            <%
                if (errores != null && errores.containsKey("pais")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("pais")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="lenguajes">Lenguajes de programacion y Frameworks</label>
            <div class="col-sm-4">
                <select name="lenguajes" id="lenguajes" multiple class="form-select">
                    <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"selected":""}>Java SE</option>
                    <option value="jakarta" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("jakarta")).get()?"selected":""}>Jakarta EE9</option>
                    <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"selected":""}>Spring Boot</option>
                    <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"selected":""}>Java Script</option>
                    <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"selected":""}>React</option>
                    <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("angular")).get()?"selected":""}>Angular</option>
                </select>
            </div>
            <%
                if (errores != null && errores.containsKey("lenguajes")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("lenguajes")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2">roles</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_ADMIN" id="ROLE_ADMIN"
                ${paramValues.lenguajes.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()?"checked":""}
                       class="form-check-input">
                <label class="form-check-label" for="ROLE_ADMIN">Administrador</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_USER" id="ROLE_USER"
                ${paramValues.lenguajes.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""}
                       class="form-check-input">
                <label class="form-check-label" for="ROLE_USER">Usuario</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_MODERADOR" id="ROLE_MODERADOR"
                ${paramValues.lenguajes.stream().anyMatch(v->v.equals("ROLE_MODERADOR")).get()?"checked":""}
                       class="form-check-input">
                <label class="form-check-label" for="ROLE_MODERADOR">Moderador</label>
            </div>
            <%
                if (errores != null && errores.containsKey("roles")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("roles")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2">Idiomas</label>
            <div class="form-check col-sm-2">
                <%--@declare id="es"--%>
                <input type="radio" name="idioma" value="es" class="form-check-input" ${param.pais.equals("es")?"checked": ""}>
                <label class="form-check-label" for="es">Español</label>
            </div>
            <div class="form-check col-sm-2">
                <%--@declare id="en"--%>
                <input type="radio" name="idioma" value="en" class="form-check-input" ${param.pais.equals("en")? "checked": ""}>
                <label class="form-check-label" for="en">Ingles</label>
            </div>
            <div class="form-check col-sm-2">
                <%--@declare id="fr"--%>
                <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.pais.equals("fr")? "checked": ""}>
                <label class="form-check-label" for="fr">Frances</label>
            </div>
            <%
                if (errores != null && errores.containsKey("idioma")) {
            %>
            <p class="alert alert-danger col-sm-4" style="color: red;"><%=errores.get("idioma")%>
            </p>
            <%
                }
            %>
        </div>

        <%----%>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="habilitar">Habilitar</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
            </div>
        </div>

        <div class="row mb-3">
            <div>
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </div>


        <input type="hidden" value="12345" name="secreto">

    </form>
</div>


</body>
</html>