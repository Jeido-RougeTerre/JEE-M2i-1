<%@page import="entities.Dog" %>
<%@page import="java.util.List" %>
<%
    List<Dog> dogs = (List<Dog>) request.getAttribute("dogs");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>Dogs</title>
</head>
<body>
<header>
    <h1>Dog List</h1>
</header>
<main class="container">
    <% if (dogs == null || dogs.isEmpty()) { %>
    <p>No Dogs in DataBase</p>
    <% } else { %>
    <table class="table table-dark text-center align-middle">
        <thead>
        <tr>
            <th>Name</th>
            <th>Breed</th>
            <th>Birth Date</th>
            <th>Link</th>
        </tr>
        </thead>
        <tbody>
        <% for (Dog dog : dogs) {%>
        <tr>
            <td><%=dog.getName()%>
            </td>
            <td><%=dog.getBreed()%>
            </td>
            <td><%=dog.getBirthDate()%>
            </td>
            <td><a href="${pageContext.request.contextPath}/dog/<%=dog.getId()%>">↩</a></td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <%}%>

    <hr/>

    <a href="${pageContext.request.contextPath}/dog/add">Add a dog</a>

</main>
</body>
</html>
