<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="AcuvateEmployee.employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 300px;
        }
        </style>
    <script type="text/javascript">
        
        function onDeleteClicked(id)
        {  
            var confirmation = confirm("Are you sure you wanna delete?");
            if (confirmation)
            {
                var dataString = { 'id': id };
                var param = JSON.stringify(dataString);

                $.ajax({
                    type: "post",
                    data: param,
                    dataType: 'json',
                    url: "employee.aspx/DeleteEmployee",
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        alert("success");
                       // $('.text').text(JSON.stringify(data));
                    }
                });
            }
            else
            {
                alert("asdfsdfsd");
            }
        }

        function refreshEmployeeList()
        {
            $.ajax({
                    type: "post",
                    dataType: 'json',
                    url: "employee.aspx",
                    async: true,
                    contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log()
                        alert("success");

                       // $('.text').text(JSON.stringify(data));
                    }
                });
        }
       
    </script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
           
          
        </div>
    </form>
</body>
</html>