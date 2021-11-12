<%-- 
    Document   : editTask
    Created on : Nov 10, 2021, 11:39:50 PM
    Author     : square
--%>
<%@page import="repository.TaskRepo"%>
<jsp:useBean id="task" class="models.Task" />
<jsp:setProperty property="*" name="task"/>

<% 
    TaskRepo.updateTask(task);
    response.sendRedirect("index.jsp");
    
%>