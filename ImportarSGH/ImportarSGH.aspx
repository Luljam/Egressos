<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Importar do SGH" %>

<script runat="server">
   
  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="bootstrap/jquery/jquery-1.4.1.min.js"></script>

    <%--<script src='<%= ResolveUrl("https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js") %>'
        type="text/javascript"></script>

    <script src='<%= ResolveUrl("https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.min.js") %>'
        type="text/javascript"></script>--%>
    <style type="text/css">
        input
        {
            text-align: left;
        }
    </style>
    <style type="text/css">
        .table
        {
            width: 100%;
            white-space: nowrap;
        }
    </style>

    <script type="text/javascript">$("#dtIni").mask("00/00/0000")</script>

    <%--    <script type="text/javascript">
 
    alert("Teste Jquery")    
 
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron">
        <div class="row">
            <div class="col-2">
                Digite as Datas para Importar do SGH
            </div>
            <div class="col-1">
                Data Inicial:
                <asp:TextBox ID="dtIni" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-1">
                Data Final:
                <asp:TextBox ID="dtFim" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-2">
                <asp:Label ID="Label1" runat="server" class="control-label" Text=""></asp:Label>
                <input id="btnPesquisar" runat="server" type="button" onclick="gerarTabela()" value="Pesquisa"
                    class="btn btn-success" />
            </div>
        </div>
    </div>
    <%--Ó que estva aqui para baixo joguei um bloco de notas--%>
    <div class="container">
    </div>
    <div class="clearfix">
        <table id="tdata1" runat="server" class="table">
            <thead class="thead-dark">
                <tr>
                    <%-- <th>
                        Ação
                    </th>--%>
                    <th>
                        Prontuario
                    </th>
                    <th>
                        Nome
                    </th>
                    <th>
                        Data Internação
                    </th>
                    <th>
                        Sexo
                    </th>
                    <th>
                        Idade
                    </th>
                    <th>
                        Ação
                    </th>
                </tr>
            </thead>
            <tbody id="tdata">
            </tbody>
        </table>
    </div>

    <script type="text/javascript">
    
        function formataData(data) {
            var d = data.value;
            var dia = d.substr(0, 2);
            var mes = d.substr(3, 2);
            var ano = d.substr(6, 4);
            var dataCompleta = ano + "-" + mes + "-" + dia;
            return dataCompleta;
        }
        

             //Teste jr
        function gerarTabela() {
            var dataIni = formataData(document.getElementById('<%=dtIni.ClientID %>'));
            var dataFim = formataData(document.getElementById('<%=dtFim.ClientID %>'));
            dadosMes(dataIni, dataFim);
            //dadosMes(dataIni, dataFim);
            
            
        }

       // function dadosMes(dataIni, dataFim,tipoPesquisa) {
        function dadosMes(dataIni, dataFim) {
            var dIni = JSON.stringify(dataIni);
            var dFim = JSON.stringify(dataFim);
//            var Tpesquisa = tipoPesquisa;
//            console.log(Tpesquisa);
            
            jQuery.support.cors = true;
            $.ajax({
            async: false
//                , url: '<%= ResolveUrl("http://10.48.21.64:5000/hspmsgh-api/internacoes?tipo='+ Tpesquisa +'&dt_inicio=' + dIni + '&dt_fim=' + dFim + '") %>'
                , url: '<%= ResolveUrl("http://10.48.21.64:5000/hspmsgh-api/internacoes?tipo='+ 1 +'&dt_inicio=' + dIni + '&dt_fim=' + dIni + '") %>'
               // , url: '<%= ResolveUrl("http://10.48.21.64:5000/hspmsgh-api/internacoes?tipo='+ 1 +'&dt_inicio=' + dIni + '&dt_fim=' + dFim + '") %>'
                , crossDomain: true
                //, data: '{tipo : 1, dt_inicio: "2020-02-03", dt_fim: "2020-02-03"}'
                , type: 'GET'
                , contentType: 'application/json; charset=utf-8'
                , dataType: 'json'
                , success: function(data) {
                    //var data = JSON.parse(data.d);
                                    data.forEach(function(dt) {
                                        $("#<%=tdata1.ClientID%> tbody").append("<tr>" +
                                            "<td>" + dt.cd_prontuario + "</td>" +
                                            "<td>" + dt.nm_paciente + "</td>" +
                                            "<td>" + dt.dt_internacao + "</td>" +     
                                            "<td>" + dt.in_sexo + "</td>" +
                                            "<td>" + dt.nr_idade + "</td>" +
                                         //  "<td> <a href='Default.aspx?prontuario="+dt.cd_prontuario+"'>selecionar</a> </td>" +                                            
                                           "<td> <a href='Default.aspx?prontuario="+dt.cd_prontuario+ "&nomePaciente="+dt.nm_paciente+
                                           "&sexoPaciente="+dt.in_sexo+"&idadePaciente="+dt.nr_idade+"&dataEntrada="+dt.dt_internacao+"'>selecionar</a> </td>" +                                            
                                           
                                         "</tr>"
                                        );

                                    });

                                }
                                , error: function(xhr, er) {
                                    console.log("deu erro");
                                    console.log(er);
                                    $("#lbMsg").html('<p> Erro ' + xhr.staus + ' - ' + xhr.statusText + ' - <br />Tipo de erro:  ' + er + '</p>');
                                }
            });
        }

        function reloadPage() {
            window.location.reload()
        }
        
    </script>

</asp:Content>
