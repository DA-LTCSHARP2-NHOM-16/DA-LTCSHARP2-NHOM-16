using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;
using BLL;
using Bunifu.UI.WinForms;
using Bunifu;
using Bunifu.UI.WinForms.BunifuButton;
using DTO;

namespace DA_LTCSHARP2_NHOM_16
{
    public partial class frmMain : Form
    {
        BunifuTransition transition = new BunifuTransition();
        public NguoiDung user;
        public frmMain()
        {
            InitializeComponent();
            btnExit.OnIdleState.IconRightImage = null;
            btnExit.onHoverState.IconRightImage = Resource.close;
            panelMain.AutoScroll = true;
        }

        private void ShowFormInPanel(Form childForm)
        {
            createTxtSearch(432, 116, 260, 41);
            combobox(245, 116, 172, 33);
            
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Location = new Point(3,3);

            // Xóa các control cũ trong panel, nếu có
            panelMain.Controls.Clear();
            panelMain.Controls.Add(childForm);
            panelMain.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void bunifuButton22_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void bunifuButton22_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void bunifuButton22_MouseHover(object sender, EventArgs e)
        {
        }

        private void btnExit_MouseLeave(object sender, EventArgs e)
        {
        }




        private void frmMain_Load(object sender, EventArgs e)
        {

        }

        private void btnToggleMenu_Click(object sender, EventArgs e)
        {

        }


        private void bunifuButton22_Click_2(object sender, EventArgs e)
        {

        }

        private void bunifuButton25_Click(object sender, EventArgs e)
        {

        }

        private void btnQLSanPham_Click(object sender, EventArgs e)
        {
            frmQuanLyNhanVien formQuanLyNhanVien = new frmQuanLyNhanVien();

            ShowFormInPanel(formQuanLyNhanVien);
        }

        private void bunifuPanel1_Click(object sender, EventArgs e)
        {

        }

        private void panelMain_Click(object sender, EventArgs e)
        {

        }

        private void bunifuPictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void bunifuPictureBox1_Click_1(object sender, EventArgs e)
        {
            
        }

        private void bunifuButton29_Click(object sender, EventArgs e)
        {
            string[] headers = { "Hình ảnh", "Tên sản phẩm", "Giá", "Số lượng", "Kích thước", "Màu sắc" };
            BunifuPanel headerPanel = new BunifuPanel();
            for (int i = 0; i < headers.Length; i++)
            {
                Label headerLabel = new Label();
                headerLabel.BackColor = Color.White;
                headerLabel.Text = headers[i];
                headerLabel.Location = new Point(176 * i + 20, 10);
                headerLabel.Size = new Size(170, 30);
                headerPanel.Controls.Add(headerLabel);
            }
            BunifuSeparator bunifuSeparator = new BunifuSeparator();
            bunifuSeparator.Size = new Size(840, 10);
            bunifuSeparator.Location = new Point(210, 200);
            bunifuSeparator.BackColor = Color.White;
            this.Controls.Add(bunifuSeparator);
            headerPanel.BackgroundColor = Color.White;
            headerPanel.Location = new Point(244, 203);
            headerPanel.Size = new Size(990, 30);
            headerPanel.BorderRadius = 12;
            this.Controls.Add(headerPanel);
            headerPanel.BringToFront();
            bunifuSeparator.BringToFront();
            dynamicDatagridview frmQLSanPham = new dynamicDatagridview();
            frmQLSanPham.ProductSelected += ProductListForm_ProductSelected;
            ShowFormInPanel(frmQLSanPham);
        }
        private void ProductListForm_ProductSelected(object sender, ProductEventArgs e)
        {
            MessageBox.Show("Sản phẩm đã chọn: " + e.SelectedProduct.TenSP);
        }
        private void bunifuButton22_Click_3(object sender, EventArgs e)
        {
            frmQuanLyNhanVien frm = new frmQuanLyNhanVien();
            ShowFormInPanel(frm);
        }

        private void bunifuButton24_Click(object sender, EventArgs e)
        {
            frmQuanLyKhachHang frm = new frmQuanLyKhachHang();
            ShowFormInPanel(frm);
        }
        private void createTxtSearch(int x, int y, int width, int height)
        {
            BunifuButton2 btnS = new BunifuButton2();
            BunifuTextBox txtS = new BunifuTextBox();
            txtS.BorderRadius = 10;
            btnS.Text = "";
            btnS.Size = new System.Drawing.Size(36, 35);
            btnS.BackColor = Color.White;
            btnS.IdleFillColor = Color.White;
            btnS.IdleBorderColor = Color.White;
            btnS.onHoverState.FillColor = Color.White;
            btnS.onHoverState.BorderColor = Color.White;
            btnS.OnPressedState.FillColor = Color.White;
            btnS.OnPressedState.BorderColor = Color.White;
            btnS.IconPadding = 8;
            btnS.IdleIconLeftImage = Resource.search;
            btnS.Location = new System.Drawing.Point(x+5, y+2);

            txtS.TextMarginLeft = 50;
            txtS.BorderColorIdle = Color.White;
            txtS.Size = new System.Drawing.Size(width, height);

            txtS.Location = new Point(x, y);
            this.Controls.Add(btnS);
            this.Controls.Add(txtS);
        }

        private void combobox(int x, int y, int width, int height)
        {
            BunifuDropdown dropdown = new BunifuDropdown();
            dropdown.Width = width;
            dropdown.ItemHeight = height;
            dropdown.Items.Add("Name Product");

            dropdown.BackgroundColor = Color.White;
            dropdown.BorderColor = Color.White;
            dropdown.BorderRadius = 10;
            dropdown.Location = new System.Drawing.Point(x, y);
            this.Controls.Add(dropdown);
        }

        private void bunifuButton25_Click_1(object sender, EventArgs e)
        {
            frmQuanLyHoaDon frm = new frmQuanLyHoaDon();
            ShowFormInPanel(frm);
        }

        private void panelMain_MouseHover(object sender, EventArgs e)
        {

        }
    }
}
