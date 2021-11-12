<%-- 
    Document   : viewTask
    Created on : Nov 11, 2021, 10:49:02 PM
    Author     : square
--%>

<%@page import="repository.TaskRepo"%>
<%@page import="models.Task"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Task task = TaskRepo.getTaskById(Long.parseLong(id));
    String descricao;
    
    if(task.getDescription() != null) {
        descricao = "-";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    </head>
    <body>
        <main class="container">
            <div class="input-group">
                <label>Assunto</label>
                <h1><%=task.getSubject()%></h1>
            </div>
            
            <div class="input-group">
                <label for="description">Descrição</label>
                <p id="description"><%=task.getDescription()%></p>    
            </div>
            <div class="input-group">
                <label for="executor">Executor</label>
                <h4 id="executor" ><%=task.getExecutor()%></h4>    
            </div>
            <div class="input-group">
                <label for="state">Estado</label>
                <p id="state" ><%=task.getState()%></p>    
            </div>
            <div class="input-group">
                <label for="category">Categoria</label>
                <p id="category" ><%task.getCategory();%></p>    
            </div>
                       
            <a class ='delete-button' href="deleteTask.jsp?id=<%=task.getId()%>">Deletar</a>
            <a class ='edit-button' href="editTaskForm.jsp?id=<%=task.getId()%>">Editar</a>
        </main>       
    </body>
</html>
