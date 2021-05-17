<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login_Login" Title="Login Egressos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron">
        <div class="row">
            <div class="col">
                <div class="row h-100 justify-content-center align-items-center">
                    <asp:Login ID="Login1" runat="server" 
                        DestinationPageUrl="~/RhPesquisa/RhPesquisa.aspx" DisplayRememberMe="False">
                    </asp:Login>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
