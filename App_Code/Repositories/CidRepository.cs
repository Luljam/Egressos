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

    public static CID GetCIDPorCodigo(string cid)
    {
        CID c = new CID();
        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {

            string sqlConsulta = "SELECT *  FROM [Egressos].[dbo].[cid_obito] WHERE cid_numero = '" + cid+ "'";

            SqlCommand cmm = cnn.CreateCommand();
            cmm.CommandText = sqlConsulta;
            try
            {
                cnn.Open();
                SqlDataReader dr1 = cmm.ExecuteReader();

                if(dr1.Read())
                {

                    c.Cid_Numero = dr1.GetString(0);
                    c.Descricao = dr1.GetString(1);
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }
        return c;
    }

    public static void GravaCidPaciente(int nr_seq, string clinica, string codProced)
    {
        string funcionario = "Junior";
        using (SqlConnection com = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {
            try
            {
                string strQuery = @"INSERT INTO [Egressos].[dbo].[mov_paciente_complementar]
                                    ([nr_seq],[clinica_alta],[cod_procedimento],[nome_funcionario_cadastrou])"
                                    + " VALUES (@nr_seq,@clinica_alta,@cod_procedimento,@nome_funcionario_cadastrou)";

                SqlCommand commd = new SqlCommand(strQuery, com);
                commd.Parameters.Add("@nr_seq", SqlDbType.Int).Value = nr_seq;
                commd.Parameters.Add("@clinica_alta", SqlDbType.VarChar).Value = clinica;
                commd.Parameters.Add("@cod_procedimento", SqlDbType.VarChar).Value = codProced;
                commd.Parameters.Add("@nome_funcionario_cadastrou", SqlDbType.VarChar).Value = funcionario;

                commd.CommandText = strQuery;
                com.Open();
                commd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string erro = ex.Message;

            }
        }
    }

    public static object CarregaCIDInternacao(int nr_seq)
    {
        var lista = new List<ProcedimentoInternacao>();

        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {

            string sqlConsulta = "SELECT *  FROM [Egressos].[dbo].[mov_paciente_complementar] WHERE nr_seq = "+ nr_seq ;
            SqlCommand cmm = cnn.CreateCommand();
            cmm.CommandText = sqlConsulta;
            try
            {
                cnn.Open();
                SqlDataReader dr1 = cmm.ExecuteReader();

                while (dr1.Read())
                {
                    ProcedimentoInternacao p = new ProcedimentoInternacao();

                    p.Id = dr1.GetInt32(0);
                    p.Nr_Seq = dr1.GetInt32(1);
                    p.Clinica = dr1.GetString(2);
                    p.Cod_Procedimento = dr1.GetString(3);
                    p.usuario = dr1.GetString(4);
                    lista.Add(p);
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
