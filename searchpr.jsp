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
String typ=request.getParameter("atype");
String cl=request.getParameter("aclass");
String vd=request.getParameter("vdate");
String bac=request.getParameter("aback");
String aown=request.getParameter("owner");
String str=request.getParameter("option1");
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		//String sql ="select * from asset where assetid=? or assetdesc=? or version=? or loc=? or type=? or assetclass=? or validity=? or backup=? or assetown=?";
		String sql="select asset.assetid, asset.assetdesc,asset.version,asset.loc,asset.type,asset.assetclass,asset.validity,asset.backup,asset.assetown,(select asstype.assetvalue from asstype where asset.type=asstype.assetid) as AssetValue from asset inner join asstype on asset.type=asstype.assetid where asset.assetid=? or assetdesc=? or version=? or loc=? or type=? or assetclass=? or validity=? or backup=? or assetown=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,aid);
		pst.setString(2,adesc);
		pst.setString(3,ver);
		pst.setString(4,aloc);
		pst.setString(5,typ);
		pst.setString(6,cl);
		pst.setString(7,vd);
		pst.setString(8,bac);
		pst.setString(9,aown);		
		ResultSet rs=pst.executeQuery();
		out.println("<table border=5>");
		out.println("<tr><th>ASSET ID</th><th>ASSET DESCRIPTION</th><th>VERSION</th><th>LOCATION</th><th>ASSET TYPE</th><th>ASSET CLASSIFICATION</th><th>VALIDITY DATE</th><th>BACKUP</th><th>ASSET OWNER</th><th>ASSET VALUE</th></tr>");
		while(rs.next())
			out.println("<center><tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><center>"+rs.getInt(5)+"</center></td><td><center>"+rs.getInt(6)+"</center></td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td></tr></center>");
		out.println("</table>");
		
	} catch (Exception e) {
	out.println("Data Search Process Failed!! <br>");
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
