<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
}

.container {
    width: 450px;
    padding: 35px;
    background: rgba(255,255,255,0.95);
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

h2 {
    text-align: center;
    margin-bottom: 25px;
}

input, button {
    width: 100%;
    padding: 14px;
    margin: 12px 0;
    border-radius: 8px;
    font-size: 15px;
    box-sizing: border-box;
}

input {
    border: 1px solid #ccc;
}

input:focus {
    border-color: #4facfe;
    box-shadow: 0 0 5px #4facfe;
    outline: none;
}

button {
    background: linear-gradient(135deg, #4facfe, #00c6ff);
    border: none;
    color: white;
    cursor: pointer;
}

button:hover {
    opacity: 0.9;
}

.back {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    font-weight: bold;
    color: #333;
}
</style>
</head>

<body>

<div class="container">

<h2>Add Expense</h2>

<form action="AddExpenseServlet" method="post">

<input type="number" step="0.01" name="amount" placeholder="Enter Amount" required>

<input type="text" name="category" placeholder="Category (Food, Travel...)" required>

<input type="date" name="date" required>

<input type="text" name="description" placeholder="Description">

<button type="submit">Add Expense</button>

</form>

<a class="back" href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>
