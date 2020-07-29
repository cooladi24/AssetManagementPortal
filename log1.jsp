<html><head>
<script>
function funcall(){
	window.location="insert.jsp";
}
function funcall1(){
	window.location="search.jsp";
}
function funcall2(){
	window.location="delete.jsp";
}
function funcall3(){
	window.location="view.jsp";
}
function funcall4(){
	window.location="assetdetail.jsp";
}
function funcall5(){
	window.location="signout.jsp";
}
</script></head>
<body>
<%@page import="java.sql.*"%>
<%
String employeeid="";
employeeid=request.getParameter("eid");
session.putValue("userid",employeeid);
%>
<% 
String uid = (String)session.getValue("userid");
if (uid != null)
{
int emid=Integer.parseInt(request.getParameter("eid"));
String empass=request.getParameter("epass");
		try{
			Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
            String sql ="select pass from emp where empid=?";
    		PreparedStatement pst = con.prepareStatement(sql);
    		pst.setInt(1,emid);		
    		ResultSet rs=pst.executeQuery();
    		while(rs.next())
    		if(empass.equals(rs.getString(1)))
    			{out.println("<center><b><h3>Welcome to the Asset Management Portal</b></h3></center><br><br>");
    			out.println("<center><button type='button' onclick='funcall();'>Insert Asset</button></center><br>");
    			out.println("<center><button type='button' onclick='funcall1();'>Search Asset</button></center><br>");
    			out.println("<center><button type='button' onclick='funcall2();'>Delete Asset</button></center><br>");
    			out.println("<center><button type='button' onclick='funcall3();'>View Asset Table</button></center><br>");
    			out.println("<center><button type='button' onclick='funcall4();'>Asset Type Management</button></center><br><br><br>");
    			out.println("<center><button type='button' onclick='funcall5();'>Sign Out</button></center><br>");
    			
    			}
    		else
    			out.println("Login Denied!!");
    		con.close();
    	} catch (Exception e) {
    	out.println("Login Process Failed <br>");
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