<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css1.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">

</script>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
	<fmt:setLocale value="${param['locale'] }" />
	
	<fmt:setBundle basename="MessageResources" var="msg" />
	<div class="header">
		<a href="index.jsp?locale=sp"><img src="images\spain.png" height=20 width=20></a> <a
			href="index.jsp?locale=fr"><img alt="French"
			src="images\dc4LoLxri.jpg" height=20 width=20 id="fr"></a> <a
			href="index.jsp?locale=''"> <img
			src="images\indian-flag-design-stylish-circular-32420020.jpg"
			height=20 width=20 id="in">
		</a>
	</div>
	<br>
	<%@include file="header.jsp" %>
	<div class="menu">
		<%@include file="menu.jsp" %>
	</div>
	<br>
	
	<h1>
		Registered User
	</h1>
	
	<form action="Validate" method="post">
		<table>
			<tr>
				<td><label><fmt:message key="forms.label.role"
							bundle="${msg}"></fmt:message></label></td>
				<td><select name="role">
						<option>Administrator</option>
						<option>Manager</option>
						<option>Lab Technician</option>
						<option>Operators</option>
				</select></td>
			</tr>
			<tr>
				<td><label><fmt:message key="forms.label.labcode"
							bundle="${msg}"></fmt:message></label></td>
				<td>
				<dataList id="json-datalist"></dataList><input type="text" name="labCode" id="labCode" placeholder="Lab Code" list="json-datalist">
				</td>
			</tr>

			<tr>
				<td><label><fmt:message key="forms.label.userName"
							bundle="${msg}"></fmt:message></label></td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td><label><fmt:message key="forms.label.password"
							bundle="${msg}"></fmt:message></label></td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value="<fmt:message key="forms.label.submit" bundle="${msg}"></fmt:message>">
				</td>
			</tr>
		</table>
		<input type="hidden" id="hiddentxt">
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer>
	<%@include file="Footer.jsp" %>
	</footer>


</body>
<script type="text/javascript"src="javascript//data.js">

/**
 * 
 */



</script>
</html>