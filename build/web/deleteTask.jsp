<%-- 
    Document   : deleteTask
    Created on : Nov 10, 2021, 11:59:31 PM
    Author     : square
--%>

<%@page import="repository.TaskRepo"%>

<% 
    Long id = Long.parseLong(request.getParameter("id"));
    if(TaskRepo.deleteTask(id)){
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("taskAddError.jsp");
    };
    
%>
