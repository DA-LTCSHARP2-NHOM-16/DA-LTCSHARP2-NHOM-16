using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace DTO
{
    public class ProductEventArgs : EventArgs
    {
        public SanPham SelectedProduct { get; set; }
    }
}
