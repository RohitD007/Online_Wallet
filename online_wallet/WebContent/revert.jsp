<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send</title>
<style type="text/css">
body{background-image:url(onlineWallet.jpg);
	font-size:25px;
	font-family:courier;
	background-size:cover;
	background-repeat:no-repeat;}</style>
</head>
<body>

<%
try{
   String email = request.getParameter("email_id");
   //String phone = request.getParameter("phone");
   String amount = request.getParameter("amount");
   String memo = request.getParameter("memo");
   String from = request.getParameter("from");
   String SSN ="";
   String Cancel ="Cancelled";
   ResultSet rs = null;
  
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");
   
   PreparedStatement ps=con.prepareStatement("select SSN from EMAIL where email_id=?" );
   ps.setString(1,email);
   rs = ps.executeQuery();
   if(rs.next()) { 
   	SSN = rs.getString("SSN");
   }
         
   PreparedStatement ps2=con.prepareStatement("Insert into SEND_TRANSACTION (Amount,Cancel_Reason,Date_Time,Identifier,Memo,SSN)values (?,?,?,?,?,?)");
   ps2.setString(1,amount);
   ps2.setString(2,Cancel);
   ps2.setDate(3,java.sql.Date.valueOf(java.time.LocalDate.now()));
   ps2.setString(4,email);
   ps2.setString(5,memo);
   ps2.setString(6,SSN);

   
  int j=ps2.executeUpdate();

  if(j>0 )
  {
 out.print("SENT successfully"); 
 out.print("<center><a href='Account_info.html'>ACCOUNT INFO</a>");

 
  }
  else
	  out.print("Sending Failed"); 
  	  out.print("<center><a href='Send.html'>BACK</a>");
}
catch(Exception e){out.print("YSending Failed"+e);
out.print("<center><a href='Send.html'>BACK</a>");}
%>   
</body>
</html>
