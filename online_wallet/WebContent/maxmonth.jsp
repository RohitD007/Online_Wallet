<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Range Trans</title>
</head>
<body>
 <% try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");	
response.setContentType("text/html"); 
String from=request.getParameter("from");
String end=request.getParameter("end");

PreparedStatement st=con.prepareStatement("select max(amount) as Maximum_amount from SEND_TRANSACTION where Date_Time between ? and ?");
st.setString(1,from);
st.setString(2,end);

ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	
	int Maximum_amount=rs.getInt("Maximum_amount");
    	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"Maximum amount = "+Maximum_amount+"</td>");
	out.print("</tr>");
	
	
	out.print("</table>");
	out.print("<br/>");  
	out.print("<br/>");
	}
out.print("<center><a href='home.html'>HOME</a>");
 
}
catch(Exception e)
{
out.println(e+"<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>UNABLE TO FETCH!!</h1></center>");
}	%>

</body>
</html>