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

namespace DA_LTCSHARP2_NHOM_16
{
    public partial class frmMain : Form
    {
        BunifuTransition transition = new BunifuTransition();
        public QL_NguoiDung user;
        public frmMain()
        {
            InitializeComponent();
            btnExit.OnIdleState.IconRightImage = null;
            btnExit.onHoverState.IconRightImage = Resource.close;
            this.Controls.Add(bunifuPictureBox1);
            bunifuPictureBox1.BringToFront();
            bunifuPictureBox1.Location = new Point(12, 43);
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

            if (slideMenu.Width == 64)
            {
                UpdateMenuButtons(true);
                btnToggleMenu.IdleIconRightImage = Resource.arrowLeft;
                transition.AnimationType = Bunifu.UI.WinForms.BunifuAnimatorNS.AnimationType.HorizSlide;
                transition.ShowSync(slideMenu);
                slideMenu.Width = 220;

            }
            else
            {
                UpdateMenuButtons(false);
                btnToggleMenu.IdleIconRightImage = Resource.arrowRight;
                transition.AnimationType = Bunifu.UI.WinForms.BunifuAnimatorNS.AnimationType.HorizSlide;
                slideMenu.Width = 64;

            }
        }

        private void UpdateMenuButtons(bool isExpanded)
        {
            if (!isExpanded)
            {
                btnQLSanPham.Text = string.Empty;
                lbLogo.Text = string.Empty;
            }
            else
            {
                btnQLSanPham.Text = btnQLSanPham.Tag.ToString();
                lbLogo.Text = lbLogo.Tag.ToString();
            }
        }
    }
}
