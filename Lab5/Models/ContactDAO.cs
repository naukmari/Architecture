using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab5.Models
{
    public class ContactDAO : BaseDAO
    {
        public Contact Get(Guid id)
        {
            Contact contact = null;
            command.CommandText = "Contact_Get";
            SqlParameter objParam = command.Parameters.Add("@Id", SqlDbType.UniqueIdentifier);
            objParam.Value = id;
            SqlDataReader objReader = command.ExecuteReader();
            if (objReader.Read())
            {
                contact = getItem(objReader);
            }
            conn.Close();
            return contact;
        } /// <summary> /// Get contacts from db /// </summary> /// <returns>collection</returns> 
        public List<Contact> GetAll()
        {
            command.CommandText = "[Contact_GetAll]";
            return getItems();
        } /// <summary> /// Get contacts from db /// </summary> /// <param name="visible">true - visible, false - not</param> /// <returns>collection</returns>
        public List<Contact> GetAll(bool visible)
        {
            command.CommandText = "Contact_GetAll";
            return visible ? getVisibleItems(true) : getVisibleItems(false);
        }

        public int Add(Contact ob)
        {
            command.CommandText = "Contact_Add";
            setParameters(ob);
            var insertedRows = command.ExecuteNonQuery();
            var o = command.Parameters["RETURN VALUE"].Value;
            if (o != null)
                insertedRows = Convert.ToInt32(o);
            conn.Close();
            return insertedRows;
        }

        public int Update(Contact ob)
        {
            command.CommandText = "Contact_Update";
            setParameters(ob);
            var insertedRows = command.ExecuteNonQuery();
            conn.Close();
            return insertedRows;
        }

        public int Delete(Guid id)
        {
            command.CommandText = "Contact_Delete";
            SqlParameter objParam = command.Parameters.Add("@Id", SqlDbType.UniqueIdentifier);
            objParam.Value = id;
            int result = command.ExecuteNonQuery();
            conn.Close();
            return result;
        }
        private List<Contact> getItems()
        {
            var objReader = command.ExecuteReader();
            var list = new List<Contact>();
            while (objReader.Read())
            {
                list.Add(getItem(objReader));
            }
            conn.Close();
            return list;
        }

        /// <summary> /// Get contacts from db /// </summary> /// <param name="visible">true - visible, false - not</param> /// <returns>collection</returns> 
        private List<Contact> getVisibleItems(bool visible)
        {
            var list = new List<Contact>();
            var objReader = command.ExecuteReader();
            while (objReader.Read())
            {
                var p = getItem(objReader);
                if (p.Visible == visible)
                    list.Add(p);
            }
            conn.Close();
            return list;
        }

        private Contact getItem(SqlDataReader objReader)
        {
            var contact = new Contact();
            object ob = null;
            contact.Id = new Guid((objReader.GetValue(0)).ToString());
            if ((ob = objReader.GetValue(1)) != DBNull.Value)
                contact.FirstName = Convert.ToString(ob);
            if ((ob = objReader.GetValue(2)) != DBNull.Value)
                contact.LastName = Convert.ToString(ob);
            if ((ob = objReader.GetValue(3)) != DBNull.Value)
                contact.StateOrProvince = Convert.ToString(ob);
            if ((ob = objReader.GetValue(4)) != DBNull.Value)
                contact.Region = Convert.ToString(ob);
            if ((ob = objReader.GetValue(5)) != DBNull.Value)
                contact.City = Convert.ToString(ob);
            if ((ob = objReader.GetValue(6)) != DBNull.Value)
                contact.Address = Convert.ToString(ob);
            if ((ob = objReader.GetValue(7)) != DBNull.Value)
                contact.Email = Convert.ToString(ob);
            if ((ob = objReader.GetValue(8)) != DBNull.Value)
                contact.Birthdate = Convert.ToDateTime(ob);
            if ((ob = objReader.GetValue(9)) != DBNull.Value)
                contact.HomePhone = Convert.ToString(ob);
            if ((ob = objReader.GetValue(10)) != DBNull.Value)
                contact.MobilePhone = Convert.ToString(ob);
            if ((ob = objReader.GetValue(11)) != DBNull.Value)
                contact.Visible = Convert.ToBoolean(ob);
            return contact;
        }
        private void setParameters(Contact ob)
        {
            SqlParameter objParam1 = command.Parameters.Add("@Id", SqlDbType.UniqueIdentifier);
            objParam1.Value = ob.Id;
            SqlParameter objParam2 = command.Parameters.Add("@FirstName", SqlDbType.NVarChar);
            objParam2.Value = ob.FirstName;
            SqlParameter objParam3 = command.Parameters.Add("@LastName", SqlDbType.NVarChar);
            objParam3.Value = ob.LastName;
            SqlParameter objParam4 = command.Parameters.Add("@StateOrProvince", SqlDbType.NVarChar);
            objParam4.Value = ob.StateOrProvince;
            SqlParameter objParam5 = command.Parameters.Add("@Region", SqlDbType.NVarChar);
            objParam5.Value = ob.Region;
            SqlParameter objParam6 = command.Parameters.Add("@City", SqlDbType.NVarChar);
            objParam6.Value = ob.City;
            SqlParameter objParam7 = command.Parameters.Add("@Address", SqlDbType.NVarChar);
            objParam7.Value = ob.Address;
            SqlParameter objParam8 = command.Parameters.Add("@Email", SqlDbType.NVarChar);
            objParam8.Value = ob.Email;
            SqlParameter objParam9 = command.Parameters.Add("@Birthdate", SqlDbType.SmallDateTime);
            objParam9.Value = ob.Birthdate;
            SqlParameter objParam10 = command.Parameters.Add("@HomePhone", SqlDbType.NVarChar);
            objParam10.Value = ob.HomePhone;
            SqlParameter objParam11 = command.Parameters.Add("@MobilePhone", SqlDbType.NVarChar);
            objParam11.Value = ob.MobilePhone;
            SqlParameter objParam12 = command.Parameters.Add("@Visible", SqlDbType.Bit);
            objParam12.Value = ob.Visible;
            SqlParameter objParam13 = command.Parameters.Add("RETURN VALUE", SqlDbType.Int);
            objParam13.Direction = ParameterDirection.ReturnValue;
        }
    }
}


    