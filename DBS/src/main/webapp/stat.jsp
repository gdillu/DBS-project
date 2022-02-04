<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.*"%>
    
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="ISO-8859-1">
<%

		
	String userid = session.getAttribute("userid").toString();
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root", "");
    String query="SELECT c.cate_name,SUM(e.Amt) FROM category c,expense e WHERE e.login_id="+userid+" AND c.category_id=e.categoty_id GROUP BY e.categoty_id";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(query);
    String Cate_Name[]=new String[10];
    double Amt[] =new double[10];
    double per[]=new double[10];
    double sum=0;
  
    int i=0;
    try
    {
    while(rs.next())
    {
    	
    		Cate_Name[i] = rs.getString(1);
    		Amt[i] = rs.getInt(2);
    		sum=sum+Amt[i];
    		i=i+1;
    }%>
      <% 
    for(i=0;i<4;i++){
    	per[i]=(Amt[i]/sum)*100;
    	per[i] = per[i]*100;
    	per[i] = Math.round(per[i]);
    	per[i]= per[i]/100;
    }
    double max=Amt[0];
   String PAR=null;
    for(i=1;i<5;i++)
    {
    	if(max<Amt[i])
    	{
    		max=Amt[i];
    		PAR=Cate_Name[i];
    		
    	}
    }
    out.println("<h2 style=\"color: red;\">You Have More Expenses On "+PAR+".....<h2> <span>Worth of "+max );
    }catch(Exception e)
    {}
	  %>
<title>Pie Chart</title>
</head>
<body>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;

List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

		
for(i=0;Cate_Name[i]!=null;i++)
{
map = new HashMap<Object,Object>(); map.put("label", Cate_Name[i]); map.put("y",per[i]);  list.add(map);
}


String dataPoints = gsonObj.toJson(list);

%>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Category Wise Expenses"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.println(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<table border=1 align=center style="text-align:center">
    <thead>
        <tr>
          
           <th>Category</th>
           <th>Amount</th>
        </tr>
    </thead>
    <tbody>
      <% 
		for(i=0;Cate_Name[i]!=null;i++)
      	{
      	%>
      <tr>
              <td><%=Cate_Name[i] %></td>
              <td><%=Amt[i] %></td>
              
                      
          </tr>
          <%}%>
         </tbody>
      </table>
<a href="demo.jsp">Back</a>
</body>
</html>