<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Report</title>
</head>
<body>
    <h2>Attendance Report for Student ID: <%= request.getParameter("student_id") %></h2>
    
    <table border="1">
        <tr>
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

                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "alvi32");

                    String query = "SELECT CODE, TITLE, TEACHER_ID, DATE_OF_ATTENDANCE, SEMESTER, PRESENT " +
                                   "FROM AATTENDANCE032 WHERE STUDENT_ID = ?";
                    
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setInt(1, Integer.parseInt(studentId));  
                    
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        String courseCode = rs.getString("CODE");
                        String courseTitle = rs.getString("TITLE");
                        String teacherId = rs.getString("TEACHER_ID");
                        Date attendanceDate = rs.getDate("DATE_OF_ATTENDANCE");
                        String semester = rs.getString("SEMESTER");
                        int present = rs.getInt("PRESENT");
                        
                        String teacherNameQuery = "SELECT NAME FROM ATEACHER032 WHERE TEACHER_ID = ?";
                        PreparedStatement teacherStmt = conn.prepareStatement(teacherNameQuery);
                        teacherStmt.setString(1, teacherId);
                        ResultSet teacherRs = teacherStmt.executeQuery();
                        String teacherName = "";
                        if (teacherRs.next()) {
                            teacherName = teacherRs.getString("NAME");
                        }
                        
        %>
                        <tr>
                            <td><%= courseCode %></td>
                            <td><%= courseTitle %></td>
                            <td><%= teacherName %></td>
                            <td><%= attendanceDate %></td>
                            <td><%= semester %></td>
                            <td><%= (present == 1 ? "Present" : "Absent") %></td>
                        </tr>
        <%
                    }

                    conn.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                out.println("Please provide a valid Student ID.");
            }
        %>
    </table>
</body>
</html>
