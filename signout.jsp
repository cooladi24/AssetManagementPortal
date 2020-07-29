<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script>
function funcall6(){
	window.location="login.jsp";
}
</script>
<title>Asset Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
String uid = null;
%>
<script>
alert("You have been logged out.. Please Login to access the portal");
</script>
<br><br><br>
<%
out.println("<center><button type='button' onclick='funcall6();'>Log In To Portal</button></center><br>");		
%>
</body>
</html>
