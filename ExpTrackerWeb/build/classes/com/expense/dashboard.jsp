<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI';
    background: linear-gradient(135deg, #667eea, #764ba2);
}

.navbar {
    padding: 20px;
    text-align: center;
    color: white;
    font-size: 24px;
}

.container {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-top: 100px;
}

.card {
    width: 250px;
    padding: 40px;
    background: white;
    border-radius: 15px;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}

.card:hover {
    transform: translateY(-10px);
}

a { text-decoration:none; color:black; }
</style>
</head>

<body>

<div class="navbar">Smart Expense Tracker</div>

<div class="container">

<a href="addExpense.jsp"><div class="card">Add Expense</div></a>

<a href="ViewExpensesServlet"><div class="card">View Expenses</div></a>

<a href="LogoutServlet"><div class="card">Logout</div></a>

</div>

</body>
</html>
