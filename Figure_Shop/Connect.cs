using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Figure_Shop
{
    public class Connect
    {
        public string connectString = @"Data Source=MSI\SQLEXPRESS;Initial Catalog=Figure_Db;Integrated Security=True";
        //public string connectString = @"Data Source=.\SQLExpress;Initial Catalog=Figure_Db;Integrated Security=True";
        SqlConnection connect;
        SqlCommand command;
        SqlDataAdapter adapter;
        SqlDataReader reader;

        public Connect()
        {
            connect = new SqlConnection(connectString);
        }

        public DataTable getData(string sql)
        {
            try
            {
                connect.Open();

                DataTable result = new DataTable();
                adapter = new SqlDataAdapter(sql, connect);
                adapter.Fill(result);

                return result;
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                connect.Close();
            }
        }

        public int excuteQuery(string sql)
        {
            try
            {
                connect.Open();

                DataTable result = new DataTable();
                command = new SqlCommand(sql, connect);

                return command.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                connect.Close();
            }
        }

        public string getField(string sql)
        {
            try
            {
                connect.Open();

                string result = "";
                command = new SqlCommand(sql, connect);
                reader = command.ExecuteReader();

                while (reader.Read())
                {
                    result = reader[0].ToString();
                }

                return result;
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                connect.Close();
            }
        }

        public string[] getFields(string sql)
        {
            try
            {
                connect.Open();

                command = new SqlCommand(sql, connect);
                reader = command.ExecuteReader();
                string[] result = new string[reader.FieldCount + 1];
                int i = 0;

                while (reader.Read())
                {
                    result[i] = reader[0].ToString();
                    i++;
                }

                return result;
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                connect.Close();
            }
        }
    }
}