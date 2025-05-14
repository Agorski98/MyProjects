namespace ProcedureManagament
{
    partial class Form1
    {
        /// <summary>
        /// Wymagana zmienna projektanta.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Wyczyść wszystkie używane zasoby.
        /// </summary>
        /// <param name="disposing">prawda, jeżeli zarządzane zasoby powinny zostać zlikwidowane; Fałsz w przeciwnym wypadku.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Kod generowany przez Projektanta formularzy systemu Windows

        /// <summary>
        /// Metoda wymagana do obsługi projektanta — nie należy modyfikować
        /// jej zawartości w edytorze kodu.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.TabAdd = new System.Windows.Forms.TabPage();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.listBoxPeriodTabAdd = new System.Windows.Forms.ListBox();
            this.listBoxDayOfWeekTabAdd = new System.Windows.Forms.ListBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxComment = new System.Windows.Forms.TextBox();
            this.textBoxAuthorTabAdd = new System.Windows.Forms.TextBox();
            this.textBoxProcedureNameTabAdd = new System.Windows.Forms.TextBox();
            this.TabAllProcedure = new System.Windows.Forms.TabPage();
            this.listBoxPeriodTabAll = new System.Windows.Forms.ListBox();
            this.listBoxDayOfWeekTabAll = new System.Windows.Forms.ListBox();
            this.textBoxAuthorTabAll = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.textBoxProcedureNameTabAll = new System.Windows.Forms.TextBox();
            this.buttonFilter = new System.Windows.Forms.Button();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.dataGridProcedureList = new System.Windows.Forms.DataGridView();
            this.tabInfo = new System.Windows.Forms.TabPage();
            this.tabControl1.SuspendLayout();
            this.TabAdd.SuspendLayout();
            this.TabAllProcedure.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridProcedureList)).BeginInit();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.TabAdd);
            this.tabControl1.Controls.Add(this.TabAllProcedure);
            this.tabControl1.Controls.Add(this.tabInfo);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(776, 426);
            this.tabControl1.TabIndex = 0;
            // 
            // TabAdd
            // 
            this.TabAdd.BackColor = System.Drawing.SystemColors.HighlightText;
            this.TabAdd.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.TabAdd.Controls.Add(this.buttonAdd);
            this.TabAdd.Controls.Add(this.listBoxPeriodTabAdd);
            this.TabAdd.Controls.Add(this.listBoxDayOfWeekTabAdd);
            this.TabAdd.Controls.Add(this.label5);
            this.TabAdd.Controls.Add(this.label4);
            this.TabAdd.Controls.Add(this.label3);
            this.TabAdd.Controls.Add(this.label2);
            this.TabAdd.Controls.Add(this.label1);
            this.TabAdd.Controls.Add(this.textBoxComment);
            this.TabAdd.Controls.Add(this.textBoxAuthorTabAdd);
            this.TabAdd.Controls.Add(this.textBoxProcedureNameTabAdd);
            this.TabAdd.ForeColor = System.Drawing.SystemColors.ControlText;
            this.TabAdd.Location = new System.Drawing.Point(4, 22);
            this.TabAdd.Name = "TabAdd";
            this.TabAdd.Padding = new System.Windows.Forms.Padding(3);
            this.TabAdd.Size = new System.Drawing.Size(768, 400);
            this.TabAdd.TabIndex = 0;
            this.TabAdd.Text = "Add";
            // 
            // buttonAdd
            // 
            this.buttonAdd.Location = new System.Drawing.Point(487, 293);
            this.buttonAdd.Name = "buttonAdd";
            this.buttonAdd.Size = new System.Drawing.Size(123, 23);
            this.buttonAdd.TabIndex = 13;
            this.buttonAdd.Text = "Add";
            this.buttonAdd.UseVisualStyleBackColor = true;
            this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);
            // 
            // listBoxPeriodTabAdd
            // 
            this.listBoxPeriodTabAdd.FormattingEnabled = true;
            this.listBoxPeriodTabAdd.Location = new System.Drawing.Point(149, 192);
            this.listBoxPeriodTabAdd.Name = "listBoxPeriodTabAdd";
            this.listBoxPeriodTabAdd.ScrollAlwaysVisible = true;
            this.listBoxPeriodTabAdd.Size = new System.Drawing.Size(123, 69);
            this.listBoxPeriodTabAdd.TabIndex = 12;
            // 
            // listBoxDayOfWeekTabAdd
            // 
            this.listBoxDayOfWeekTabAdd.BackColor = System.Drawing.SystemColors.Window;
            this.listBoxDayOfWeekTabAdd.FormattingEnabled = true;
            this.listBoxDayOfWeekTabAdd.Location = new System.Drawing.Point(149, 91);
            this.listBoxDayOfWeekTabAdd.Name = "listBoxDayOfWeekTabAdd";
            this.listBoxDayOfWeekTabAdd.ScrollAlwaysVisible = true;
            this.listBoxDayOfWeekTabAdd.Size = new System.Drawing.Size(123, 69);
            this.listBoxDayOfWeekTabAdd.Sorted = true;
            this.listBoxDayOfWeekTabAdd.TabIndex = 11;
            this.listBoxDayOfWeekTabAdd.SelectedIndexChanged += new System.EventHandler(this.listBoxDayOfWeekTabAdd_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(26, 192);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(37, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Period";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(26, 91);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Day of week";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(298, 27);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Comment";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(26, 56);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(117, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Author procedure login ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Procedure name";
            // 
            // textBoxComment
            // 
            this.textBoxComment.Location = new System.Drawing.Point(355, 24);
            this.textBoxComment.Multiline = true;
            this.textBoxComment.Name = "textBoxComment";
            this.textBoxComment.Size = new System.Drawing.Size(255, 181);
            this.textBoxComment.TabIndex = 3;
            // 
            // textBoxAuthorTabAdd
            // 
            this.textBoxAuthorTabAdd.Location = new System.Drawing.Point(149, 56);
            this.textBoxAuthorTabAdd.Multiline = true;
            this.textBoxAuthorTabAdd.Name = "textBoxAuthorTabAdd";
            this.textBoxAuthorTabAdd.Size = new System.Drawing.Size(123, 23);
            this.textBoxAuthorTabAdd.TabIndex = 2;
            // 
            // textBoxProcedureNameTabAdd
            // 
            this.textBoxProcedureNameTabAdd.Location = new System.Drawing.Point(149, 27);
            this.textBoxProcedureNameTabAdd.Multiline = true;
            this.textBoxProcedureNameTabAdd.Name = "textBoxProcedureNameTabAdd";
            this.textBoxProcedureNameTabAdd.Size = new System.Drawing.Size(123, 23);
            this.textBoxProcedureNameTabAdd.TabIndex = 1;
            this.textBoxProcedureNameTabAdd.TextChanged += new System.EventHandler(this.textBoxProcedureNameTabAdd_TextChanged);
            // 
            // TabAllProcedure
            // 
            this.TabAllProcedure.BackColor = System.Drawing.SystemColors.HighlightText;
            this.TabAllProcedure.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.TabAllProcedure.Controls.Add(this.listBoxPeriodTabAll);
            this.TabAllProcedure.Controls.Add(this.listBoxDayOfWeekTabAll);
            this.TabAllProcedure.Controls.Add(this.textBoxAuthorTabAll);
            this.TabAllProcedure.Controls.Add(this.label6);
            this.TabAllProcedure.Controls.Add(this.label7);
            this.TabAllProcedure.Controls.Add(this.label8);
            this.TabAllProcedure.Controls.Add(this.label9);
            this.TabAllProcedure.Controls.Add(this.textBoxProcedureNameTabAll);
            this.TabAllProcedure.Controls.Add(this.buttonFilter);
            this.TabAllProcedure.Controls.Add(this.buttonUpdate);
            this.TabAllProcedure.Controls.Add(this.buttonDelete);
            this.TabAllProcedure.Controls.Add(this.dataGridProcedureList);
            this.TabAllProcedure.ForeColor = System.Drawing.SystemColors.ControlText;
            this.TabAllProcedure.Location = new System.Drawing.Point(4, 22);
            this.TabAllProcedure.Name = "TabAllProcedure";
            this.TabAllProcedure.Padding = new System.Windows.Forms.Padding(3);
            this.TabAllProcedure.Size = new System.Drawing.Size(768, 400);
            this.TabAllProcedure.TabIndex = 1;
            this.TabAllProcedure.Text = "All procedure";
            // 
            // listBoxPeriodTabAll
            // 
            this.listBoxPeriodTabAll.FormattingEnabled = true;
            this.listBoxPeriodTabAll.Location = new System.Drawing.Point(635, 192);
            this.listBoxPeriodTabAll.Name = "listBoxPeriodTabAll";
            this.listBoxPeriodTabAll.ScrollAlwaysVisible = true;
            this.listBoxPeriodTabAll.Size = new System.Drawing.Size(123, 69);
            this.listBoxPeriodTabAll.TabIndex = 17;
            // 
            // listBoxDayOfWeekTabAll
            // 
            this.listBoxDayOfWeekTabAll.BackColor = System.Drawing.SystemColors.Window;
            this.listBoxDayOfWeekTabAll.FormattingEnabled = true;
            this.listBoxDayOfWeekTabAll.Location = new System.Drawing.Point(635, 91);
            this.listBoxDayOfWeekTabAll.Name = "listBoxDayOfWeekTabAll";
            this.listBoxDayOfWeekTabAll.ScrollAlwaysVisible = true;
            this.listBoxDayOfWeekTabAll.Size = new System.Drawing.Size(123, 69);
            this.listBoxDayOfWeekTabAll.Sorted = true;
            this.listBoxDayOfWeekTabAll.TabIndex = 16;
            // 
            // textBoxAuthorTabAll
            // 
            this.textBoxAuthorTabAll.Location = new System.Drawing.Point(635, 56);
            this.textBoxAuthorTabAll.Multiline = true;
            this.textBoxAuthorTabAll.Name = "textBoxAuthorTabAll";
            this.textBoxAuthorTabAll.Size = new System.Drawing.Size(123, 20);
            this.textBoxAuthorTabAll.TabIndex = 15;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(513, 192);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(37, 13);
            this.label6.TabIndex = 14;
            this.label6.Text = "Period";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(513, 91);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(67, 13);
            this.label7.TabIndex = 13;
            this.label7.Text = "Day of week";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(513, 56);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(117, 13);
            this.label8.TabIndex = 12;
            this.label8.Text = "Author procedure login ";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(513, 27);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(85, 13);
            this.label9.TabIndex = 11;
            this.label9.Text = "Procedure name";
            // 
            // textBoxProcedureNameTabAll
            // 
            this.textBoxProcedureNameTabAll.Location = new System.Drawing.Point(635, 27);
            this.textBoxProcedureNameTabAll.Multiline = true;
            this.textBoxProcedureNameTabAll.Name = "textBoxProcedureNameTabAll";
            this.textBoxProcedureNameTabAll.Size = new System.Drawing.Size(123, 20);
            this.textBoxProcedureNameTabAll.TabIndex = 4;
            // 
            // buttonFilter
            // 
            this.buttonFilter.Location = new System.Drawing.Point(683, 282);
            this.buttonFilter.Name = "buttonFilter";
            this.buttonFilter.Size = new System.Drawing.Size(75, 23);
            this.buttonFilter.TabIndex = 3;
            this.buttonFilter.Text = "Filter";
            this.buttonFilter.UseVisualStyleBackColor = true;
            // 
            // buttonUpdate
            // 
            this.buttonUpdate.Location = new System.Drawing.Point(119, 282);
            this.buttonUpdate.Name = "buttonUpdate";
            this.buttonUpdate.Size = new System.Drawing.Size(75, 23);
            this.buttonUpdate.TabIndex = 2;
            this.buttonUpdate.Text = "Update";
            this.buttonUpdate.UseVisualStyleBackColor = true;
            // 
            // buttonDelete
            // 
            this.buttonDelete.Location = new System.Drawing.Point(16, 282);
            this.buttonDelete.Name = "buttonDelete";
            this.buttonDelete.Size = new System.Drawing.Size(75, 23);
            this.buttonDelete.TabIndex = 1;
            this.buttonDelete.Text = "Delete";
            this.buttonDelete.UseVisualStyleBackColor = true;
            // 
            // dataGridProcedureList
            // 
            this.dataGridProcedureList.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dataGridProcedureList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridProcedureList.GridColor = System.Drawing.SystemColors.Control;
            this.dataGridProcedureList.Location = new System.Drawing.Point(16, 27);
            this.dataGridProcedureList.Name = "dataGridProcedureList";
            this.dataGridProcedureList.Size = new System.Drawing.Size(468, 249);
            this.dataGridProcedureList.TabIndex = 0;
            // 
            // tabInfo
            // 
            this.tabInfo.Location = new System.Drawing.Point(4, 22);
            this.tabInfo.Name = "tabInfo";
            this.tabInfo.Padding = new System.Windows.Forms.Padding(3);
            this.tabInfo.Size = new System.Drawing.Size(768, 400);
            this.tabInfo.TabIndex = 2;
            this.tabInfo.Text = "Information";
            this.tabInfo.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tabControl1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.Text = "ManagamentApp";
            this.tabControl1.ResumeLayout(false);
            this.TabAdd.ResumeLayout(false);
            this.TabAdd.PerformLayout();
            this.TabAllProcedure.ResumeLayout(false);
            this.TabAllProcedure.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridProcedureList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage TabAdd;
        private System.Windows.Forms.TabPage TabAllProcedure;
        private System.Windows.Forms.TextBox textBoxComment;
        private System.Windows.Forms.TextBox textBoxAuthorTabAdd;
        private System.Windows.Forms.TextBox textBoxProcedureNameTabAdd;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox listBoxPeriodTabAdd;
        private System.Windows.Forms.ListBox listBoxDayOfWeekTabAdd;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.TabPage tabInfo;
        private System.Windows.Forms.DataGridView dataGridProcedureList;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonFilter;
        private System.Windows.Forms.ListBox listBoxPeriodTabAll;
        private System.Windows.Forms.ListBox listBoxDayOfWeekTabAll;
        private System.Windows.Forms.TextBox textBoxAuthorTabAll;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox textBoxProcedureNameTabAll;
    }
}

