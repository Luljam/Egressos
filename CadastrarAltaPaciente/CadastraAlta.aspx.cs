﻿using System;
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
        string nrSeq = Request.QueryString["nrSeq"];
        txtSeqPaciente.Text = nrSeq;
        BindDados(Convert.ToInt32(nrSeq));
        txtSeqPaciente.Enabled = false;
    }

    private void BindDados(int p)
    {
       
        using (SqlConnection com = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {
            try
            {
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
                                    where nr_seq=" + p + "";

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
        CarregaGrid(p);
        CarregaGridProcedimentosInternacao(p);
    }

    
    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlConnection com = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EgressosConnectionString"].ToString()))
        {
            try
            {
                Internacao p = new Internacao();
                p.cd_prontuario = Convert.ToInt32(txtSeqPaciente.Text);
                int Numero_RH = Convert.ToInt32(p.cd_prontuario);
                p.nm_paciente = txtNome.Text;
                p.dt_entrada_setor = txtDtEntrada.Text;
                p.nm_clinica = txtClinica.Text;

                p.nr_leito = txtLeito.Text;

                string strQuery = "";
                SqlCommand commd = new SqlCommand(strQuery, com);

                strQuery = "INSERT INTO [Egressos].[dbo].[movimentacao_paciente] ([prontuario_paciente],[leito],[clinica],[dt_entrada_setor])"
                  + " VALUES (@rh,@leito,@clinica,@dtEntradaSetor)";
                commd.Parameters.Add("@rh", SqlDbType.Int).Value = Numero_RH;
                commd.Parameters.Add("@leito", SqlDbType.NVarChar).Value = p.nr_leito;
                commd.Parameters.Add("@clinica", SqlDbType.NVarChar).Value = p.nm_clinica;
                commd.Parameters.Add("@dtEntradaSetor", SqlDbType.NVarChar).Value = p.dt_entrada_setor;

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
        CIDInternacao cidInternacao = new CIDInternacao();
        c = CidRepository.GetCIDPorCodigo(txbcid.Text);
        cidInternacao.Nr_Seq = Convert.ToInt32(txtSeqPaciente.Text);
        cidInternacao.Tipo = "Primario"; // depois carregar um dropdow com os tipos
        cidInternacao.Cod_CID = c.Cid_Numero;
        cidInternacao.Usuario = "Junior 2";
        CidRepository.GravaCidPaciente(cidInternacao);

        CarregaGrid(cidInternacao.Nr_Seq);
    }

    private void CarregaGrid(int nr_seq)
    {
        gvListaCID.DataSource = CidRepository.CarregaCIDInternacao(nr_seq);
        gvListaCID.DataBind();
    }
    protected void btnPesquisarProcedimento_Click(object sender, EventArgs e)
    {
        int codProcedimento = Convert.ToInt32(txtCodigoProcedimento.Text);
        ProcedimentoCir p = new ProcedimentoCir();
        Procedimento_Internacao pI = new Procedimento_Internacao();
        p = ProcedimentoCirRepository.GetProcedimentoCirPorCodigo(codProcedimento);
        pI.Nr_Seq = Convert.ToInt32(txtSeqPaciente.Text);
        pI.Cod_Procedimento = p.Procedimento;
        pI.Data_Cir = Convert.ToDateTime(txtDtCirurgia.Text);
        pI.Nome_Funcionario_Cadastrou = "Junior2";
        try
        {
            ProcedimentoCirRepository.GravaProcedimentoCirPaciente(pI);

        }
        catch (Exception ex)
        {

            string erro = ex.Message;
        }
        CarregaGridProcedimentosInternacao(pI.Nr_Seq);
    }

    private void CarregaGridProcedimentosInternacao(int p)
    {
        gvProcedimento.DataSource = ProcedimentoCirRepository.CarregaProcedimentosInternacao(p);
        gvProcedimento.DataBind();
    }

    protected void grdProcedimentoCir_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //int id = Convert.ToInt32(txtRemoveProcedimento.Text);
        //CidRepository.RemoverProcedimentoPaciente(id);
        //CarregaGridProcedimentosInternacao(Convert.ToInt32(txtSeqPaciente.Text));

        if (e.CommandName.Equals("deletaProcedimento"))
        {
            GridViewRow row = gvProcedimento.Rows[Convert.ToInt32(e.CommandArgument)];
            CidRepository.RemoverProcedimentoPaciente(Convert.ToInt32(gvProcedimento.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString()));
        }
        CarregaGridProcedimentosInternacao(Convert.ToInt32(txtSeqPaciente.Text));


    }

    protected void grdMain_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("deletaCid"))
        {
            GridViewRow row = gvListaCID.Rows[Convert.ToInt32(e.CommandArgument)];
            CidRepository.RemoverCidPaciente(Convert.ToInt32(gvListaCID.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString()));
        }
        CarregaGrid(Convert.ToInt32(txtSeqPaciente.Text));
    }
}
