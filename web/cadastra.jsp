<%-- 
    Document   : cadastra
    Created on : 20/05/2018, 18:41:12
    Author     : Alex
--%>

<%@page import="app.sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String medico, especialidade, paciente, data, hora, convenio;
    
    medico = request.getParameter("medico");
    especialidade = request.getParameter("especialidade");
    paciente = request.getParameter("paciente");
    data = request.getParameter("data");
    hora = request.getParameter("hora");
    if(request.getParameter("convenio").equals(""))
    {
        convenio = "Nenhum ou não informado";
    }
    else
    {
        convenio = request.getParameter("convenio");
    }
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas Médicas</title>
    </head>
    <body>
        <div>
            <h1 style="text-align: center">Consulta Médica</h1><br><br>
            <form method="GET" action="cadastra.jsp">
                Médico (*): <input type="text" name="medico"><br>
                Especialidade (*): <input type="text" name="especialidade"><br>
                Paciente (*): <input type="text" name="paciente"><br>
                Data da Consulta (*)(dd/mm/aaaa MAX 10 caracteres): <input type="text" name="data"><br>
                Hora da Consulta (*)(HH:mm MAX 5 caracteres): <input type ="text" name="hora"><br>
                Convênio: <input type="text" name="convenio"><br><br>
                <input type="submit" value="Cadastrar">
            </form>
            <form method="POST" action="consulta.jsp">
                <input type="submit" value="Consultar cadastros">
            </form><br><br>
            
            <b><%=app.sql.insert(medico, especialidade, paciente, data, hora, convenio)%></b>
        </div>
    </body>
</html>