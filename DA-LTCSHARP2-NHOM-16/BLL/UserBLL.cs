using DAL;

namespace BLL
{
    public class UserBLL
    {
        UserDAL userDAL = new UserDAL();    
        public QL_NguoiDung Login(string username, string password)
        {
            return userDAL.Login(username, password);   
        }
    }
}
