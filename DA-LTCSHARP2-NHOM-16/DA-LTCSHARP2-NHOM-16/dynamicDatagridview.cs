using BLL;
using Bunifu.UI.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO;
using DAL;

namespace DA_LTCSHARP2_NHOM_16
{
    public partial class dynamicDatagridview : Form
    {
        BunifuPanel pMain = new BunifuPanel();
        ProductsBUL productsBUL = new ProductsBUL();

        Color colorWhite = Color.White;
        BunifuPanel selectedRow = null; // Biến lưu trữ dòng hiện tại đang được chọn
        public event EventHandler<ProductEventArgs> ProductSelected;

        public dynamicDatagridview()
        {
            InitializeComponent();
            crtDataTable();
        }

        BunifuPanel createRowData(int x, int y, int width, int height, SanPham product)
        {
            BunifuPanel row = new BunifuPanel();
            row.Width = width;
            row.Height = height;
            row.Location = new Point(x, y);
            row.BackgroundColor = colorWhite;
            row.BorderRadius = 12;
            row.BorderThickness = 0;
            row.BringToFront();

            row.MouseEnter += (s, e) =>
            {
                if (row != selectedRow) // Chỉ đổi màu khi chưa được chọn
                {
                    row.BackgroundColor = Color.WhiteSmoke;
                }
            };

            row.MouseLeave += (s, e) =>
            {
                if (row != selectedRow) 
                {
                    row.BackgroundColor = colorWhite;
                }
            };

            row.Click += (s, e) =>
            {
                if (selectedRow != null && selectedRow != row)
                {
                    selectedRow.BackgroundColor = colorWhite;
                }

                selectedRow = row;
                selectedRow.BackgroundColor = Color.LightBlue; 

                ProductSelected?.Invoke(this, new ProductEventArgs { SelectedProduct = product });
            };

            return row;
        }

        void AddHoverEffect(Control control)
        {
            control.MouseEnter += (s, e) =>
            {
                if (control.Parent is Bunifu.UI.WinForms.BunifuPanel parentPanel && parentPanel != selectedRow)
                {
                    parentPanel.BackgroundColor = Color.WhiteSmoke; // Màu khi hover
                }
            };

            control.MouseLeave += (s, e) =>
            {
                if (control.Parent is Bunifu.UI.WinForms.BunifuPanel parentPanel && parentPanel != selectedRow)
                {
                    parentPanel.BackgroundColor = colorWhite; // Quay về màu mặc định
                }
            };
        }

        void AddClick(Control control, SanPham product)
        {
            control.Click += (s, e) =>
            {
                if (control.Parent is Bunifu.UI.WinForms.BunifuPanel parentPanel)
                {
                    if (selectedRow != null && selectedRow != parentPanel)
                    {
                        // Đổi màu của dòng đã chọn trước đó về màu mặc định
                        selectedRow.BackgroundColor = colorWhite;
                    }

                    // Cập nhật dòng hiện tại là dòng đã chọn và đổi màu nền
                    selectedRow = parentPanel;
                    selectedRow.BackgroundColor = Color.LightBlue;

                    // Gửi sự kiện cho dòng đã chọn
                    ProductSelected?.Invoke(this, new ProductEventArgs { SelectedProduct = product });
                }
            };
        }

        void crtDataTable()
        {
            var products = productsBUL.getProducts();
            pMain.Location = new Point(0, 35);
            pMain.Size = new Size(830, 540);
            pMain.BackgroundColor = colorWhite;
            pMain.BorderRadius = 12;

            int row = 0;
            foreach (var product in products)
            {
                BunifuPanel rowData = createRowData(10, 61 * row, 820, 60, product);

                // Hình ảnh sản phẩm
                PictureBox pictureBox = new PictureBox();
                pictureBox.Size = new Size(50, 50);
                pictureBox.Location = new Point(10, 5);
                var image = (Image)Properties.Resources.ResourceManager.GetObject(product.HinhAnh);
                if (image != null)
                {
                    pictureBox.Image = image;
                    pictureBox.SizeMode = PictureBoxSizeMode.StretchImage;
                    pictureBox.BackColor = Color.Transparent;
                }
                rowData.Controls.Add(pictureBox);

                // Tên sản phẩm
                Label nameLabel = new Label();
                nameLabel.Text = product.TenSP;
                nameLabel.Location = new Point(160, 24);
                nameLabel.Size = new Size(140, 30);
                nameLabel.BackColor = Color.Transparent;
                rowData.Controls.Add(nameLabel);

                // Giá sản phẩm
                Label priceLabel = new Label();
                priceLabel.Text = product.GiaBan.ToString();
                priceLabel.Location = new Point(310, 24);
                priceLabel.Size = new Size(140, 30);
                priceLabel.BackColor = Color.Transparent;
                rowData.Controls.Add(priceLabel);

                // Số lượng sản phẩm
                Label quantityLabel = new Label();
                quantityLabel.Text = product.SoLuongTon.ToString();
                quantityLabel.Location = new Point(460, 24);
                quantityLabel.Size = new Size(140, 30);
                quantityLabel.BackColor = Color.Transparent;
                rowData.Controls.Add(quantityLabel);

                Label kichThuoc = new Label();
                kichThuoc.Text = product.KichThuoc.ToString();
                kichThuoc.Location = new Point(610, 24);
                kichThuoc.Size = new Size(140, 30);
                kichThuoc.BackColor = Color.Transparent;
                rowData.Controls.Add(kichThuoc);

                Label mauSac = new Label();
                mauSac.Text = product.MauSac.ToString();
                mauSac.Location = new Point(760, 24);
                mauSac.Size = new Size(140, 30);
                mauSac.BackColor = Color.Transparent;
                rowData.Controls.Add(mauSac);

                row++;
                foreach (Control control in rowData.Controls)
                {
                    AddHoverEffect(control);
                    AddClick(control, product);
                }

                pMain.Controls.Add(rowData);
                rowData.BringToFront();
            }

            this.Controls.Add(pMain);
        }
    }

}
