<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_deptid = request.getParameter("deptid");
		String a_deptname = request.getParameter("deptname");
		
		String a_BTNInsert = request.getParameter("insertB");
		String a_BTNSearch = request.getParameter("searchB");
		String a_BTNUpdate = request.getParameter("updateB");
		String a_BTNDelete = request.getParameter("deleteB");
		
		// 
		if (a_deptid=="") { a_deptid="x" ; }
		if (a_deptname=="") { a_deptname="x" ; }
		
		if (a_BTNInsert==null) { a_BTNInsert="x" ; }
		if (a_BTNSearch==null) { a_BTNSearch="x" ; }
		if (a_BTNUpdate==null) { a_BTNUpdate="x" ; }
		if (a_BTNDelete==null) { a_BTNDelete="x" ; }
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection a_connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alvi32");
			
			if (a_BTNInsert.equals("Insert")) 
			{
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO ADepartment032 values (?,?)");
				a_ps.setString(1,a_deptid);
				a_ps.setString(2,a_deptname);
				a_ps.executeQuery();
				out.println("Data Inserted Successfully");
			}
			else if( (a_BTNSearch.equals("Search") && a_deptid.length()==1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ADepartment032");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print("<br>");
				}
			}
			else if( (a_BTNSearch.equals("Search") && a_deptid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ADepartment032 WHERE dept_id='"+a_deptid+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print("<br>");
				}
			}
			
			else if( (a_BTNUpdate.equals("Update") && a_deptid.length()>1) && (a_deptname.length()>1) )
			{
				PreparedStatement a_ps=a_connection.prepareStatement("UPDATE ADepartment032 set dept_name=? where dept_id='" + a_deptid+ "'");
				a_ps.setString(1,a_deptname);
				a_ps.executeQuery();
				out.println("Data Updated Successfull Based on Your Department ID");
			}
			else if( (a_BTNDelete.equals("Delete") && a_deptid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("DELETE FROM ADepartment032 WHERE dept_id='"+a_deptid+"'");
				out.println("Data Deleted Successfull Based on Your Department ID");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="department.html">Visit Again?</a>
	</body>
</html>