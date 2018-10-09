using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using DAL;
using AcuvateEmployee.Model;
using Newtonsoft.Json;
using System.Web.Script.Services;

namespace AcuvateEmployee
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [System.Web.Script.Services.ScriptService]
    public class EmployeeService : System.Web.Services.WebService
    {

        //[WebMethod]
        //public string HelloWorld()
        //{
        //    return "Hello World";
        //}

       //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public bool DeleteEmployee(string id)
        {
            bool deleted = false;

            if (id != null && id != string.Empty)
            {
                deleted = Reposatory.DeleteEmployee(id);
            }

            return deleted;
        }

        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public string EmployeesList()
        {
            DataTable emplist = Reposatory.EmployeeList().Tables[0];
            List<Employee> emplst = new List<Employee>();
            for (int count = 0; count < emplist.Rows.Count; count++)
            {

                emplst.Add(new Employee()
                {
                    Id = emplist.Rows[count]["Id"].ToString(),
                    Name = emplist.Rows[count]["Name"].ToString(),
                    Age = Convert.ToInt32(emplist.Rows[count]["Age"]),
                    Address = emplist.Rows[count]["Address"].ToString()
                });
            }

            
            string data = JsonConvert.SerializeObject(emplst);

            //JsonArrayAttribute jsonArray = new JsonArrayAttribute();
            //return emplst;
            return data;
        }
    }
}
