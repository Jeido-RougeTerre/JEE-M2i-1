<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mode" type="java.lang.String" scope="request"/>
<jsp:useBean id="dog" type="entities.Dog" scope="request"/>
<html>
<head>
    <%@ include file="/WEB-INF/bootstrapimports.html" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <title><%=mode.substring(0,1).toUpperCase() + mode.substring(1).toLowerCase()%> a Dog</title>
</head>
<body>
<header>
    <nav class="one">
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/dog/list">Dog-List</a>
    </nav>
</header>
<main class="container">
    <div class="my-3 row">
        <div class="col-8 offset-2 p-3 rounded text-bg-dark">
            <h1 class="fw-light">-<%= mode.substring(0, 1).toUpperCase() + mode.substring(1).toLowerCase() %> a Dog-</h1>
            <hr>
            <form action="<%= mode.equals("add") ? "add" : "" %>" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" value="<%= dog.getName() %>" <% if (mode.equals("add")) { %> required <% } else { %> readonly <% } %>>
                </div>
                <div class="mb-3">
                    <label for="breed" class="form-label">Breed:</label>
                    <input type="text" name="breed" id="breed" class="form-control" value="<%= dog.getBreed() %>" <% if (mode.equals("add")) { %> required <% } else { %> readonly <% } %>>
                </div>
                <div class="mb-3">
                    <label for="birthDate" class="form-label">Birth date:</label>
                    <input type="date" name="birthDate" id="birthDate" class="form-control" value="<%= dog.getBirthDate() %>" <% if (mode.equals("add")) { %> required <% } else { %> readonly <% } %>>
                </div>

                <hr>
                <div class="text-end">
                    <% if (mode.equals("add")) { %>
                    <button class="btn btn-outline-success"><i class="bi bi-plus-circle"></i> Add Dog</button>
                    <% } else { %>
                    <a href="${pageContext.request.contextPath}/dog/list" class="btn btn-outline-secondary"><i
                            class="bi bi-arrow-counterclockwise"></i>
                        Return</a>
                    <% }  %>
                </div>
            </form>
        </div>
    </div>
</main>

</body>
</html>
