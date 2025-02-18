<html>
<body>
	<center>
		<%
			String alvipageaccess=(String)session.getAttribute("access");
			if(alvipageaccess!="dashboard2.jsp")
			{
				response.sendRedirect("login.html");
			}
			else
			{
				out.print("Welcome");
			}
		%>
		<h1> Student Panel </h1>
		
		<table>
		
			<tr>
				<td>
					<b><a href="attendance.html">Daily Attendance Entry </b></a>
				</td>
			</tr>			
			
			<tr>
				<td>
					<b><a href="report.html">Attendance Report</b></a>
				</td>
			</tr>
			
			<tr>
				<td>
					<br>
					<b><a href="login.html">Back to Login Page</b></a>
				</td>
			</tr>
			
		</table>
		
	</center>
</body>
</html>