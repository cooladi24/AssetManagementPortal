<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script>
function funcall5(){
	window.location="signout.jsp";
}
</script>
<title>Asset Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
String uid = (String)session.getValue("userid");
if (uid != null)
{
%>
<center>
<b><marquee> ASSET MANAGEMENT PORTAL </marquee></b><br><br>
<form action="viewdbpr.jsp"><table border="1">
<tr><td colspan="2"><center>
<input type="submit" value="View Database">
</center></td></tr>
</table></form>
<center><button type='button' onclick='funcall5();'>Sign Out</button></center><br>
</center>
<%
}
else
{
%>
<script>
alert("Please Login to access this page");
</script>
<%
}		
%>
</body>
</html>
