<!Doctype HTML>
<html>
	<title>Login Page</title>
	
	<body>
		<%@ page import="java.sql.*" %>
		<%
		String ausername = request.getParameter("user");
		String apassword = request.getParameter("pass");
		String a_login = request.getParameter("login");
		String alvisession="";
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection a_connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alvi32");
			if (a_login.equals("Login") && ausername.length()>1)
			{
			Statement a_st=a_connection.createStatement();
			ResultSet alviset=a_st.executeQuery("SELECT * FROM ARegistration032 WHERE USERNAME='" + ausername + "' and password='" + apassword + "'");
				while(alviset.next()) 
				{
					if(alviset.getString(1).equals("admin")) 
					{
						alvisession="dashboard1.jsp";
						session.setAttribute("access",alvisession);
						response.sendRedirect("dashboard1.jsp");
					}
					else
					{
						alvisession="dashboard2.jsp";
						session.setAttribute("access",alvisession);
						response.sendRedirect("dashboard2.jsp");
					}
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
