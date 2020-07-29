<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Asset Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%@page import="java.sql.*"%>
<%
String uid = (String)session.getValue("userid");
if (uid != null)
{
String aid=request.getParameter("id");
String adesc=request.getParameter("desc");
String ver=request.getParameter("version");
String aloc=request.getParameter("location");


try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		String sql ="delete from asset where assetid=? and assetdesc=? and version=? and loc=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,aid);
		pst.setString(2,adesc);
		pst.setString(3,ver);
		pst.setString(4,aloc);
		boolean a=pst.execute();
		if(!a)
			out.println("Data Deletion Successful!!");					
		con.close();
	} catch (Exception e) {
	out.println("Data Deletion Failed!! <br>");
	out.println(e);
	}
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
