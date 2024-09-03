<%@page import="entities.Dog" %>
<%@page import="java.util.List" %>
<%
    List<Dog> dogs = (List<Dog>) request.getAttribute("dogs");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/bootstrapimports.html" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <title>Dogs</title>
</head>
<body>
<header>
    <nav class="one">
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
    </nav>
</header>
<main class="container">
    <div class="row my-3">
        <div class="col-8 offset-2 rounded text-bg-dark p-3">
            <h1 class="fw-light">- Dogs List -</h1>
            <hr>
            <% if (!dogs.isEmpty()) { %>
            <table class="table table-dark align-middle table-striped text-center">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Breed</th>
                    <th>Birth date</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% for (Dog d : dogs) {%>
                <tr>
                    <td><%= d.getId() %></td>
                    <td><%= d.getName() %></td>
                    <td><%= d.getBreed() %></td>
                    <td><%= d.getBirthDate().toString() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/dog/info?id=<%= d.getId() %>"
                           class="btn btn-outline-info"><i class="bi bi-eye"></i> Details</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%  } else { %>
            <p>There is no dog in the database yet!</p>
            <%  }  %>
            <hr>
            <div class="text-end">
                <a href="${pageContext.request.contextPath}/dog/addForm" class="btn btn-outline-success"><i
                        class="bi bi-plus-circle"></i> Add a Dog</a>
            </div>
        </div>
    </div>
</main>
</body>
</html>
