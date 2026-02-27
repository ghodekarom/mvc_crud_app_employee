<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
</head>
<body>
    <form>
        <label>enter username:</label>
        <input type="text" name="usr"  pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$" title="Enter valid username e.g-omghodekar13@gmail.com"><br>
        <label>enter userpassword:</label>
        <input type="text" name="pwd"><br>
        <input type="submit" value="login" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$" title="Password must be at least 8 characters with uppercase, lowercase, number and special character"><br>
        Don't have an account <a href="auth?action=doRegister">register</a>
    </form>
</body>
</html>