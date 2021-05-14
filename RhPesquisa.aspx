<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="RhPesquisa.aspx.cs" Inherits="RhPesquisa" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        input
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron">
        <div class="row">
            <div class="col-2">
                Digite o RH do Paciente:
            </div>
            <div class="col-1">
                RH:
                <asp:TextBox ID="rh_Paciente" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                <asp:Label ID="Label1" runat="server" class="control-label" Text=""></asp:Label>
                <asp:Button ID="btnPesquisar" runat="server" class="btn btn-success" Text="Pesquisar"
                    OnClick="btnPesquisar_Click" />
                <%--<input id="btnPesquisar" type="button" onclick="gerarTabela()" class="btn btn-success"
                    value="Pesquisar" />--%>
            </div>
        </div>
    </div>
    <hr />
    <div>
        <asp:GridView ID="GridView1" runat="server" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px">
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
    </div>
</asp:Content>
