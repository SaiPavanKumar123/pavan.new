<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="com.ticket.Ticket,com.ticket.Passenger,com.ticket.JDBC,com.ticket.StServlet"%>
<%@ page import="java.util.*,java.io.IOException,java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<center>
	<h1>Your Ticket Booking is Successfull</h1>
		<h3>Ticket Details</h3>
		<%
		//Ticket at = (Ticket) request.getAttribute("book");
		%>
		<label><b>From :</b><%=at.getFrom()%></label>
		&nbsp&nbsp&nbsp&nbsp&nbsp
		<label><b>To :</b><%=at.getTo()%></label>
		<br></br>
		<label><b>Train:</b><%=at.getTrain()%></label>
		<br></br>
		<label><b>Class:</b><%=at.getClas()%></label>
		<br></br>
		<label><b>Date :</b><%=at.getDate()%></label>
		<br></br>
		<table>
		<tr>
		<th style="width:250px">NAME</th>
		<th style="width:150px">GENDER</th>
		<th style="width:100px">AGE</th>
		</tr>
		<%
		ArrayList<Passenger> ap=at.getPassengers();
		String[] age=new String[10];
		int i=0;
		for(Passenger p:ap){
			age[i]=p.getAge();
			i++;
		
		%><tr>
		<td><%=p.getName()%></td>
		<td><%=p.getGender()%></td>
		<td><%=p.getAge()%></td>
				</tr>
				<%
		}
				%>
		</table>
		
</center>
</body>
</html>