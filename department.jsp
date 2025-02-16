<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_deptid = request.getParameter("deptid");
		String a_deptname = request.getParameter("deptname");
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection a_connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alvi32");
			PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO ADepartment032 values (?,?)");
			
			a_ps.setString(1,a_deptid);
			a_ps.setString(2,a_deptname);
			a_ps.executeQuery();
			out.println("Data Inserted Successfully");
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="department.html">Insert Again</a>
	</body>
</html>