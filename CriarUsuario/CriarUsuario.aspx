<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CriarUsuario.aspx.cs" Inherits="CriarUsuario_CriarUsuario" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="jumbotron">
        <div class="row">
            <div class="col">
                <div class="row h-100 justify-content-center align-items-center">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                        ContinueDestinationPageUrl="~/Login/Login.aspx" Email="n@n.com">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                    </asp:Login>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

