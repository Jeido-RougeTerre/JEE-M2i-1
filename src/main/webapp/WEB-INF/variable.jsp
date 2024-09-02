<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 29/08/2024
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="prenom" type="java.lang.String" scope="request"/>
<jsp:useBean id="nom" type="java.lang.String" scope="request"/>
<jsp:useBean id="prenoms" type="java.util.ArrayList<java.lang.String>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>VARIABLES</title>
</head>
<body>
<h1>Affichage des variables</h1>

<h2> Bonjour ${nom}</h2>

<h2>${prenom}</h2>

<% for (String s : prenoms) {%>
  <p><%=s%></p>
<%}%>

</body>
</html>
