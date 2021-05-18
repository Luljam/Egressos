using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class CadastrarAltaPaciente_CadastraAlta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnPesquisa_Click(object sender, EventArgs e)
    {
        //  string numeroInt = txtSeqPaciente.Text;

        using (SqlConnection com = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
            try
            {
                int Nr_seq = Convert.ToInt32(txtSeqPaciente.Text);
                string strQuery = "";

                SqlCommand commd = new SqlCommand(strQuery, com);

                strQuery = @"SELECT [nr_seq]                                   
                                   ,[nome]
                                   ,[sexo]
                                   ,[dt_internacao]
                                   ,[dt_saida_paciente]
                                   ,[sg_cid]
                                   ,[clinica]
                                   ,[leito]
                                   ,[st_leito]
                            FROM [Egressos].[dbo].[vw_carregaDadosCadastro]
                                    where nr_seq=" + Nr_seq + "";

                commd.CommandText = strQuery;
                com.Open();
                commd.ExecuteNonQuery();
                SqlDataReader dr = commd.ExecuteReader();
                if (dr.Read())
                {

                    txtNome.Text = dr.GetString(1);
                    txtSexo.Text = dr.GetString(2);
                    txtDtEntrada.Text = dr.GetString(3);
                    txtDtSaida.Text = dr.GetString(4);
                    TxtH_D.Text = dr.GetString(5);
                    txtClinica.Text = dr.GetString(6);
                    txtLeito.Text = dr.GetString(7);
                    txtEnfLeito.Text = dr.GetString(8);
                }

            }
            catch (Exception ex)
            {

                string erro = ex.Message;
            }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlConnection com = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {
            try
            {
                Internacao p = new Internacao();

                // Adicionado um comentário
                //   p.cd_prontuario = Convert.ToInt32(txtRH.Text); //mudei pra string para testar
                p.cd_prontuario = Convert.ToInt32(txtSeqPaciente.Text);
                int Numero_RH = Convert.ToInt32(p.cd_prontuario);


                p.nm_paciente = txtNome.Text;
                //   p.dt_nascimento = txtDtNasc.Text;
                //    p.sexo= txtSexo.Text;
                //p.dt_internacao; // Todo: colocar a data da internação
                p.dt_entrada_setor = txtDtEntrada.Text;
                // p.dt_saida_paciente = txtDtSaida.Text;
                //  p.Motivo_Saida=DDLmotivoSaida.SelectedValue;
                // p.H_D=TxtH_D.Text;
                p.nm_clinica = txtClinica.Text;

                p.nr_leito = txtLeito.Text;
                //  p.Enf_Leito=txtEnfLeito.Text;
                //   p.Clinica_Alta=DDLClinicaAlta.SelectedValue;
                //p.Proc_1=DDLProc_1.SelectedValue;
                //p.Proc_2=DDLProc_2.SelectedValue;
                //p.Proc_3=DDLProc_3.SelectedValue;
                //p.DESCR_C_C=txtDesc_c_c.Text;
                //p.Cid_pri=DDLCidPri.SelectedValue;
                //p.Cid_Sec=DDLCidSec.SelectedValue;
                //p.Cid_Ass1=DDLcidAss1.SelectedValue;
                //p.Cid_Ass2=DDLcidAss2.SelectedValue;
                //p.CausaExt=DDLcausaExt.SelectedValue;

                //p.Causa_Obito_P1_A=txtDescricaoCausaMorteA;
                //p.Causa_Obito_P1_B=txtDescricaoCausaMorteB;
                //p.Causa_Obito_P1_C=txtDescricaoCausaMorteC;
                //p.Causa_Obito_P1_D=txtDescricaoCausaMorteD;
                //p.Causa_Obito_P2_A=txtDescricaoCausaMorteParte2A;
                //p.Causa_Obito_P2_B=txtDescricaoCausaMorteParte2B;

                //p.Encaminhamento_Do_Cadaver=DDLencaminhamentoCadaver.SelectedValue;
                //p.CausaProv_Obito=txtCausaProvObito.Text;
                //p.Obito_OBS=txtObservacaoCausaObito.Text;






                string strQuery = "";
                //  string conStr = @"Data Source=hspmins4;Initial Catalog=ControleDocumentos;User Id=h010994;Password=soundgarden ";

                // SqlConnection com = new SqlConnection(conStr);
                SqlCommand commd = new SqlCommand(strQuery, com);

                strQuery = @"INSERT INTO [Egressos].[dbo].[movimentacao_paciente]
            ([prontuario_paciente],[leito],[clinica],[dt_entrada_setor])"
                    //           ,[especialidade],[medico],[dt_ultimo_evento],[origem],[sg_cid],[tx_observacao],[convenio]
                    //           ,[plano],[convenio_plano],[crm_profissional],[carater_internacao],[origem_internacao],[procedimento],[dt_alta_medica],[dt_saida_paciente],[tipo_alta_medica]
                    //           ,[vinculo],[orgao],[clinica_alta],[cod_procedimento_1],[cod_procedimento_2],[cod_procedimento_3],[cid_pri],[cid_sec],[cid_causa_externa],[obito_p1_a]
                    //           ,[obito_p1_b],[obito_p1_c],[obito_p1_d],[obito_p2_a],[obito_p2_b],[enc_cadaver],[causa_prov_obito],[obs],[dt_cir_1],[dt_cir_2],[dt_cir_3],[descr_cc]
                    //           ,[cid_associado_1],[cid_associado_2],[hipotese_diagnostica],[nome_funcionario_cadastrou])"

                  + " VALUES (@rh,@leito,@clinica,@dtEntradaSetor)";


                commd.Parameters.Add("@rh", SqlDbType.Int).Value = Numero_RH;
                commd.Parameters.Add("@leito", SqlDbType.NVarChar).Value = p.nr_leito;
                commd.Parameters.Add("@clinica", SqlDbType.NVarChar).Value = p.nm_clinica;
                commd.Parameters.Add("@dtEntradaSetor", SqlDbType.NVarChar).Value = p.dt_entrada_setor;


                //-------------------------------------------------------------------------------//


                commd.CommandText = strQuery;
                com.Open();
                commd.ExecuteNonQuery();
                com.Close();

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "mensagem", "alert('Registro Gravado Com Sucesso!');", true);
            }
            catch (Exception ex)
            {
                string erro = ex.Message;

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "mensagem", "alert('ERRO Registro Não foi Gravado!');", true);

            }
        }
    }



    protected void pesquisarCid_Click(object sender, EventArgs e)
    {
        CID c = new CID();
        c = CidRepository.GetCIDPorCodigo(txbcid.Text);
        txtDescricaoProc_1.Text = c.Descricao;

        int nr_seq = Convert.ToInt32(txtSeqPaciente.Text);
        string clinica = DDLClinicaAlta.SelectedValue;
        string codProced = c.Cid_Numero;
        CidRepository.GravaCidPaciente(nr_seq, clinica, codProced);

        CarregaGrid(nr_seq);
    }

    private void CarregaGrid(int nr_seq)
    {
        gvListaProcedimentos.DataSource = CidRepository.CarregaCIDInternacao(nr_seq);
        gvListaProcedimentos.DataBind();
    }



}
