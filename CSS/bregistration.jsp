<!Doctype HTML>
<html>
	<title>Login Page</title>
	
	<body>
		<%@ page import="java.sql.*" %>
		<%
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		String fullname = request.getParameter("fullname");
		String studentid = request.getParameter("SID");
		String deptid = request.getParameter("DI");
		String v_signup = request.getParameter("signup");
		String cancel = request.getParameter("cancel");
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");
			if (v_signup.equals("Sign Up"))
			{
				PreparedStatement ps=conn.prepareStatement("INSERT INTO Registration values (?,?,?,?,?)");
				ps.setString(1,username);
				ps.setString(2,password);
				ps.setString(3,fullname);
				ps.setString(4,studentid);
				ps.setString(5,deptid);
				ps.executeQuery();
				out.print("Data Inserted Successfully");	
			}
		}
		catch(Exception e) 
		{
			out.print("Fill-up all the fields for Registration");
			out.print("<BR>");
			out.print(e);
		}
		
		%>
		
		
	</body>
	
</html>
