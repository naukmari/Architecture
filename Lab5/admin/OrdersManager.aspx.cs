using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab5.admin
{
    public partial class OrdersManager : System.Web.UI.Page
    {
        string[] keys = { "ID" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                grdListFill();
            }
        }

        protected void grdListFill()
        {

            // grdContacts.DataSource = ContactBLL.GetAll();
            // grdContacts.DataKeyNames = keys;
            // grdContacts.DataBind();
        }
    }
}