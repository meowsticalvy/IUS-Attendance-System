<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_studentid = request.getParameter("studentid");
		String a_courseid = request.getParameter("courseid");
		String a_teacherid = request.getParameter("teacherid");
		String a_doa = request.getParameter("doa");
		String a_semester = request.getParameter("semester");
		String a_present = request.getParameter("present");
		
		String a_BTNInsert = request.getParameter("insertB");
		String a_BTNSearch = request.getParameter("searchB");
		String a_BTNUpdate = request.getParameter("updateB");
		String a_BTNDelete = request.getParameter("deleteB");
		
		if (a_studentid=="") { a_studentid = "x"; }
		if (a_courseid=="") { a_courseid = "x"; }
		if (a_teacherid=="") { a_teacherid = "x"; }
		if (a_doa=="") { a_doa = "x"; }
		if (a_semester=="") { a_semester = "x"; }
		if (a_present=="") { a_present = "x"; }
		
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
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO AAttendance032 values (?,?,?,?,?,?)");
				a_ps.setString(1,a_studentid);
				a_ps.setString(2,a_courseid);
				a_ps.setString(3,a_teacherid);
				a_ps.setString(4,a_doa);
				a_ps.setString(5,a_semester);
				a_ps.setString(6,a_present);
				a_ps.executeQuery();
				out.println("Data Inserted Successfully");
			}
			else if( a_BTNSearch.equals("Search") && a_studentid.length()==1 && a_courseid.length()==1 && a_teacherid.length()==1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AAttendance032");
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
					out.print(", ");
					out.print(a_rs.getString(6));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_studentid.length()>1 && a_courseid.length()==1 && a_teacherid.length()==1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AAttendance032 WHERE student_id='"+a_studentid+"'");
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
					out.print(", ");
					out.print(a_rs.getString(6));
					out.print("<br>");
				}
			}
			else if( a_BTNSearch.equals("Search") && a_studentid.length()==1 && a_courseid.length()>1 && a_teacherid.length()==1 ) 
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AAttendance032 WHERE code='"+a_courseid+"'");
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
					out.print(", ");
					out.print(a_rs.getString(6));
					out.print("<br>");
				}
			}			
			else if( a_BTNSearch.equals("Search") && a_studentid.length()==1 && a_courseid.length()==1 && a_teacherid.length()>1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM AAttendance032 WHERE teacher_id='"+a_teacherid+"'");
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
					out.print(", ");
					out.print(a_rs.getString(6));
					out.print("<br>");
				}
			}					
			else if( a_BTNUpdate.equals("Update") && a_studentid.length()>1)
			{
				PreparedStatement a_ps=a_connection.prepareStatement("UPDATE AAttendance032 set present=? where student_id='" + a_studentid + "'" + "AND code='" + a_courseid + "'" + "AND teacher_id='" + a_teacherid + "'" + "AND date_of_attendance='" + a_doa + "'" + "AND semester='" + a_semester + "'");
				a_ps.setString(1,a_present);
				a_ps.executeQuery();
				out.println("Your Attendance Has Been Succesfully Recorded Based on Your Student ID");
			}
			else if( (a_BTNDelete.equals("Delete") && a_studentid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("DELETE FROM AAttendance032 WHERE student_id='"+a_studentid+"'");
				out.println("Data Deleted Successfull Based on Your Student ID");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="attendance.html">Go Back</a>
	</body>
</html>