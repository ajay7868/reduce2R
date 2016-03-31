package p1;

import java.sql.Connection;
import java.sql.DriverManager;

public class connect {
	private static Connection con;
	public static Connection getCon(){
		
		try 
		{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB","dash6337","MweOghB01l4z");
		
		} 
		
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
		
		
		return con;
}
}