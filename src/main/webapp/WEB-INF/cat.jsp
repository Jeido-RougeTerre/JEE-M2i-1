<%@ page import="entities.Cat" %>
<%@ page import="java.util.List" %>
<%
    List<Cat> cats = (List<Cat>) request.getAttribute("cats");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Cats</title>
</head>
<body>

<header>
    <h1>Cat List</h1>
</header>

<main class="container">

    <% if(!(cats.isEmpty())){ %>
    <table class="table table-dark text-center align-middle">
        <thead>
        <tr>
            <th>Name</th>
            <th>Breed</th>
            <th>Favorite Meal</th>
            <th>Birth Date</th>
        </tr>
        </thead>

        <tbody>
        <% for  (Cat cat : cats){%>
        <tr>
            <td><%= cat.getName()%></td>
            <td><%= cat.getBreed()%></td>
            <td><%= cat.getFavMeal()%></td>
            <td><%= cat.getDateOfBirth()%></td>
        </tr>

        <%}%>

        </tbody>

    </table>

    <% } else {%>
    <p>No Cats in List</p>
    <% }%>

    <hr/>

    <h2>Add a Cat</h2>

    <div class="col-8 offset-2 text-bg-dark p-3">
        <form action="" method="post">
            <div class="mb-3">
                <label for="name">Name :</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="breed">Breed :</label>
                <input type="text" id="breed" name="breed">
            </div>
            <div class="mb-3">
                <label for="favMeal">Favorite Meals :</label>
                <input type="text" id="favMeal" name="favMeal">
            </div>
            <div class="mb-3">
            <label for="dateOfBirth">Date of Birth :</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth">
        </div>

            <button class="text-end">Submit</button>


        </form>
    </div>
</main>

</body>
</html>
