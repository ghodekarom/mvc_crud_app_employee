<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mvc_crud_app</title>
</head>
<body>
    <h3>Employee Management System</h3>

    <a href="employee?action=add">add</a>
    <table border=1>
        <thead>
            <tr>
                <td>ID</td>
                <td>NAME</td>
                <td>EMAIL</td>
                <td>DEPARTMENT</td>
                <td>DESINGATION</td>
                <td>SALARY</td>
                <td>ACTION</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Om Ghodekar</td>
                <td>om@gmail.com</td>
                <td>it</td>
                <td>fullstack developer</td>
                <td>28000</td>
                <td>
                    <a href="employee?action=edit">update</a>
                    <a href="employee?action=delete">delete</a>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>