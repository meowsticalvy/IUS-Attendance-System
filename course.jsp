<html>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
		String a_courseid = request.getParameter("courseid");
		String a_coursetitle = request.getParameter("coursetitle");
		String a_programid = request.getParameter("programid");
		
		String a_BTNInsert = request.getParameter("insertB");
		String a_BTNSearch = request.getParameter("searchB");
		String a_BTNUpdate = request.getParameter("updateB");
		String a_BTNDelete = request.getParameter("deleteB");
		
		if (a_coursetitle=="") { a_coursetitle="x" ; }
		if (a_courseid=="") { a_courseid="x" ; }
		
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
				PreparedStatement a_ps=a_connection.prepareStatement("INSERT INTO ACourse032 values (?,?,?)");
				a_ps.setString(1,a_courseid);
				a_ps.setString(2,a_coursetitle);
				a_ps.setString(3,a_programid);
				a_ps.executeQuery();
				out.println("Data Inserted Successfully");
			}
			else if( (a_BTNSearch.equals("Search") && a_courseid.length()==1 && a_coursetitle.length()==1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ACourse032");
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
			else if( a_BTNSearch.equals("Search") && a_courseid.length()>1 && a_coursetitle.length()==1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ACourse032 WHERE code='"+a_courseid+"'");
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
			else if( a_BTNSearch.equals("Search") && a_coursetitle.length()>1 && a_courseid.length()==1 ) 
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ACourse032 WHERE title='"+a_coursetitle+"'");
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
			else if( a_BTNSearch.equals("Search") && a_coursetitle.length()>1 && a_courseid.length()>1 )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("SELECT * FROM ACourse032 WHERE code='" + a_courseid + "' AND title='" + a_coursetitle + "'");
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
			else if( a_BTNUpdate.equals("Update") && a_courseid.length()>1 && a_coursetitle.length()>1 )
			{
				PreparedStatement a_ps=a_connection.prepareStatement("UPDATE ACourse032 set title=?, program_id=? where code='" + a_courseid + "'");
				a_ps.setString(1,a_coursetitle);
				a_ps.setString(2,a_programid);
				a_ps.executeQuery();
				out.println("Data Updated Successfull Based on Your Course ID");
			}
			else if( (a_BTNDelete.equals("Delete") && a_courseid.length()>1) )
			{
				Statement a_st=a_connection.createStatement();
				ResultSet a_rs=a_st.executeQuery("DELETE FROM ACourse032 WHERE code='"+a_courseid+"'");
				out.println("Data Deleted Successfull Based on Your Course ID");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		<a href="course.html">Go Back</a>
	</body>
</html>