using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.Dao
{
    public class RoleDao
    {
        QuanLyQuanCafeDbContext db = null;
        public RoleDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public List<Role> listAll()
        {
            return db.Roles.ToList();
        }
    }
}
