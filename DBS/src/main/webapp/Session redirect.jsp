<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="login.bean.*" %>
	<%
	try{
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "");
		String user=request.getParameter("txtEmail");
		String pass=request.getParameter("txtPassword");
		String query="SELECT login_id FROM login WHERE user_name=\""+user+"\" AND password=\""+pass+"\"";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		boolean stats=false;
		stats=rs.next();
		if(stats)
		{
				String userid=String.valueOf(rs.getInt(1));
				session.setAttribute("userid", userid);
				request.getRequestDispatcher("demo.jsp").forward(request,response);
				
		}
		else
		{
			out.print("<p style=\"color:red\">Sorry username or password error</p>");    
	        request.getRequestDispatcher("/Login.html").include(request,response);    
	        
			
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		%>
</body>
</html>