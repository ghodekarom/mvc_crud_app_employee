<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Employee Management System</h2>
    <br><br>
    <form action="" method="post">
        <label>Enter Name:</label>
        <input type="text" name="name" required><br><br>

        <label>Enter Email:</label>
        <input type="text" name="email" required><br><br>

        <label>Enter Department:</label>
        <input type="text" name="department" required><br><br>

        <label>Enter Designation:</label>
        <input type="text" name="designation" required><br><br>

        <label>Enter Salary:</label>
        <input type="text" name="salary" required><br><br>
    </form>
    <input type="submit" value="Save">
    <a href="employee?action=cancel">Cancel</a>
</body>
</html>