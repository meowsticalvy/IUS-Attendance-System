<html>
<body>
	<center>
		<%
			String alvipageaccess=(String)session.getAttribute("access");
			if(alvipageaccess!="dashboard1")
			{
				response.sendRedirect("login.html");
			}
			else
			{
				out.print("Welcome");
			}
		%>
		
		<h1> Admin Panel </h1>
		
		<table>
		
			<tr>
				<td>
					<b><a href="department.html">Department Information</b></a>
				</td>
			</tr>
			
			<tr>
				<td>
					<b><a href="program.html">Program Information</b></a>
				</td>
			</tr>

			<tr>
				<td>
					<b><a href="course.html">Course Information</b></a>
				</td>
			</tr>
			
			<tr>
				<td>
					<b><a href="teacher.html">Teacher Information</b></a>
				</td>
			</tr>			
			
			<tr>
				<td>
					<b><a href="student.html">Student Information</b></a>
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