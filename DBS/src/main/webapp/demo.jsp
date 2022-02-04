<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="content.css" />
    <title>Expense Tracker</title>
  </head>
  <body>
    <h2>Home Management System</h2>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*,java.io.*" %>
	<%
		String userid = session.getAttribute("userid").toString();
	    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "");
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
		String query="SELECT l.user_name,c.c_name,l.income FROM login l,Currency c WHERE login_id="+userid+" AND c.c_id=l.Currency";
		String query2="SELECT e.dateq,c.cate_name,e.Item_name,e.Amt FROM expense e,category c,login l WHERE e.login_id=l.login_id AND c.category_id=e.categoty_id AND l.login_id="+userid;
		String query3="SELECT SUM(e.Amt) FROM expense e,login l WHERE e.login_id=l.login_id AND e.login_id="+userid;
		ResultSet rs=st1.executeQuery(query);
		ResultSet rs1=st2.executeQuery(query2);
		ResultSet rs3=st3.executeQuery(query3);
		String user_name="Dileep";
		String Currency="INR";
		int income=0;
		int expense=0;
		while(rs.next())
		{
			user_name=rs.getString(1);
			Currency=rs.getString(2);
			income=rs.getInt(3);
		}
		while(rs3.next())
		{
			expense=rs3.getInt(1);
		}
		out.println("Hello>>"+user_name);
		
	%>
    <div class="container" style="margin-bottom:0px;">

      <div class="inc-exp-container">
       
        <div>
          <h4>Expense</h4>
          <p id="money-minus" class="money minus"><%out.println(Currency+" "+expense);%></p>
        </div>
      </div>
      <h4 style="padding: 5px 130px 5px;">History</h4>
       <table border=1 align=center style="text-align:center">
      <thead>
          <tr>
            <th>Date</th>
             <th>Category</th>
             <th>Item-Name</th>
             <th>Amount</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs1.next())
        	{
        	%>
        <tr>
                <td><%=rs1.getDate(1) %></td>
                <td><%=rs1.getString(2) %></td>
                <td><%=rs1.getString(3) %></td>
                <td><%=rs1.getInt(4) %></td>
                        
            </tr>
            <%}%>
           </tbody>
        </table>
	  
      <h3>Add new transaction</h3>
      <form id="form" action="demo.jsp" enctype='multipart/form-data' method="get">
      	<div class="form-control">
      	<label for="collection">Date:</label>
		<input type="date" id="date" name="date" style="
    float: right;
    border-radius: 10px;
    padding: 3px;
    border: 3px solid #9c88ff;
    color: white;
    background: #9c88ff;
"></div>
      	<div class="form-control">
      		<label for="list" id="category">Category</label>
      		<select required name="category" id="category" class="form-control" style="
    float: right;
    border-radius: 10px;
    padding-block: 10px;
    border: 3px solid #9c88ff;
    color: white;
    background: #9c88ff;
">
				<option value="" selected disabled hidden>Select</option>
      			<option value="1">Tax</option>
      			<option value="2">CLoth</option>
      			<option value="3">Groceries</option>
      			<option value="4">Others</option>
      			</select>
      		</div>
        <div class="form-control">
          <label for="text">Item-Name</label>
          <input type="text" id="text" placeholder="Enter text..." name="Name" required/>
        </div>
        <div class="form-control">
          <label for="text">Description</label>
          <input type="text" id="text" placeholder="Enter Details..." name="Tame"/>
        </div>
        <div class="form-control">
          <label for="amount"
            >Amount <br />
           </label
          >
          <input type="number" id="amount" placeholder="Enter amount..." name="amt" required/>
        </div>
        
        <button class="btn" type="submit" value="add" name="add">Add transaction</button>
       </form>
       <%if(request.getParameter("add")!=null)
    	   {
    	   		String a=request.getParameter("date");
    	   		System.out.println(a); 
    	   		int b=Integer.parseInt(request.getParameter("category"));
    	   		String e=request.getParameter("Tame");
    	   		String c=request.getParameter("Name");
    	   		int d=Integer.parseInt(request.getParameter("amt"));
    	   		Statement st4=con.createStatement();
    	   		String query4="INSERT INTO expense(login_id,categoty_id,Item_name,dateq,Amt,Notes) VALUES(?,?,?,?,?,?)";
    	   		PreparedStatement ps=con.prepareStatement(query4);
    	   		ps.setInt(1,(Integer.parseInt(userid)));
    	   		ps.setInt(2,b);
    	   		ps.setString(3,c);
    	   		ps.setString(4,a);
    	   		ps.setInt(5,d);
    	   		ps.setString(6,e);
    	   	 int row=ps.executeUpdate();
             if(row>0)
             {
            	 out.println("Succssfully Inserted");
             }
             ps.close();
             response.sendRedirect("demo.jsp");
             
             
    	   	}
       %>
    </div>
    <div class="logot" STYLE="DISPLAY:INLINE-FLEX">
    <form action="stat.jsp" method="get">
    	<button class="btn" type="submit" value="1" name="stat">View Statistics</button>
    	
    	<%  if(request.getParameter("stat")!=null)
    			{session.setAttribute("userid", userid);
					request.getRequestDispatcher("stat.jsp").forward(request,response); 
				}%>
    </form>
    <a href="logout.jsp" style="
    PADDING: 17PX 5PX 17PX 100PX;
    TEXT-DECORATION: NONE;
">Logout</a>
    </div>
    
    
  </body>
</html>