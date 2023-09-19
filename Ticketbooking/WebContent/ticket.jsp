<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tag.tld" prefix="pstl" %>

<!DOCTYPE html>
<html>

<head>
    <title>Ticket Reservation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
       body {
            background-color: #f5f5f5;
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h1 {
            font-weight: bold;
            text-align: center;
            color: #003366;
            margin-bottom: 20px;
        }
        
     

/*        .container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            max-width: 800px; /* Adjust the width as needed */
         /*   width: 100%;
            box-sizing: border-box;
        }
*/
        select,
        input[type="date"],
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #003366;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #003366;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
        }

        /* Center the form elements */
        .form-group {
            text-align: center;
        }

        /* Style the passenger details header */
        .passenger-details {
            font-weight: bold;
            font-size: 20px;
            margin-top: 20px;
            color: #003366;
        }

        /* Style the submit button */
        .submit-button {
            text-align: center;
            margin-top: 20px;
        }

        /* Style the Train dropdown */
        #train, #from, #to {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        /* Style labels for form elements */
        label {
            font-weight: bold;
            color: #003366;
        }

        /* Style From and To station in one line */
        .station-container {
            display: flex;
            justify-content: space-between;
        }

        /* Style From and To station individually */
        .station-container select {
            flex: 1;
            margin-right: 10px;
        }
       
        
    </style>
</head>

<body>
<center>
    <h1>Ticket Reservation</h1>
    
    <div class="center-content">
        <div class="container">
        <div class="form-group">
            <label for="train">Select Train:</label>
            <select id="train" class="form-control">
                <pstl:ticket col="train_info" table="t_rain"/>
            </select>
        </div>
    <br><br>
    <div class="container">
        <div class="form-group station-container">
            <label for="from">From Station:</label>
            <select id="from" class="form-control">
                <pstl:ticket col="from_station" table="t_rain" />
            </select>
            <label for="to">To Station:</label>
            <select id="to" class="form-control">
                <pstl:ticket col="to_station" table="t_rain" />
            </select>
        </div>

        
        <div class="form-group">
            <label for="clas">Select Class:</label>
            <select id="clas" class="form-control">
                <option value="general">General</option>
                <option value="sleeper">Sleeper</option>
                <option value="1tier">1 Tier AC</option>
                <option value="2tier">2 Tier AC</option>
            </select>
        </div>

        <div class="form-group">
            <label for="date">Select Date:</label>
            <input type="date" id="date" class="form-control">
        </div>

        <h3 class="passenger-details">Passenger Details</h3>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" class="form-control">
        </div>

        <div class="form-group">
            <label for="gender">Gender:</label>
            <input type="text" id="gender" class="form-control">
        </div>

        <div class="form-group">
            <label for="age">Age:</label>
            <input type="text" id="age" class="form-control">
        </div>

        <div class="form-group">
            <button id="add" class="btn btn-primary" onclick="addRow(event)">Add Passenger</button>
        </div>
    </div>

    <table class="container" border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody id="container">
        </tbody>
    </table>

    <div class="container submit-button">
        <button class="btn btn-success" onclick="bok()">Submit</button>
    </div>
</div>
    <script>
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'StServlet?', true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var data = JSON.parse(xhr.responseText);
                console.log(data);

                meth(data);
            }
        }
        xhr.send();

        function bok() {
            var from = document.getElementById('from').value;
            var to = document.getElementById('to').value;
            var train = document.getElementById('train').value;
            var clas = document.getElementById('clas').value;
            var date = document.getElementById('date').value;
            var tdata = "from=" + from + "&to=" + to + "&train=" + train + "&clas=" + clas + "&date=" + date + pass;
            console.log(pass);
            var xh = new XMLHttpRequest();
            xh.open('GET', 'Booking?' + tdata, true);
            xh.onreadystatechange = function () {
                if (xh.readyState === 4) {
                    const data = xh.responseText;
                    document.body.innerHTML = data;
                    console.log(data);
                }
            }
            xh.send();
        }

        var pass = "";

        function addRow(event) {
            event.preventDefault();
            var tbody = document.getElementById('container');
            var trow = document.createElement('tr');
            var tdef1 = document.createElement('td');
            var tdef2 = document.createElement('td');
            var tdef3 = document.createElement('td');
            var tdef4 = document.createElement('td');

            var name = document.getElementById('name').value;
            var age = document.getElementById('age').value;
            var gender = document.getElementById('gender').value;

            tdef1.textContent = name;
            tdef3.textContent = age;
            tdef2.textContent = gender;

            var button = document.createElement("button");
            button.textContent = "Remove";
            button.addEventListener('click', function () {
                const row = this.parentNode.parentNode;
                row.innerHTML = "";
            })
            tdef4.appendChild(button);
            trow.appendChild(tdef1);
            trow.appendChild(tdef2);
            trow.appendChild(tdef3);
            trow.appendChild(tdef4);

            tbody.appendChild(trow);

            pass += "&name=" + name + "&gender=" + gender + "&age=" + age;
            console.log(pass);
        }
    </script>
    </center>
</body>

</html>
