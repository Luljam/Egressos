﻿using System;
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
/// Summary description for ProcedimentoCir
/// </summary>
public class ProcedimentoCir
{
    public int Procedimento { get; set; }
    public string Descricao { get; set; }
    public int Competencia { get; set; }
}