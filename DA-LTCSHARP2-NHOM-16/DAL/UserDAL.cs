using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserDAL
    {
        HandBagsManagementDataContext db = new HandBagsManagementDataContext();
        public QL_NguoiDung Login(string username, string password)
        {
            return (from user in db.QL_NguoiDungs where user.TenDangNhap == username
                    && user.MatKhau == password && user.HoatDong == 1 select user).FirstOrDefault();
        }
    }
}
