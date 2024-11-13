using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
namespace BLL
{
    public class ProductsBUL
    {
        ProductsDAL productsDAL = new ProductsDAL();
        public IEnumerable<SanPham> getProducts()
        {
            return productsDAL.getAllSanPham();
        }
        public SanPham GetSanPham(int id)
        {
            return productsDAL.GetSanPham(id);
        }
    }
}
