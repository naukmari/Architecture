using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Entity;
using Lab5.Models;
using Project.Utils;

namespace Lab5.admin
{
    public partial class ContactsManager : System.Web.UI.Page
    {
        private string[] keys = { "ID" };

        protected void Page_Load(object sender, EventArgs e)
        {

            //     if (Membership.GetUser() == null)
            //         Server.Transfer("../account/Login.aspx");




            if (!Page.IsPostBack)
            {
                gridFill();
            }
        }

        protected void gridFill()
        {
            grdContacts.DataSource = ContactBLL.GetAll();
            grdContacts.DataKeyNames = keys;
            grdContacts.DataBind();
        }
        #region GridView event handlers

        protected void grdContactsRowDelete(object sender, GridViewDeleteEventArgs e)
        {
            if (ContactBLL.Delete(e.Keys[0]) != 0)
            {
                msg.Text = "Запис видалено";
                gridFill();
            }
            else
                msg.Text = "Запис не видалено";

        }



        protected void grdContactsRowEdit(object sender, GridViewEditEventArgs e)
        {
            msg.Text = "";
            pnlGrdViewDetail.Enabled = true;
            pnlGrdViewDetail.Visible = true;


            imgbtnNew.Visible = false;
            imgbtnSave.Visible = true;

            grdContacts.EditIndex = e.NewEditIndex;
            grdContacts.SelectedIndex = e.NewEditIndex;

            gridFill();

            var contacts = ContactBLL.GetAll();
            ViewDetails(grdContacts.DataKeys[e.NewEditIndex].Value);
        }
        private void ViewDetails(object iD)
        {
            dtDetailsView.DataSource = ContactBLL.GetByIdAsList(iD);
            dtDetailsView.DataKeyNames = keys;
            dtDetailsView.DataBind();
        }
        #endregion

        #region Buttons event handlers

        protected void imgbtnNew_Click(object sender, ImageClickEventArgs e)
        {
            var list = new List<Contact>();
            var contact = new Contact();

            pnlGrdViewDetail.Visible = true;
            pnlGrdViewDetail.Enabled = true;
            imgbtnSave.Visible = true;

            setDefaultValue(contact);


            list.Add(contact);


            dtDetailsView.DataSource = list;
            dtDetailsView.DataKeyNames = keys;
            dtDetailsView.DataBind();

            grdContacts.SelectedIndex = -1;
            grdContacts.DataBind();
            //BindGrid(grdList, "grdList");

            gridFill();
        }


        private void setDefaultValue(Contact contact)
        {
            contact.Id = Guid.NewGuid();
            contact.FirstName = "Enter, please, FirstName";

            contact.Birthdate = DateTime.Now;
        }

        protected void imgbtnSave_Click(object sender, ImageClickEventArgs e)
        {
            Contact product;
            if (checkValidators())
            {
                if (grdContacts.Rows.Count > 0 && grdContacts.SelectedValue != null)
                {
                    product = GetValueFromPage(new Guid(grdContacts.SelectedValue.ToString()));
                    int index = grdContacts.SelectedRow.DataItemIndex;

                    if ((ContactBLL.Update(product)) != 0)
                    {
                        imgbtnSave.Visible = false;
                        pnlGrdViewDetail.Enabled = false;
                        imgbtnNew.Visible = true;
                        msg.Text = GetGlobalResourceObject("GlobalResources", "SaveSuccess").ToString();
                        gridFill();

                    }
                    else msg.Text = GetGlobalResourceObject("GlobalResources", "SaveUnSuccess").ToString();
                }
                else
                {
                    product = GetValueFromPage(Guid.NewGuid());
                    if (ContactBLL.Add(product) != 0)
                    {
                        imgbtnSave.Visible = false;
                        pnlGrdViewDetail.Enabled = false;
                        imgbtnNew.Visible = true;
                        msg.Text = GetGlobalResourceObject("GlobalResources", "SaveSuccess").ToString();
                        gridFill();

                    }
                    else msg.Text = GetGlobalResourceObject("GlobalResources", "SaveUnSuccess").ToString();
                }
            }
        }

        private Contact GetValueFromPage(Guid Id)
        {

            // var dtDetalView = pnlGrdViewDetail.FindControl("dtDetailsView");
            var contact = new Contact();
            contact.Id = Id;
            contact.FirstName = ((TextBox)dtDetailsView.FindControl("txtFirstName")).Text.Trim();
            contact.LastName = ((TextBox)dtDetailsView.FindControl("txtLastName")).Text.Trim();
            contact.StateOrProvince = ((TextBox)dtDetailsView.FindControl("txtStateOrProvince")).Text.Trim();
            contact.Region = ((TextBox)dtDetailsView.FindControl("txtRegion")).Text.Trim();
            contact.City = ((TextBox)dtDetailsView.FindControl("txtCity")).Text.Trim();
            contact.Address = ((TextBox)dtDetailsView.FindControl("txtAddress")).Text.Trim();
            contact.Email = ((TextBox)dtDetailsView.FindControl("txtEmail")).Text.Trim();
            contact.Birthdate = Convert.ToDateTime(((TextBox)dtDetailsView.FindControl("txtBirthdate")).Text.Trim());
            contact.HomePhone = ((TextBox)dtDetailsView.FindControl("txtHomePhone")).Text.Trim();
            contact.MobilePhone = ((TextBox)dtDetailsView.FindControl("txtMobilePhone")).Text.Trim();
            contact.Visible = ((CheckBox)dtDetailsView.FindControl("chbVisible")).Checked;
            return contact;
        }

        #endregion

        #region Validators

        protected void cvStringValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = Validation.isStringValid(args.Value);
            if (!args.IsValid)
                ((CustomValidator)source).Visible = true;
        }

        protected void cvNumberValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = Validation.isIntValid(args.Value);
        }

        private bool checkValidators()
        {
            bool p = true;

            ValidatorCollection vc = GetValidators("GroupValidation");
            foreach (CustomValidator c in vc)
            {
                c.Validate();
                p &= c.IsValid;
            }

            return p;
        }

        #endregion
    }

}