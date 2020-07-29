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
String aval=request.getParameter("assval");
String str=request.getParameter("query");

if(str.equals("delete"))
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		String sql ="delete from asstype where assetid=? or assetvalue=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,aid);
		pst.setString(2,aval);
		boolean a=pst.execute();
		if(!a)
			out.println("Data Deletion Successful!!");					
		con.close();
	} catch (Exception e) {
	out.println("Data Deletion Failed!! <br>");
	out.println(e);
	}

else if(str.equals("insert"))
	try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		String sql ="insert into asstype values(?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,aid);
		pst.setString(2,aval);
		boolean a=pst.execute();
		if(!a)
			out.println("Data Insertion Successful!!");					
		con.close();
	} catch (Exception e) {
	out.println("Data Insertion Failed!! <br>");
	out.println(e);
	}

else if(str.equals("search"))
	try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		
		String sql="select * from asstype where assetid=? or assetvalue=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,aid);
		pst.setString(2,aval);
		ResultSet rs=pst.executeQuery();
		out.println("<table border=5>");
		out.println("<tr><th>ASSET ID</th><th>ASSET VALUE</th></tr>");
		while(rs.next())
			out.println("<center><tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td></tr></center>");
		out.println("</table>");
		
	} catch (Exception e) {
	out.println("Data Search Process Failed!! <br>");
	out.println(e);
	}	

else
	try{
		Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		Statement statement = con.createStatement();
		String sql ="select * from asstype";
		
		ResultSet rs = statement.executeQuery(sql);
		out.println("<table border=5>");
		out.println("<tr><th>ASSET ID</th><th>ASSET VALUE</th></tr>");
		while(rs.next())
			out.println("<center><tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td></tr></center>");
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
