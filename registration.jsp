<html>

<body>
<%@ page import="java.sql.*"%>

<%
String vuname=request.getParameter("user");
String vpassword=request.getParameter("pass");
String vfullname=request.getParameter("fullname");
String vdeptid=request.getParameter("DIP");
String vsignup=request.getParameter("login");

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "alvi32");
if(vsignup.equals("SingUp"))
{
 PreparedStatement ps = conn.prepareStatement("INSERT INTO registration VALUES (?, ?, ?, ?)"); 
ps.setString(1,vuname);
ps.setString(2,vpassword);
ps.setString(3,vfullname);
ps.setString(4,vdeptid);

ps.executeQuery();

out.println("Registration Completed");

out.print("<BR>");

   
}

} 
catch(Exception e)
{
out.println("Fill-up all fields for Registration");
out.println("<BR>");
out.print(e);
}  

%>
<a href="registration.html">Back</a>

</body>

</html>