package online_wallet;
import java.sql.*;
public class intialize {
	public static void main(String[] args) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_wallet","root","Gloria@2012");
		   System.out.print("connection established");
		   
	}
	catch(Exception e){
		System.out.print("You are NOT successfully registered...");
	}
	}

}
