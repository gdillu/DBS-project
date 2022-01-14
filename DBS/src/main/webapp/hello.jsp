<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
    media="screen" />
<title></title>
</head>
<body>
	<%@page import="java.sql.*" %>
	<div class="form-control" >
	<select name="Category" id="Caegory" class="form-control">
		<option value="1">Tax</option>
		<option value="2">Clothings</option>
		<option value="3">Groceries</option>
		<option value="4">Other</option>
	</select>
	<input type="submit" value="add">
	</div>
	<%
		String userid = session.getAttribute("userid").toString();
	    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "");
		Statement st=con.createStatement();
		String query="SELECT user_name FROM login WHERE login_id="+userid;
		ResultSet rs=st.executeQuery(query);
		String user_name="Dileep";
		while(rs.next())
		{
			user_name=rs.getString(1);
		}
		out.println("Hello>>"+user_name);
		
	%>
	
</body>
</html>