<%@page import="java.sql.*"%>
<%
		try{
			Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///project","root","12345");
			Statement statement = con.createStatement();
			String sql1 ="create table asset(assetid varchar(15) not null primary key, assetdesc varchar(30) not null,version varchar(15) not null, loc varchar(30) not null,type int(2) not null references asstype(assetid), assetclass int(2) not null, validity varchar(20) not null, backup varchar(5) not null, assetown varchar(12))";
			String sql2 ="create table asstype(assetid int(2) not null primary key, assetvalue varchar(20) not null)";
			String sql3 ="create table emp(empid int(6) not null primary key, name varchar(30) not null,pass varchar(20) not null)";
			statement.execute(sql1);
			statement.execute(sql2);
			statement.execute(sql3);
			out.println("Database module created for storing data...");		
			con.close();
			} catch (Exception e) {
			out.print(e);
			}
%>