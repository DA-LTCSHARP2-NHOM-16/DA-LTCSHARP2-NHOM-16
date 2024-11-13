using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace DA_LTCSHARP2_NHOM_16
{
    public partial class frmQLSP : Form
    {
        ProductsBUL productsBUL = new ProductsBUL();
        public frmQLSP()
        {
            InitializeComponent();
        }
        private void RoundDataGridView(DataGridView dataGridView, int radius)
        {
            var rect = dataGridView.ClientRectangle;

            using (GraphicsPath path = new GraphicsPath())
            {
                // Góc trên bên trái
                path.AddArc(rect.Left, rect.Top, radius, radius, 180, 90);
                // Góc trên bên phải
                path.AddArc(rect.Right - radius, rect.Top, radius, radius, 270, 90);
                // Góc dưới bên phải
                path.AddArc(rect.Right - radius, rect.Bottom - radius, radius, radius, 0, 90);
                // Góc dưới bên trái
                path.AddArc(rect.Left, rect.Bottom - radius, radius, radius, 90, 90);
                // Đóng đường dẫn
                path.CloseFigure();

                // Áp dụng đường dẫn bo góc vào DataGridView
                dataGridView.Region = new Region(path);
            }
        }
        private void dataGridView1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void frmQLSP_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = productsBUL.getProducts();
            dataGridView1.Columns["MauSac"].Visible = false;
            dataGridView1.Columns["ChatLieu"].Visible = false;
            dataGridView1.Columns["MoTa"].Visible = false;
            dataGridView1.Columns["LoaiSanPham"].Visible = false;
            dataGridView1.Columns["KichThuoc"].Visible = false;
            dataGridView1.Columns["ThuongHieu"].Visible = false;
        }

        private void dataGridView1_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
        {
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void bunifuPanel1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellPainting_1(object sender, DataGridViewCellPaintingEventArgs e)
        {

        }
    }
}
