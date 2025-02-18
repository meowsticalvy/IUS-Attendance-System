<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_teacherid = request.getParameter("teacherid");
		String a_teachername = request.getParameter("teachername");
		String a_deptid = request.getParameter("deptid");
		
		String a_BTNInsert = request.getParameter("insertB");
		String a_BTNSearch = request.getParameter("searchB");
		String a_BTNUpdate = request.getParameter("updateB");
		String a_BTNDelete = request.getParameter("deleteB");
		
		if (a_teachername=="") { a_teachername="x" ; }
		if (a_teacherid=="") { a_teacherid="x" ; }
		
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
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO ATeacher032 values (?,?,?)");
				a_ps.setString(1,a_teacherid);
				a_ps.setString(2,a_teachername);
				a_ps.setString(3,a_deptid);
				a_ps.executeQuery();
				out.println("Data Inserted Successfully");
			}
			else if( (a_BTNSearch.equals("Search") && a_teacherid.length()==1 && a_teachername.length()==1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ATeacher032");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_teacherid.length()>1 && a_teachername.length()==1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ATeacher032 WHERE teacher_id='"+a_teacherid+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_teachername.length()>1 && a_teacherid.length()==1 ) 
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ATeacher032 WHERE teacher_name='"+a_teachername+"'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print("<br>");
				}
			}			
			else if( a_BTNSearch.equals("Search") && a_teachername.length()>1 && a_teacherid.length()>1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ATeacher032 WHERE teacher_id='" + a_teacherid + "' AND teacher_name='" + a_teachername + "'");
				while(a_rs.next())
				{
					out.print(a_rs.getString(1));
					out.print(", ");
					out.print(a_rs.getString(2));
					out.print(", ");
					out.print(a_rs.getString(3));
					out.print("<br>");
				}
			}					
			else if( a_BTNUpdate.equals("Update") && a_teacherid.length()>1 && a_teachername.length()>1 && a_deptid.length()>1 )
			{
				PreparedStatement a_ps=a_connection.prepareStatement("UPDATE ATeacher032 set teacher_name=?, dept_id=? where teacher_id='" + a_teacherid + "'");
				a_ps.setString(1,a_teachername);
				a_ps.setString(2,a_deptid);
				a_ps.executeQuery();
				out.println("Data Updated Successfull Based on Your Program ID");
			}
			else if( (a_BTNDelete.equals("Delete") && a_teacherid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("DELETE FROM ATeacher032 WHERE teacher_id='"+a_teacherid+"'");
				out.println("Data Deleted Successfull Based on Your Teacher ID");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="teacher.html">Go Back</a>
	</body>
</html>