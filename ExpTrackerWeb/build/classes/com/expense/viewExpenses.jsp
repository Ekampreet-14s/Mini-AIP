<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expenses</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
}

.navbar {
    background: #2c3e50;
    color: white;
    padding: 18px;
    text-align: center;
    font-size: 22px;
    font-weight: bold;
}

.container {
    width: 90%;
    max-width: 1000px;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 8px 25px rgba(0,0,0,0.3);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #667eea;
    color: white;
    padding: 12px;
    font-size: 15px;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #e6e6ff;
}

.total {
    text-align: right;
    font-size: 18px;
    margin-top: 15px;
    font-weight: bold;
}

.back {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
    font-size: 16px;
    color: #667eea;
    font-weight: bold;
}
</style>

</head>
<body>

<div class="navbar">
    Your Expenses
</div>

<div class="container">

<h2>Expense List</h2>

<table>
<tr>
    <th>ID</th>
    <th>Amount (₹)</th>
    <th>Category</th>
    <th>Date</th>
    <th>Description</th>
</tr>

<%
ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("expenses");

if(list != null && !list.isEmpty()){
    for(String[] row : list){
%>
<tr>
    <td><%= row[0] %></td>
    <td>₹ <%= row[1] %></td>
    <td><%= row[2] %></td>
    <td><%= row[3] %></td>
    <td><%= row[4] %></td>
</tr>
<%
    }
} else {
%>
<tr>
    <td colspan="5">No expenses found</td>
</tr>
<%
}
%>

</table>

<div class="total">
    Total Expense: ₹ 
    <%= (request.getAttribute("total") != null) ? request.getAttribute("total") : "0" %>
</div>

<a class="back" href="dashboard.jsp">← Back to Dashboard</a>

</div>

</body>
</html>
