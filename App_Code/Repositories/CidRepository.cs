using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CidRepository
/// </summary>
public class CidRepository
{

    public static List<CID> GetAllCID()
    {
        var lista = new List<CID>();

        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {

            string sqlConsulta = "SELECT *  FROM [Egressos].[dbo].[cid_obito] ORDER BY cid_numero";
            SqlCommand cmm = cnn.CreateCommand();
            cmm.CommandText = sqlConsulta;
            try
            {
                cnn.Open();
                SqlDataReader dr1 = cmm.ExecuteReader();

                while (dr1.Read())
                {
                    CID c = new CID();

                    c.Cid_Numero = dr1.GetString(0);
                    c.Descricao = dr1.GetString(1);
                    lista.Add(c);
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }
        return lista;
    }
}
