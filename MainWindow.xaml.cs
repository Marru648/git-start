using ClientToSchool.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ClientToSchool
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            string[] materialsData = File.ReadAllLines(@"C:\Users\pff1\Desktop\вариант1 Книжный мир\Сессия1\unicode.txt");
            for(int i = 0; i < materialsData.Count(); i++)
            {
                string[] currentMaterials = materialsData[i].Split('\t');

                Product materialForDB = new Product
                {
                    ProductName = currentMaterials[0].Trim(),
                    ProductDescription = currentMaterials[1].Trim(),
                    ProductCategory = currentMaterials[2].Trim(),
                    ProductPhoto = File.ReadAllBytes(@"C:\Users\pff1\Desktop\вариант1 Книжный мир\Сессия1\Товар_import\" + currentMaterials[3].Trim()),
                    ProductManufacturer = currentMaterials[4].Trim(),
                    ProductDiscountAmount = (byte?)int.Parse(currentMaterials[5]),
                    ProductQuantityInStock = int.Parse(currentMaterials[6])
                };
                object p = App.Context.Product.Add(materialForDB);
                App.Context.SaveChanges();
            }
        }
    }
}
