<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="AcuvateEmployee.employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>




    <style type="text/css">
        .auto-style1 {
            height: 300px;
        }
    </style>
    <script type="text/javascript">
        var empTable;

        $(document).ready(function () {
            refreshEmployeeList();
        });

        function onDeleteClicked(id) {
            var confirmation = confirm("Are you sure you wanna delete?");
            if (confirmation) {
                var dataString = { 'id': id };
                var param = JSON.stringify(dataString);

                $.ajax({
                    type: 'post',
                    data: param,
                    dataType: 'json',
                    url: 'EmployeeService.asmx/DeleteEmployee',
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        alert("Deleted Successfully!!!!!!!!!!!");
                        refreshEmployeeList();
                    },
                    error: function () {
                        alert("Unable to delete");
                    }
                });
            }
        }

        function refreshEmployeeList() {

            $.ajax({
                type: "post",
                dataType: 'json',
                url: "EmployeeService.asmx/EmployeesList",
                async: true,
                contentType: "application/json; charset=utf-8",
                success: function (dataa) {

                    var employees = JSON.parse(dataa.d);
                    if ($.fn.dataTable.isDataTable('#EmployeeList')) {

                        $('#EmployeeList').DataTable().destroy();
                        $('#EmployeeList').dataTable({
                            data: employees,
                            bdestroy: true,
                            columns: [
                                { data: 'Name' },
                                { data: 'Age' },
                                { data: 'Address' },
                                {
                                    data: 'Id',
                                    'render': function (id) {
                                        return '<a href=' + '#' + ' onclick=' + 'onDeleteClicked(' + id + ') >' + 'Delete' + '</a>';
                                    }
                                }
                            ]
                        });
                    }

                    else {

                        empTable = $('#EmployeeList').dataTable({
                            data: employees,
                            bdestroy: true,
                            columns: [
                                { data: 'Name' },
                                { data: 'Age' },
                                { data: 'Address' },
                                {
                                    data: 'Id',
                                    'render': function (id) {
                                        return '<a href=' + '#' + ' onclick=' + 'onDeleteClicked(' + id + ') >' + 'Delete' + '</a>';
                                    }
                                }
                            ]
                        });
                    }
                },
                error: function (error) {
                    alert("unable to load data");
                }
            });
        }

        //$('#AddEmployee').click(function()
        //{
        //    alert('called');
        //    $('#myModal').show();
        //    $('.modal-header #ModalHeader').text('Add Employee');
        //});

        //function callmodal() {
        //    alert('called');
        //    $('#myModal').show();
        //    $('.modal-header #ModalHeader').text('Add Employee');
        //}




    </script>

</head>
<body>
    <button type="button" class="btn btn-info" onclick="refreshEmployeeList()">Refresh</button>

    <button type="button" class="btn btn-info btn-lg" id="AddEmployee" onclick="callmodal()" data-toggle="modal" data-target="#myModal">Add Employee</button>

    <form id="form1" runat="server">
        <div class="auto-style1">
        </div>
    </form>



    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="ModalHeader"></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
                <div class="modal-body">
                    <div class="form-group">
                            
                        <input type="hidden" value="0" id="EmpId" />
                        <div class="input-group" style="margin-bottom: 5%;">
                            <label for="exampleInputAmount2" style="padding-top: 1.5%;">Name : </label>
                            <input type="text" style="margin-left: 2%;" class="form-control" id="EmpName" required="required" placeholder="Name" />
                        </div>

                        <div class="input-group" style="margin-bottom: 5%;">
                            <label for="exampleInputAmount2" style="padding-top: 1.5%;">Age : </label>
                            <input type="number" style="margin-left: 2%;" class="form-control" id="EmpAge" required="required" min="0" />
                        </div>

                        <div class="input-group" style="margin-bottom: 5%;">
                            <label for="exampleInputAmount2" style="padding-top: 1.5%;">Address : </label>
                            <textarea class="form-control" style="margin-left: 2%;" placeholder="Address" rows="5" required="required" id="EmpAddress"></textarea>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="SaveEmployee" data-dismiss="modal">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>
</body>

</html>
<script type="text/javascript">

    $('#AddEmployee').click(function () {
        alert('called1');
        $('#myModal').show();
        $('.modal-header #ModalHeader').text('Add Employee');
    });

    $('#SaveEmployee').click(function () {
        var id = document.getElementById("EmpId").value;
        
    });

</script>
