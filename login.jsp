<!Doctype HTML>
<html>
	<title>Login Page</title>
	
	<body>
		<%@ page import="java.sql.*" %>
		<%
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		String v_login = request.getParameter("login");
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alvi32");
			if (v_login.equals("Login"))
			{
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM Registration WHERE USER_NAME='" + username + "' and password='" + password + "'");
				while(rs.next()) {
					response.sendRedirect("dashboard.html");
				}
			}
		}
		catch(Exception e) 
		{
			out.print("Fill-up all the fields for Login");
			out.print("<BR>");
			out.print(e);
		}
		
		%>
		
		
	</body>
	
</html>
