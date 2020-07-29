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
try{
			Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
			Statement statement = con.createStatement();
			//String sql ="select * from asset";
			String sql="select asset.assetid, asset.assetdesc,asset.version,asset.loc,asset.type,asset.assetclass,asset.validity,asset.backup,asset.assetown,(select asstype.assetvalue from asstype where asset.type=asstype.assetid) as AssetValue from asset inner join asstype on asset.type=asstype.assetid";
			ResultSet rs = statement.executeQuery(sql);
			out.println("<table border=5>");
			out.println("<tr><th>ASSET ID</th><th>ASSET DESCRIPTION</th><th>VERSION</th><th>LOCATION</th><th>ASSET TYPE</th><th>ASSET CLASSIFICATION</th><th>VALIDITY DATE</th><th>BACKUP</th><th>ASSET OWNER</th><th>ASSET VALUE</th></tr>");
			while(rs.next())
				out.println("<center><tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><center>"+rs.getInt(5)+"</center></td><td><center>"+rs.getInt(6)+"</center></td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td></tr></center>");
			out.println("</table>");
		
		con.close();
		} catch (Exception e) {
		out.print(e);
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
