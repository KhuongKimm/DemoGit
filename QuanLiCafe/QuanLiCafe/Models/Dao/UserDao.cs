using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using PagedList;
using Models.ViewModel;

namespace Models.Dao
{
    public class UserDao
    {
        QuanLyQuanCafeDbContext db = null;
        public UserDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public Account GetbyUser(string userName)
        {
            return db.Accounts.SingleOrDefault(x => x.UserName == userName);
        }
        public bool ChangeStatus(long id)
        {
            var user = db.Accounts.Find(id);
            user.status = !user.status;
            db.SaveChanges();
            return user.status;
        }
        public Account ViewDetail(int id)
        {
            return db.Accounts.Find(id);
        }
        public long Insert(Account entity)
        {
            db.Accounts.Add(entity);
            db.SaveChanges();
            return entity.id;
        }
        public bool Edit(Account entity)
        {
            try
            {
                var user = db.Accounts.Find(entity.id);
                user.UserName = entity.UserName;
                user.Name = entity.Name;
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                user.status = entity.status;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Accounts.Find(id);
                db.Accounts.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public int Login(string userName, string password)
        {
            var result = db.Accounts.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.PassWord != password)
                {
                    return -1;
                }
                else
                {
                    if (result.status == false)
                    {
                        return 2;
                    }
                    else
                        return 1;
                }
            }

        }
        
        public IEnumerable<UserLisst> listAllpage(string seaching, int page, int pageSize, int? idRole)
        {
            IQueryable<UserLisst> model = from a in db.Accounts
                                              join b in db.Roles
                                              on a.idRole equals b.Role_id
                                              select new UserLisst()
                                              {
                                                  id = a.id,
                                                  Email = a.Email,
                                                  Address = a.Address,
                                                  UserName = a.UserName,
                                                  idRole = b.Role_id,
                                                  RoleName = b.RoleName,
                                                  Name =a.Name,
                                                  Phone = a.Phone,
                                                  PassWord = a.PassWord,
                                                  status = a.status
                                              };
            if (!string.IsNullOrEmpty(seaching))
            {

                model = model.Where(x => x.Name.Contains(seaching) || x.RoleName.Contains(seaching) || x.RoleName.Contains(seaching)).OrderBy(x => x.id);
            }
            return model.OrderBy(x => x.id).ToPagedList(page, pageSize);
        }
        public List<Role> listAc()
        {
            return db.Roles.ToList();
        }
    }
}
