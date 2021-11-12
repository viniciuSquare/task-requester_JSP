<%-- 
    Document   : addTask
    Created on : Nov 10, 2021, 8:20:11 PM
    Author     : square
--%>

<%@page import="repository.TaskRepo"%>
<jsp:useBean id="task" class="models.Task"></jsp:useBean>
<jsp:setProperty property="*" name="task"/>

<%
    Boolean wasTransactionDone = TaskRepo.saveTask(task);
    if(wasTransactionDone) {
        response.sendRedirect("taskAdded.jsp");
    } else {
        response.sendRedirect("taskAddError.jsp");
    }
    %>