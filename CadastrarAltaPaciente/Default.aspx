<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Cadastrar Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        input
        {
            text-align: left;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- <div class="container-fluid"> -->
    <div class="jumbotron">
        <!-- Form alinhado -->
        <%--<div class="row">
            <asp:Label ID="Label4" class="form-label" runat="server" Text="Digite RH:"></asp:Label>
            <div class="col-sm-2">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button3" class="btn btn-success" runat="server" Text="Pesquisar" />
        </div>--%>
        <!-- Fim -->
        <!-- <div class="p-3 mb-2 bg-light text-dark"> -->
        <!-- <div class="shadow p-3 mb-5 bg-white rounded"> -->
        <div class="row">
            <div class="col-2">
                <asp:Label ID="Label2" class="control-label" runat="server" 
                    Text="Digite Nº Internação:"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <!--  <asp:TextBox ID="TextBox1" runat="server" class="form-control" ></asp:TextBox>-->
                <asp:TextBox ID="txtSeqPaciente" runat="server" class="form-control" required></asp:TextBox>
                <!-- required serve para deixar o campo Obrigatório-->
            </div>
            <div class="col-2">
                <asp:Button ID="btnPesquisa" class="btn btn-success" runat="server" 
                    Text="Pesquisar" onclick="btnPesquisa_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <!-- <div class="col-6"> define a largura da coluna -->
                <asp:Label ID="Label" class="control-label" runat="server" Text="Nome:"></asp:Label>
                <asp:TextBox ID="txtNome" runat="server" class="form-control "></asp:TextBox>
            </div>
            <div class="col-2">
                <asp:Label ID="Label3" runat="server" class="control-label" Text="Data Nascimento:"></asp:Label>
                <asp:TextBox ID="txtDtNasc" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                <asp:Label ID="Label7" runat="server" class="control-label" Text="Sexo"></asp:Label>
                <asp:TextBox ID="txtSexo" runat="server" class="form-control"></asp:TextBox>
                <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                Data Entrada:
                <asp:TextBox ID="txtDtEntrada" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Data Saida
                <asp:TextBox ID="txtDtSaida" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Motivo da Saida
                <asp:DropDownList ID="DDLmotivoSaida" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-1">
                H.D:
                <asp:TextBox ID="TxtH_D" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:Label ID="Label8" runat="server" class="control-label" Text="Descrição:"></asp:Label>
                <asp:TextBox ID="txtDescricao" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                Clinica:
                <asp:TextBox ID="txtClinica" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Leito:
                <asp:TextBox ID="txtLeito" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Enf. Leito:
                <asp:TextBox ID="txtEnfLeito" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Clinica Alta:
                <asp:DropDownList ID="DDLClinicaAlta" runat="server" class="form-control" DataSourceID="SqlDataSource2"
                    DataTextField="descricao" DataValueField="idClinica">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EgressosConnectionString %>"
                    SelectCommand="SELECT [descricao], [idClinica] FROM [clinicaAlta] ORDER BY [descricao]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                Proc_1
                <asp:DropDownList ID="DDLProc_1" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Procedimento" 
                    DataValueField="Descrição" 
                    onselectedindexchanged="DDLProc_1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:EgressosConnectionString %>" 
                    SelectCommand="SELECT [Procedimento], [Descrição] FROM [procedimentoCir] ORDER BY [Procedimento]">
                </asp:SqlDataSource>
            </div>
            <div class="col-4">
                <asp:Label ID="Label1" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoProc_1" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Data Cir_1
                <asp:TextBox ID="txtDtCir_1" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                Proc_2
                <asp:DropDownList ID="DDLProc_2" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Procedimento" 
                    DataValueField="Descrição" 
                    onselectedindexchanged="DDLProc_2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label4" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoProc_2" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                Data Cir_2
                <asp:TextBox ID="txtDtCir_2" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                Proc_3
                <asp:DropDownList ID="DDLProc_3" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Procedimento" 
                    DataValueField="Descrição" 
                    onselectedindexchanged="DDLProc_3_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label5" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoProc_3" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2 mb-3">
                Data Cir_3
                <asp:TextBox ID="txtDtCir_3" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-5">
                DESCR. C.C:
                <asp:TextBox ID="txtDesc_c_c" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                Cid Pri:
                <asp:DropDownList ID="DDLCidPri" runat="server" class="form-control" DataSourceID="SqlDataSource1"
                    DataTextField="cid_numero" DataValueField="descricao_cid" 
                    AutoPostBack="True" onselectedindexchanged="DDLCidPri_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EgressosConnectionString %>"
                    
                    SelectCommand="SELECT [cid_numero], [descricao_cid] FROM [cid_obito] ORDER BY [cid_numero]"></asp:SqlDataSource>
            </div>
            <div class="col-4">
                <asp:Label ID="Label6" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCidPri" runat="server" class="form-control" 
                    AutoPostBack="True"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                Cid Sec:
                <asp:DropDownList ID="DDLCidSec" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cid_numero" 
                    DataValueField="descricao_cid" 
                    onselectedindexchanged="DDLCidSec_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label9" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCidSec" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                Cid Ass1:
                <asp:DropDownList ID="DDLcidAss1" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cid_numero" 
                    DataValueField="descricao_cid" 
                    onselectedindexchanged="DDLcidAss1_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label10" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCidAss1" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                Cid Ass2:
                <asp:DropDownList ID="DDLcidAss2" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cid_numero" 
                    DataValueField="descricao_cid" 
                    onselectedindexchanged="DDLcidAss2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label11" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoAss2" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                Causa Ext:
                <asp:DropDownList ID="DDLcausaExt" runat="server" class="form-control" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cid_numero" 
                    DataValueField="descricao_cid" 
                    onselectedindexchanged="DDLcausaExt_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-4">
                <asp:Label ID="Label12" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaExt" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <!--Button CADASTRAR-->
        <div class="nav justify-content-center m-2">
            <asp:Button ID="btnCadastrar" runat="server" class="btn btn-primary" Text="Cadastrar"
                OnClick="Button2_Click" />
        </div>
    </div>
    <!--</div>-->
</asp:Content>
