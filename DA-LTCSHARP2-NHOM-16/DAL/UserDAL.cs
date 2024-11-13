using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserDAL
    {
        HandbagStoreManagementDataContext db = new HandbagStoreManagementDataContext();
        public NguoiDung Login(string username, string password)
        {
            return (from user in db.NguoiDungs where user.TenND == username
                    && user.MatKhau == password && user.HoatDong == true select user).FirstOrDefault();
        }

    }
}
