<%-- 
    Document   : editTaskForm
    Created on : Nov 10, 2021, 11:15:11 PM
    Author     : square
--%>

<%@page import="repository.TaskRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Task"  %>

<% 
    String id = request.getParameter("id");
    Task task = TaskRepo.getTaskById(Long.parseLong(id));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar solicitação</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    </head>
    <body>
        <form action="editTask.jsp" method="post" class="container">
        <h1 id="page-title">Solicitar serviço</h1>
        <input type="hidden" name="id" value="<%=task.getId()%>"/>

        <div class="input-group">
          <label for="subject">Assunto</label>
          <input value="<%=task.getSubject()%>" type="text" name="subject" id="assunto" placeholder="digite o assunto da demanda">
        </div>
        <div class="input-group">
          <label for="description">Decrição</label>
          <textarea name="description" id="descricao" cols="30" rows="10"> <%=task.getDescription()%> </textarea>
        </div>
        <div class="input-group">
            <label for="category">Categoria</label>
            <select name="category" id="category">
              <option value="Manutencao">Manutenção</option>
              <option value="Suporte">Suporte</option>
              <option value="gestao">Gestão</option>

            </select>
        </div>
        <div class="input-group">
          <label for="executor">Executor</label>
          <input value="<%=task.getExecutor()%>" type="text" name="executor" id="executor" placeholder="A quem esse pedido é destinado"/>
        </div>
        <div class="input-group">
            <label for="executor">Estado</label>
            <input value="<%=task.getState()%>" type="text" name="state" id="state" placeholder="Estado da solicitação"/>
        
        </div>
        <button  type="submit">Enviar</button>
        <a class="delete-button"href="deleteTask.jsp?id=<%=task.getId()%>">Deletar</a>
      </form>
    </body>
</html>
