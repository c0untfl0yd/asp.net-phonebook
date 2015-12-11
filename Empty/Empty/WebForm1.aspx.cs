using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlServerCe;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Empty
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public ArrayList list = new ArrayList();

        public string getData() {

            list.Clear();
            SqlCeConnection conn = null;
            conn = new SqlCeConnection("Data Source = C:/Documents and Settings/Keca/my documents/visual studio 2010/Projects/Empty/Empty/App_Data/Database1.sdf; Password =''");
            string query = "SELECT ID, NAME, PHONE FROM People";
            SqlCeCommand cmd = new SqlCeCommand(query, conn);

            try
            {
                conn.Open();
                SqlCeDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    int val1 = rdr.GetInt32(0);
                    string val2 = rdr.GetString(1);
                    int val3 = rdr.GetInt32(2);
                    list.Add("{ \"id\": " + val1 + ", \"name\": " + "\"" + val2 + "\"," + "\"phone\": " + val3 + " }");
                }
                rdr.Close();   
            }
            catch (Exception)
            {
                Response.Write("<script>alert(\"A problem occurred reading the Data. Please check back in a while.\");</script>");
            }
            finally
            {
                conn.Close();
            }
            
            string jsonstring = "";
            
            for (int i = 0; i < list.Count;i++ ) {
                if (i != list.Count - 1) { jsonstring += list[i] + " , "; }
                else { jsonstring += list[i]; }
            }

            return jsonstring;
        }
		
		public string getData2() {
            string htmlstring = "";
            SqlCeConnection conn = null;
            conn = new SqlCeConnection("Data Source = C:/Documents and Settings/Keca/my documents/visual studio 2010/Projects/Empty/Empty/App_Data/Database1.sdf; Password =''");
            string query = "SELECT ID, NAME, PHONE FROM People";
            SqlCeCommand cmd = new SqlCeCommand(query, conn);

            try
            {
                conn.Open();
                SqlCeDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    int val1 = rdr.GetInt32(0);
                    string val2 = rdr.GetString(1);
                    int val3 = rdr.GetInt32(2);
                    htmlstring += "<tr><td style=\"width:50px;\">" + "" + val1 + "</td><td>" + val2 + "</td><td style=\"width:150px;\">" + val3 + "</td></tr>";
                    }
                rdr.Close();   
            }
            catch (Exception)
            {
                Response.Write("<script>alert(\"A problem occurred reading the Data. Please check back in a while.\");</script>");
            }
            finally
            {
                conn.Close();
            }
            
            return htmlstring;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
			if(TextBox1.Text!=""&&TextBox2.Text!=""){
			SqlCeConnection conn = null;
            conn = new SqlCeConnection("Data Source = C:/Documents and Settings/Keca/my documents/visual studio 2010/Projects/Empty/Empty/App_Data/Database1.sdf; Password =''");

            SqlCeCommand cmd = new SqlCeCommand("INSERT INTO People(NAME, PHONE) VALUES (@NAME, @PHONE)", conn);
                
                cmd.Parameters.AddWithValue("@NAME", TextBox1.Text);
                cmd.Parameters.AddWithValue("@PHONE", TextBox2.Text);

                conn.Open();

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert(\"A problem occurred submitting the Data. Contact names are Unique.\");</script>");
                }
                finally
                {
                    conn.Close();
                }
                
            if (IsPostBack) { 
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                }	
			}
            

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
			if(TextBox_del.Text!="") {
			SqlCeConnection conn = null;
            conn = new SqlCeConnection("Data Source = C:/Documents and Settings/Keca/my documents/visual studio 2010/Projects/Empty/Empty/App_Data/Database1.sdf; Password =''");
            
            SqlCeCommand cmd = new SqlCeCommand("DELETE FROM People WHERE ID=@ID", conn);

            cmd.Parameters.AddWithValue("@ID", TextBox_del.Text);

            conn.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                Response.Write("<script>alert(\"A problem occurred during deletion.\");</script>");
            }
            finally
            {
                conn.Close();
            }
            
            if (IsPostBack)
            {
                TextBox_del.Text = "";

            }
			
			}
            

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
			if(ID_TO_EDIT_TXT.Text!=""&&TextBox_NEWNAME.Text!=""&&TextBox_NEWPHONE.Text!="") {
			SqlCeConnection conn = null;
            conn = new SqlCeConnection("Data Source = C:/Documents and Settings/Keca/my documents/visual studio 2010/Projects/Empty/Empty/App_Data/Database1.sdf; Password =''");

            SqlCeCommand cmd = new SqlCeCommand("UPDATE People SET NAME=@NEWNAME, PHONE=@NEWPHONE WHERE ID=@ID", conn);

            cmd.Parameters.AddWithValue("@ID", ID_TO_EDIT_TXT.Text);
            cmd.Parameters.AddWithValue("@NEWNAME", TextBox_NEWNAME.Text);
            cmd.Parameters.AddWithValue("@NEWPHONE", TextBox_NEWPHONE.Text);
            conn.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                Response.Write("<script>alert(\"A problem occurred submitting the Data. Contact names are Unique.\");</script>");
            }
            finally
            {
                conn.Close();
            }
            
            if (IsPostBack)
            {
                TextBox_NEWNAME.Text = "";
                TextBox_NEWPHONE.Text = "";
                ID_TO_EDIT_TXT.Text = "";
            }
			
			}
            
        }


            
        
        
        
    }
}