using Models.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace QuanLiCafe.Areas.Admin.Models
{
    public class UserModel
    {
        //public List<Account> Accounts { get; set; }

        public PagedList.IPagedList<Account> Accounts { get; set; }
    }
}