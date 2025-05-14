using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProcedureManagament
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            


            InitializeComponent();


        }

        //private void label1_Click(object sender, EventArgs e)
        //{

        //}

        //private void button1_Click(object sender, EventArgs e)
        //{

        //}
       
        private bool simplyCheckCorrectness(TextBox tabValue,string textToShow)
        {

            if (tabValue.Text.Length == 0)
            {
                MessageBox.Show(textToShow);
                tabValue.Focus();
                return false;
            }
            else
                return true;
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            string procedureName = textBoxProcedureNameTabAdd.Text;
            

            bool tabIsCorrectFill = simplyCheckCorrectness(textBoxProcedureNameTabAdd,"Fill procedure name");//można pobierać listę i
                                                                                                             //sprawdzać czy istnieje albo wybierać z listy tak samo authora

            if (!tabIsCorrectFill)
                return;

            string authorProcedureLogin = textBoxAuthorTabAdd.Text;
            tabIsCorrectFill = simplyCheckCorrectness(textBoxAuthorTabAdd, "Fill author login");



            MessageBox.Show("Procedure is correct add ");

            textBoxAuthorTabAdd.Clear();
            textBoxProcedureNameTabAdd.Clear();
        }

        private void listBoxDayOfWeekTabAdd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBoxProcedureNameTabAdd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
