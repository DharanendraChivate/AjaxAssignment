using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{

    public class Reposatory
    {
        public  static string Constr = "Data Source =.; Initial Catalog = AcuvateDB; Integrated Security = True";

        public static DataSet EmployeeList()
        {
            DataSet ds = new DataSet();

            try
            {
                using (SqlConnection con = new SqlConnection(Constr))
                {
                    con.Open();
                    string query = "select * from Employee";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(ds);
                    }
                }

            }
            catch (Exception e)
            {
                Console.WriteLine("Exception :" + e);
            }

            return ds;
        }

        public static bool DeleteEmployee(string id)
        {
            bool deleted = false;
            try
            {
                if (id != null && id != string.Empty)
                {
                    using (SqlConnection con = new SqlConnection(Constr))
                    {
                        con.Open();
                        string query = "DELETE FROM Employee WHERE Id=" + id;
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }

                }
                deleted = true;
            }
            catch(Exception e)
            {
                Console.WriteLine("Exception :"+e);
            }

            return deleted;
        }

    }
}
