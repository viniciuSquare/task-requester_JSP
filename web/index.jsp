<%-- 
    Document   : index
    Created on : Nov 3, 2021, 11:21:28 PM
    Author     : square
--%>

<%@page import="repository.TaskRepo"%>
<%@page import="models.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

    </head>
    <body>
        <h1 id="page-title">Tarefas a completar</h1>
        
        <main>
            
            <div class="container tasks-listage" >
                <header>
                    <a class ='nav-button' href="task-request.html">Nova tarefa</a>
                </header> 
                <table>
                    <thead>
                        <th>ID</th>
                        <th>Assunto</th>
                        <th>Executor</th>
                        <th>Categoria</th>
                        <th>Estado</th>
                        <th>Opções</th>
                    </thead>
                    <tbody>
                        <% 
                            ArrayList<Task> tasks = new TaskRepo().getAllTasks();
                            for(Task task : tasks ) {
                                out.println("<tr> "+
                                    "<td>" + task.getId() + "</td>"+
                                    "<td>" + task.getSubject() + "</td>"+
                                    "<td>" + task.getExecutor() + "</td>"+
                                    "<td>" + task.getCategory()+"</td> "+
                                    "<td>" + task.getState() + "</td>" +                      

                                    "<td><a class ='delete-button' href='deleteTask.jsp?id="+ task.getId() +"'>Deletar</a>"+
                                    "<a class ='edit-button' href='editTaskForm.jsp?id="+ task.getId() + " ' >Editar</a>"+
                                    "<a class ='view-button' href='viewTask.jsp?id="+ task.getId() + " ' >Visualizar</a>"+ "</td>" +                      
                                "</tr>");
                            }
                        %>
                    </tbody>
                </table>
                


            </div>
        </main>
    </body>
</html>
