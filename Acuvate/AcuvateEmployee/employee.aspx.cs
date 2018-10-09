using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using System.Web.Services;
using AcuvateEmployee.Model;
using Newtonsoft.Json;

namespace AcuvateEmployee
{
    public partial class employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable emplist = Reposatory.EmployeeList().Tables[0];
            Table empTable = new Table();
            empTable.ID = "EmployeeList";
            TableRow tr;
            empTable.CssClass = "table-striped";
            empTable.Width = new Unit("100%");
            //TableHeaderRow tableHeader = new TableHeaderRow();
            tr = new TableRow();
            tr.TableSection = TableRowSection.TableHeader;

            //TableHeaderCell id = new TableHeaderCell();
            //id.Text = "Id";
            //id.Width = new Unit("10%");
            //tr.Cells.Add(id);



            TableHeaderCell name = new TableHeaderCell();
            name.Text = "Name";
            name.Width = new Unit("30%");
            tr.Cells.Add(name);

            TableHeaderCell age = new TableHeaderCell();
            age.Text = "Age";
            age.Width = new Unit("20%");
            tr.Cells.Add(age);

            TableHeaderCell address = new TableHeaderCell();
            address.Text = "Address";
            address.Width = new Unit("40%");
            tr.Cells.Add(address);

            TableHeaderCell delete = new TableHeaderCell();
            delete.Text = "delete";
            delete.Width = new Unit("10%");
            tr.Cells.Add(delete);

            //tr.Controls.Add(name);
            //tr.Controls.Add(age);
            //tr.Controls.Add(address);
            //tr.Controls.Add(delete);



            empTable.Rows.Add(tr);



            
            //for(int i=0; i<emplist.Rows.Count;i++)
            //{
            //    tr = new TableRow();
            //    TableCell c1 = new TableCell();
            //    TableCell c2 = new TableCell();
            //    TableCell c3 = new TableCell();
            //    TableCell c4 = new TableCell();

                

            //    c1.Text = emplist.Rows[i]["Name"].ToString();
            //    c2.Text = emplist.Rows[i]["Age"].ToString();
            //    c3.Text = emplist.Rows[i]["Address"].ToString();
                


            //    HyperLink deleteLink = new HyperLink();
            //    deleteLink.Text = "Delete";
            //    deleteLink.Attributes.Add("onclick","onDeleteClicked("+ emplist.Rows[i]["Id"].ToString()+")");
            //    deleteLink.NavigateUrl = "#";
            //    deleteLink.ID = "Delete_" + emplist.Rows[i]["Id"];
            //    deleteLink.CssClass = "DeleteEmp";
            //    c4.Controls.Add(deleteLink);
                

            //    tr.Controls.Add(c1);
            //    tr.Controls.Add(c2);
            //    tr.Controls.Add(c3);
            //    tr.Controls.Add(c4);
            //    empTable.Controls.Add(tr);
            //}
            
            form1.Controls.Add(empTable);
        }

        //[WebMethod]
        //public static bool DeleteEmployee(string id)
        //{
        //    bool deleted = false;

        //    if(id != null && id != string.Empty)
        //    {
        //        deleted = Reposatory.DeleteEmployee(id);
        //    }

        //    return deleted;
        //}

        //[WebMethod]
        //public static string EmployeesList()
        //{            
        //    DataTable emplist = Reposatory.EmployeeList().Tables[0];
        //    List<Employee> emplst = new List<Employee>();
        //    for(int count =0;count<emplist.Rows.Count;count++)
        //    {

        //        emplst.Add(new Employee()
        //        {
        //            Id = emplist.Rows[count]["Id"].ToString(),
        //            Name = emplist.Rows[count]["Name"].ToString(),
        //            Age = Convert.ToInt32( emplist.Rows[count]["Age"]),
        //            Address = emplist.Rows[count]["Address"].ToString()
        //        });
        //    }

        //    string data = JsonConvert.SerializeObject(emplst);

        //    //return emplst;
        //    return data;
        //}
    }
}