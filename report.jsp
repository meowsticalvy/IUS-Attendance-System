<!DOCTYPE html>
<html>
<head>
    <title>Attendance Report</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
<center>
    <h2>Attendance Report for Student ID: <%= request.getParameter("student_id") %></h2>
    
    <table border="1">
        <tr align="center">
            <th>Course Code</th>
            <th>Course Title</th>
            <th>Teacher Name</th>
            <th>Date of Attendance</th>
            <th>Semester</th>
            <th>Present</th>
        </tr>

        <%
            String studentId = request.getParameter("student_id");

            if (studentId != null && !studentId.isEmpty()) {
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection a_connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "alvi32");

                    String data = "SELECT AATTENDANCE032.CODE, ACourse032.TITLE, AATTENDANCE032.TEACHER_ID, " +
                                   "AATTENDANCE032.DATE_OF_ATTENDANCE, AATTENDANCE032.SEMESTER, AATTENDANCE032.PRESENT " +
                                   "FROM AATTENDANCE032 " +
                                   "JOIN ACourse032 ON AATTENDANCE032.CODE = ACourse032.CODE " +
                                   "WHERE AATTENDANCE032.STUDENT_ID = ?";

                    PreparedStatement alvi_statement = a_connection.prepareStatement(data);
                    alvi_statement.setInt(1, Integer.parseInt(studentId));  
                    
                    ResultSet rs = alvi_statement.executeQuery();

                    while (rs.next()) {
                        String courseCode = rs.getString("CODE");
                        String courseTitle = rs.getString("TITLE");
                        String teacherId = rs.getString("TEACHER_ID");
                        Date attendanceDate = rs.getDate("DATE_OF_ATTENDANCE");
                        String semester = rs.getString("SEMESTER");
                        int present = rs.getInt("PRESENT");
                        
                        String teacherString = "SELECT NAME FROM ATEACHER032 WHERE TEACHER_ID = ?";
                        PreparedStatement teacherStatement = a_connection.prepareStatement(teacherString);
                        teacherStatement.setString(1, teacherId);
                        ResultSet teacherSet = teacherStatement.executeQuery();
                        String teacherName = "";
                        if (teacherSet.next()) {
                            teacherName = teacherSet.getString("NAME");
                        }
                        
        %>
                        <tr align="center">
                            <td><%= courseCode %></td>
                            <td><%= courseTitle %></td>
                            <td><%= teacherName %></td>
                            <td><%= attendanceDate %></td>
                            <td><%= semester %></td>
                            <td><%= (present == 1 ? "Present" : "Absent") %></td>
                        </tr>
        <%
                    }

                } 
				catch (Exception e) 
				{
                    out.println(e);
                }
            } 
			else 
			{
                out.println("Please provide a valid Student ID.");
            }
        %>
    </table>
</center>
</body>
</html>
