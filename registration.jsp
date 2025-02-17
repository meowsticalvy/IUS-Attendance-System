<!Doctype HTML>
<html>
	<body>
		<%@ page import="java.sql.*" %>
		<%
		String ausername = request.getParameter("user");
		String apassword = request.getParameter("pass");
		String afullname = request.getParameter("fullname");
		String adeptid = request.getParameter("deptid");
		String a_signup = request.getParameter("signup");
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection a_connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alvi32");
			if (a_signup.equals("Sign Up"))
			{
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO ARegistration032 values (?,?,?,?)");
				a_ps.setString(1,ausername);
				a_ps.setString(2,apassword);
				a_ps.setString(3,afullname);
				a_ps.setString(4,adeptid);
				a_ps.executeQuery();
				out.print("Your Account Has Been Succesfully Created");	
			}
		}
		catch(Exception e) 
		{
			out.print("Fill-up all the fields for Registration");
			out.print("<BR>");
			out.print(e);
		}
		
		%>
		
		<br><a href="login.html">Login Now?</a>
	</body>
	
</html>
