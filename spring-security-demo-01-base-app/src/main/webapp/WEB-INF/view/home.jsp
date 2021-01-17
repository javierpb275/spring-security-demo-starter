<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
<title>Home Page</title>
</head>

<body>

<h2>Home Page</h2>
<hr>

<p>
Hello World
</p>

<hr>

<!-- display user name and role-->
<p>
User:<security:authentication property="principal.username"/>
<br><br>
Role(s):<security:authentication property="principal.authorities"/>
</p>

<security:authorize access="hasRole('MANAGER')">

<!-- Add a link to point to /leaders ... this is for the managers -->
<p>
<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
(only for managers)
</p>

</security:authorize>

<security:authorize access="hasRole('ADMIN')">

<!-- Add a link to point to /systems ... this is for the admins -->
<p>
<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
(only for admins)
</p>

</security:authorize>

<hr>
<!-- Add logout button -->
<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			
	<input type="submit" value="Logout"/>

</form:form>

</body>

</html>