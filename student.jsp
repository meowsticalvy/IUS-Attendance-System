<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_studentid = request.getParameter("studentid");
		String a_dob = request.getParameter("dob");
		String a_studentname = request.getParameter("studentname");
		String a_programid = request.getParameter("programid");
		String a_cellno = request.getParameter("cellno");
		
		String a_BTNInsert = request.getParameter("insertB");
		String a_BTNSearch = request.getParameter("searchB");
		String a_BTNUpdate = request.getParameter("updateB");
		String a_BTNDelete = request.getParameter("deleteB");
		
		if (a_studentid=="") { a_studentid="x" ; }
		if (a_dob=="") { a_dob="x" ; }
		if (a_studentname=="") { a_studentname="x" ; }
		if (a_programid=="") { a_programid="x" ; }
		if (a_cellno=="") { a_cellno="x" ; }
		
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
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO AStudent_Data032 values (?,?,?,?,?)");
				a_ps.setString(1,a_studentid);
				a_ps.setString(2,a_studentname);
				a_ps.setString(3,a_programid);
				a_ps.setString(4,a_dob);
				a_ps.setString(5,a_cellno);
				a_ps.executeQuery();
				out.println("Data Inserted Successfully");
			}
			else if( (a_BTNSearch.equals("Search") && a_studentid.length()==1 && a_studentname.length()==1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AStudent_Data032");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print(", ");
					out.print(a_rs.getString(4));
					out.print(", ");
					out.print(a_rs.getString(5));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_studentid.length()>1 && a_studentname.length()==1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AStudent_Data032 WHERE student_id='"+a_studentid+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print(", ");
					out.print(a_rs.getString(4));
					out.print(", ");
					out.print(a_rs.getString(5));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_studentname.length()>1 && a_studentid.length()==1 ) 
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AStudent_Data032 WHERE name='"+a_studentname+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print(", ");
					out.print(a_rs.getString(4));
					out.print(", ");
					out.print(a_rs.getString(5));
					out.print("<br>");
				}
			}			
			else if( a_BTNSearch.equals("Search") && a_studentname.length()>1 && a_studentid.length()>1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AStudent_Data032 WHERE code='"+a_studentid+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print(", ");
					out.print(a_rs.getString(4));
					out.print(", ");
					out.print(a_rs.getString(5));
					out.print("<br>");
				}
			}					
			else if( a_BTNUpdate.equals("Update") && a_studentid.length()>1 && a_studentname.length()>1 )
			{
				PreparedStatement a_ps=a_connection.prepareStatement("UPDATE AStudent_Data032 set date_of_birth=?, name=?, program_id=?, cell_no=? where student_id='" + a_studentid + "'");
				a_ps.setString(1,a_dob);
				a_ps.setString(2,a_studentname);
				a_ps.setString(3,a_programid);
				a_ps.setString(4,a_cellno);
				a_ps.executeQuery();
				out.println("Data Updated Successfull Based on Your Student ID");
			}
			else if( (a_BTNDelete.equals("Delete") && a_studentid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("DELETE FROM AStudent_Data032 WHERE student_id='"+a_studentid+"'");
				out.println("Data Deleted Successfull Based on Your Student ID");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="student.html">Go Back</a>
	</body>
</html>