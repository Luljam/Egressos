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
public class CIDInternacao
{
    public int Id { get; set; }
    public int Nr_Seq { get; set; }
    public string Tipo { get; set; }
    public string Cod_CID { get; set; }
    public string Usuario { get; set; }
}
