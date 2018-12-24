using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab5.Models
{
    public class ContactBLL
    {
        public static List<Contact> GetAll()
        {
            return (new ContactDAO()).GetAll();
        }
        public static Contact GetById(string iD)
        {
            return (new ContactDAO()).Get((new Guid(iD)));
        }
     /*   public static Contact GetById(Guid iD)
        {
            return (new ContactDAO()).Get(iD);
        }*/
        public static Contact GetById(object iD)
        {
            if (iD != null)
            {
                return (new ContactDAO()).Get(new Guid(iD.ToString()));
            }
            return null;
        }

        public static List<Contact> GetByIdAsList(object id)
        {
            List<Contact> list = null;
            if (id != null)
            {
                Contact item = (new ContactDAO()).Get(new Guid(id.ToString()));
                list = new List<Contact>();
                list.Add(item);
            }
            return list;
        }
        public static List<Contact> GetByIdAsList(string sId)
        {
            Contact item = (new ContactDAO()).Get(new Guid(sId));
            List<Contact> l = new List<Contact>();
            l.Add(item);
            return l;
        }
        /* public static List<Contact> GetByIdAsList(Guid iD)
         {
             Contact item = (new ContactDAO()).Get(iD); var l = new List<Contact>(); l.Add(item); return l;
         }
         public static int Delete(Guid iD)
         {
             return (new ContactDAO()).Delete(iD);
         }*/
        public static int Delete(string iD)
        {
            return (new ContactDAO()).Delete(new Guid(iD.ToString()));
        }
        public static int Delete(object iD)
        {
            return (new ContactDAO()).Delete(new Guid(iD.ToString()));
        }
        public static int Update(Contact contact)
        {
            return (new ContactDAO()).Update(contact);
        }
        public static int Add(Contact contact)
        {
            return (new ContactDAO()).Add(contact);
        }

    }
}