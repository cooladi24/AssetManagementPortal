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


try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
		String sql ="insert into asset values(?,?,?,?,?,?,?,?,?)";
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
		boolean a=pst.execute();
		if(!a)
			out.println("Data Insertion Successful!!");					
		con.close();
	} catch (Exception e) {
	out.println("Data Insertion Failed!! <br>");
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
