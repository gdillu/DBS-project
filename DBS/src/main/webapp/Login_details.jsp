<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>redirection</title>
</head>
<body>
<%@ page import="java.sql.*" %>
		<%
		try{
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "");
			System.out.println("Connected");
			String userName=request.getParameter("txtEmail");
			String pass=request.getParameter("txtPassword");
			System.out.println(userName+pass);
			int Income=Integer.parseInt(request.getParameter("txtIncome"));
			System.out.println(Income);
			int Currency =Integer.parseInt(request.getParameter("Currency"));
			System.out.println(Currency);
			String query="INSERT INTO login(user_name,password,income,Currency) VALUES(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,userName);
			ps.setString(2,pass);			
			ps.setInt(3,Income);			
			ps.setInt(4,Currency);
			ps.execute();
			ps.close();
			response.sendRedirect("Login.html");
			}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("now");
		}
			%>
</body>
</html>