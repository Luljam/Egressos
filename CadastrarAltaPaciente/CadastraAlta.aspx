<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CadastraAlta.aspx.cs" Inherits="CadastrarAltaPaciente_CadastraAlta" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        input
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                <asp:DropDownList ID="DDLProc_1" runat="server" class="form-control">
                </asp:DropDownList>
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
        
        <!--Button CADASTRAR-->
        <div class="nav justify-content-center m-2">
            <asp:Button ID="btnCadastrar" runat="server" class="btn btn-primary" Text="Cadastrar"
                OnClick="Button2_Click" />
        </div>
    </div>
    <!--</div>-->
</asp:Content>

