﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CausaMorte.aspx.cs" Inherits="CausaMorte" Title="Causa da Morte" %>

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
        <h4 class="text-left">
            Causa da Morte</h4>
        <div class="row-cols-1">
            <h6>
                Parte I</h6>
        </div>
        <!--Causa da Morte-->
        <div class="row">
            <div class="col-1">
                A:
                <asp:TextBox ID="txtCausaMorteA" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label13" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteA" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                B:
                <asp:TextBox ID="txtCausaMorteB" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label14" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteB" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                C:
                <asp:TextBox ID="txtCausaMorteC" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label15" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteC" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-1">
                D:
                <asp:TextBox ID="txtCausaMorteD" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label16" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteD" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row-cols-1">
            <h6>
                Parte II</h6>
        </div>
        <div class="row">
            <div class="col-1">
                A:
                <asp:TextBox ID="txtCausaMorteParte2A" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label17" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteParte2A" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-1">
                B:
                <asp:TextBox ID="txtCausaMorteParte2B" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:Label ID="Label18" runat="server" Text="Descrição"></asp:Label>
                <asp:TextBox ID="txtDescricaoCausaMorteParte2B" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-1">
                ENCAMINHAMENTO DO CADÁVER:
            </div>
            <div class="col-1">
                <asp:DropDownList ID="DDLencaminhamentoCadaver" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-1">
                CAUSA PROV. DO ÓBITO:
            </div>
            <div class="col-1">
                <asp:TextBox ID="txtCausaProvObito" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-1">
                DESCR. CAUSA PROV. ÓBITO:
            </div>
            <div class="col-4">
                <asp:TextBox ID="txtDescricaoCausaProvObito" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-1">
                OBSERVAÇÃO:
            </div>
            <div class="col-8">
                <asp:TextBox ID="txtObservacaoCausaObito" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <!--Button CADASTRAR-->
        <div class="nav justify-content-center m-2">
            <asp:Button ID="btnCadastrarCausaMorte" runat="server" class="btn btn-primary" Text="Cadastrar" />
        </div>
    </div>
</asp:Content>
