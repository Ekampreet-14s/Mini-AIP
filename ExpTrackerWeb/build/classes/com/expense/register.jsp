<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #667eea, #764ba2);
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
    border-color: #667eea;
    box-shadow: 0 0 5px #667eea;
    outline: none;
}

button {
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
    color: white;
    cursor: pointer;
}

button:hover {
    opacity: 0.9;
}

.link {
    text-align: center;
    margin-top: 15px;
}

.error { color: red; text-align:center; }
</style>
</head>

<body>

<div class="container">

<h2>Register</h2>

<% if(request.getParameter("error")!=null){ %>
<div class="error">Please fill all fields!</div>
<% } %>

<form action="RegisterServlet" method="post">
<input type="text" name="username" placeholder="Enter Username" required>
<input type="password" name="password" placeholder="Enter Password" required>
<button type="submit">Register</button>
</form>

<div class="link">
Already have account? <a href="login.jsp">Login</a>
</div>

</div>

</body>
</html>
