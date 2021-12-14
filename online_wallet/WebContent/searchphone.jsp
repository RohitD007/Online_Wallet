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
String ssn=request.getParameter("SSN");

PreparedStatement st=con.prepareStatement("select * from SEND_TRANSACTION where SSN=?");
st.setString(1,ssn);

ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	int Amount=rs.getInt("Amount");	
	String Cancel_Reason=rs.getString("Cancel_Reason");
	String Date_Time=rs.getString("Date_Time");
    String Identifier=rs.getString("Identifier");
    String Memo=rs.getString("Memo");
    String STid=rs.getString("STid");
    	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"Amount:"+Amount+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"Cancel_Reason:"+Cancel_Reason+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+" Date_Time:"+Date_Time+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"Identifier:"+Identifier+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"Memo:"+Memo+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"STid:"+STid+"</td>");
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