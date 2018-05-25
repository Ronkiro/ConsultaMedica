<%-- 
    Document   : consulta
    Created on : 20/05/2018, 20:19:01
    Author     : Alex
--%>

<%@page import="java.io.IOException"%>
<%@page import="app.Consulta"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--<%
            for (Consulta consulta : consultas) {
                try {
                    out.println("<div>" + consulta.getMedico());
                    out.println(" " + consulta.getPaciente());
                    out.println(" " + consulta.getEspecialidade());
                    out.println(" " + consulta.getConvenio());
                    out.println(" " + consulta.getData() + "</div><br>");
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>--%>
        <%!
            private static final String driver = "com.mysql.jdbc.Driver";
            private static final String user = "root";
            private static final String pass = "1q1a2w2s3e3d";
            private static final String url = "jdbc:mysql://localhost:3306/mysql?useSSL=false";
            String query;
    %>
        <%
            query = "SELECT * FROM consultas.consulta";
            
            try
            {
               Class.forName(driver); 
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
            
            try (Connection jdbc = DriverManager.getConnection(url, user, pass))
            {
                PreparedStatement stmt = jdbc.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    out.println("<div> Medico: " + rs.getString("medico") 
                            + " Paciente: " + rs.getString("paciente")
                            + " Especialidade: " + rs.getString("especialidade")
                            + " Convênio: " + rs.getString("convenio")
                            + " Data: " + rs.getString("data")
                            + " Hora: " + rs.getString("hora") + "<div>");
                    out.println("___________________________________________");
                }
            }
        %>
    </body>
</html>
