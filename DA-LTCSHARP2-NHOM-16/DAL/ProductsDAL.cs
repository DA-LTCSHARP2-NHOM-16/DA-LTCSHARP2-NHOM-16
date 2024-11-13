using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ProductsDAL
    {
        HandbagStoreManagementDataContext db = new HandbagStoreManagementDataContext();
        public IEnumerable<SanPham> getAllSanPham()
        {
            return from product in db.SanPhams select product;
        }
        public SanPham GetSanPham(int id)
        {
            return (from product in db.SanPhams 
                    where product.MaSP == id select product).FirstOrDefault();
        }
    }
}
