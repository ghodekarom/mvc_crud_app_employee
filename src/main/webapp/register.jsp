<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
</head>
<body>
    <h3>REGISTER</h3>
    <form action="auth?action=register" method="post">
       <label>Enter Name:</label>
       <input type="text" name="name" pattern="^[A-Za-z ]{2,50}$" title="Name should contain only letters and spaces (2-50 characters)" required><br>
       <label>Enter username:</label>
       <input type="text" name="usr" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$" title="Enter a valid username e.g-omghodekar13@gmail.com" required><br>
       <label>Enter userpassword:</label>
       <input type="password" name="pwd" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="Password must be at least 8 characters with uppercase, lowercase, number and special character" required><br>
       <input type="submit" value="register"><br>
       Already have an account<a href="auth?action=doLogin">login</a>
    </form>
</body>
</html>