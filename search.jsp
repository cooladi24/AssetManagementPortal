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
<form action="searchpr.jsp" >
<table border="1">
<tr><td>Asset Id</td><td><input type="text" name="id"></td></tr>
<tr><td>Asset Description</td><td><input type="text" name="desc"></td></tr>
<tr><td>Version</td><td><input type="text" name="version"></td></tr>
<tr><td>Location</td><td><input type="text" name="location"></td></tr>
<tr><td>Asset Type</td><td><input type="int" name="atype"></td></tr>
<tr><td>Asset Classification</td><td><input type="int" name="aclass"></td></tr>
<tr><td>Validity Date</td><td><input type="text" name="vdate"></td></tr>
<center><tr><td colspan="2">Backup</td></tr></center>
<tr><td colspan="2"><center><input type="radio" name="aback" value="Yes">Yes</center></td></tr>
<tr><td colspan="2"><center><input type="radio" name="aback" value="No">No</center></td></tr>
<tr><td colspan="2"><center><input type="radio" name="aback" value="Maybe">Maybe</center></td></tr>
<tr><td>Asset Owner</td><td><input type="text" name="owner"></td></tr>

<tr><td colspan="2"><center><input type="submit" value="Search Data"></center></td></tr>
<tr><td colspan="2"><center><input type="reset" value="Reset"></center></td></tr>

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
