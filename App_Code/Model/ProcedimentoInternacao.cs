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

/// <summary>
/// Summary description for ProcedimentoInternacao
/// </summary>
public class ProcedimentoInternacao
{
    public int Id { get; set; }
    public int Nr_Seq { get; set; }
    public string Clinica { get; set; }
    public string Cod_Procedimento { get; set; }
    public string usuario { get; set; }
}
