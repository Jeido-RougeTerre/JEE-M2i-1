<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <title>Adding a Dog</title>
</head>
<body>
<header>
    <nav class="one">
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/dog/list">Dog-List</a>
    </nav>
</header>
<h1>Add a Dog</h1>

<div class="col-8 offset-2 text-bg-dark p-3">
    <form action="" method="post">
        <div class="mb-3">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
        </div>
        <div class="mb-3">
            <label for="breed">Breed:</label>
            <input type="text" id="breed" name="breed">
        </div>
        <div class="mb-3">
            <label for="birthDate">Birth Date</label>
            <input type="date" id="birthDate" name="birthDate">
        </div>

        <button class="text-end">Submit</button>
    </form>
</div>

</body>
</html>
