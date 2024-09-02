<%@page import="entities.Dog" %>
<%
    Dog dog = (Dog) request.getAttribute("dog");
    String strName = "Unknown dog";
    if (dog != null) {
        strName = dog.getName();
    }
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <title><%=strName%>
    </title>
</head>
<body>
<header>
    <nav class="one">
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/dog/list">Dog-List</a>
    </nav>
</header>
<h1><%=strName%>
</h1>
<% if (dog != null) {%>
<p class="breed"><%=dog.getBreed()%>
</p>
<p><%=dog.getBirthDate()%>
</p>
<%} else {%>
<p>Dog not Found</p>
<%}%>
</body>
</html>