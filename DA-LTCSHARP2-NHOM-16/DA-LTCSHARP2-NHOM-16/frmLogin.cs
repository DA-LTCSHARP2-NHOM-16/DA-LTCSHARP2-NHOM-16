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
using Bunifu;
using Bunifu.UI.WinForms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using DAL;
using BLL;

namespace DA_LTCSHARP2_NHOM_16
{
    public partial class frmLogin : Form
    {
        UserBLL userBLL = new UserBLL();
        Image[] statusPassword = new Image[] { Resource.HidePassword, Resource.ShowPassword };
        frmMain frmMain = new frmMain();
        bool showPassword = false;
        private readonly BunifuSnackbar snackbar = new BunifuSnackbar();
        private BunifuToolTip toolTip = new BunifuToolTip();
        public frmLogin()
        {
            InitializeComponent();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var successOptions = new BunifuSnackbar.CustomizationOptions
            {
                BackColor = Color.WhiteSmoke,
            };
            snackbar.SuccessOptions = successOptions;
        }

        private void bunifuImageButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }


        private void bunifuLabel1_Click(object sender, EventArgs e)
        {

        }

        private void bunifuLabel3_Click(object sender, EventArgs e)
        {

        }

        private void bunifuButton22_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void bunifuButton23_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void bunifuButton24_Click(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Normal)
            {
                this.WindowState = FormWindowState.Maximized;
            }
            else
            {
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void bunifuFormDock1_FormDragging(object sender, Bunifu.UI.WinForms.BunifuFormDock.FormDraggingEventArgs e)
        {

        }

        private void ShowErrorSnackbar(string message)
        {
            snackbar.Show(this, message, BunifuSnackbar.MessageTypes.Error, duration: 3000, position: BunifuSnackbar.Positions.TopRight);
        }

        private void bunifuButton21_Click(object sender, EventArgs e)
        {
            if (!ValidateInput()) return;
            var user = userBLL.Login(txtUsername.Text, txtPassword.Text);  
            if(user != null)
            {
                frmMain.user = user;
                this.Hide();
                frmMain.Show();
                return;
            }
            snackbar.Show(this, "Tên đăng nhập hoặc mật khẩu chưa chính xác!", BunifuSnackbar.MessageTypes.Error);
        }

        private bool ValidateInput()
        {
            bool notNull = true;
            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                errorUsername.Visible = true;
                txtUsername.BorderColorIdle = Color.IndianRed;
                notNull = false;
            }
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                errrorPassword.Visible = true;
                txtPassword.BorderColorIdle = Color.IndianRed;
                notNull = false;
            }

            return notNull;
        }

        private void bunifuPictureBox1_MouseHover(object sender, EventArgs e)
        {
            toolTip.Show(picInfoUserName, "Do not enter area code(While filling phone number");
        }

        private void picInfoPassword_MouseHover(object sender, EventArgs e)
        {
            toolTip.Show(picInfoPassword, "độ dài 3-10 ký tự");
        }

        private void picInfoUserName_Click(object sender, EventArgs e)
        {
            
        }

        private void picInfoUserName_MouseLeave(object sender, EventArgs e)
        {
            toolTip.Hide();
        }

        private void picInfoPassword_MouseLeave(object sender, EventArgs e)
        {
            toolTip.Hide();
        }

        private void picHidePassword_Click(object sender, EventArgs e)
        {
            if (!showPassword)
            {
               
                picHidePassword.Image = statusPassword[1];
                showPassword = true;
                txtPassword.PasswordChar = '\0';
                txtPassword.Text = txtPassword.Text;
                return;
            }

            showPassword = false;
            txtPassword.PasswordChar = '●';
            picHidePassword.Image = statusPassword[0];
        }

        private void txtPassword_MouseEnter(object sender, EventArgs e)
        {
        }

        private void txtPassword_Leave(object sender, EventArgs e)
        {
        }

        private void picInfoPassword_Click(object sender, EventArgs e)
        {

        }

        private void txtPassword_MouseEnter_1(object sender, EventArgs e)
        {
            txtPassword.PasswordChar = '●';
        }

        private void txtPassword_Validating(object sender, CancelEventArgs e)
        {
                

        }

        private void txtPassword_Validated(object sender, EventArgs e)
        {
            
        }

        private void txtPassword_TextChange(object sender, EventArgs e)
        {
            txtPassword.PasswordChar = '●';
            if (string.IsNullOrEmpty(txtPassword.Text))
                txtPassword.PasswordChar = '\0';
            if(showPassword)
                txtPassword.PasswordChar = '\0';
            errrorPassword.Visible = false;
            txtPassword.BorderColorIdle = Color.WhiteSmoke;
        }

        private void txtPassword_Leave_1(object sender, EventArgs e)
        {
            
        }

        private void txtUsername_TextChange(object sender, EventArgs e)
        {
            errorUsername.Visible = false;
            txtUsername.BorderColorIdle = Color.WhiteSmoke;
        }
    }
}
