using Agent.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace Agent
{
    /// <summary>
    /// Логика взаимодействия для AddEditProductWindow.xaml
    /// </summary>
    public partial class AddEditProductWindow : Window
    {
        private static AgentContext db = new AgentContext();
        List<ProductMaterial> newProductMaterials = new List<ProductMaterial>();
        List<ProductMaterial> deletedProductMaterials = new List<ProductMaterial>();
        private List<int> UsedMaterialIds = new List<int>();
        private Product _product;
        private string _exitMode = "delete";
        private string _mode;

        public AddEditProductWindow()
        {
            InitializeComponent();
            _mode = "add";
            Title = "Добавление продукта";
            Product product = new Product()
            {
                Title = "Название",
                ProductTypeId = 1,
                ArticleNumber = "000000",
                Description = null,
                Image = null,
                ProductionPersonCount = null,
                ProductionWorkshopNumber = null,
                MinCostForAgent = 0
            };
            db.Products.Add(product);
            db.SaveChanges();
            this.DataContext = product;
            _product = product;
            UpdateAllLists();
        }
        public AddEditProductWindow(Product product)
        {
            InitializeComponent();
            _mode = "edit";
            Title = "Редактирование продукта";
            _product = product;
            this.DataContext = product;
            UpdateAllLists();
        }
        void InitView()
        {
            ProductTypeCBox.ItemsSource = db.ProductTypes.ToList();
            ProductTypeCBox.SelectedItem = db.ProductTypes.Where(x => x.Id == _product.ProductTypeId).FirstOrDefault();
        }
        void UpdateAllLists()
        {
            InitView();
            MaterialsDGrid.ItemsSource = 
            AvailableMaterialsDGrid.ItemsSource =
            MaterialsDGrid.ItemsSource = UpdateMaterialsList();
            AvailableMaterialsDGrid.ItemsSource = UpdateAvailableMaterialsList();
        }
        List<ProductMaterial> UpdateMaterialsList()
        {
            var source = db.ProductMaterials
                  .Where(x => x.ProductId == _product.Id)
                  .Include(x => x.Material)
                  .ThenInclude(x => x.MaterialType)
                  .ToList();
            foreach (var material in source)
                UsedMaterialIds.Add(material.MaterialId);
            //return db.Materials.Include(x => x.MaterialType).Include(x => x.ProductMaterials.Where(x => x.ProductId == _product.Id)).ThenInclude(x => x.Product).ToList();
            return source.OrderBy(x => x.Count).ToList();

            //return db.Materials.Include(x => x.MaterialType).Include(x => x.ProductMaterials.Where(x => x.ProductId == _product.Id)).ToList();
        }
        List<Material> UpdateAvailableMaterialsList()
        {
            var materials = db.Materials.Include(x => x.MaterialType).Include(x => x.ProductMaterials).ToList();
            var source = new List<Material>();
            foreach (var material in materials)
                if (!UsedMaterialIds.Contains(material.Id))
                    source.Add(material);
            return source;
        }
        private void AddNewMaterialForProduct()
        {
            var newMaterial = AvailableMaterialsDGrid.SelectedItem as Material;
            if (!IsExists(newMaterial))
                return;
            var newProductMaterial = new ProductMaterial()
            {
                ProductId = _product.Id,
                MaterialId = newMaterial.Id,
                Count = 1
            };
            db.ProductMaterials.Add(newProductMaterial);
            newProductMaterials.Add(newProductMaterial);
            db.SaveChanges();
            UpdateAllLists();


        }

        private void AvailableMaterialsDGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            AddNewMaterialForProduct();
        }
        private void AddMnItem_Click(object sender, RoutedEventArgs e)
        {
            AddNewMaterialForProduct();
        }
        private void CloseWindowBtn_Click(object sender, RoutedEventArgs e)
        {
            _exitMode = "delete";
            this.Close();
        }
        private void SubmitChangesBtn_Click(object sender, RoutedEventArgs e)
        {
            _exitMode = "save";
            if (String.IsNullOrWhiteSpace(TitleTBox.Text) || TitleTBox.Text == "Название" ||
                String.IsNullOrWhiteSpace(ArticleTBox.Text) || ArticleTBox.Text == "000000" ||
                String.IsNullOrWhiteSpace(MinCostTBox.Text) || MinCostTBox.Text == "0"
                )
            {
                MessageBox.Show(
                    "Следующие поля обязательны к заполнению: \n" +
                    "Название, Артикул, Мин. Стоимость.");
                return;
            }
            var pr = db.Products.Where(x => x.Id == _product.Id).First();


            pr.Title = TitleTBox.Text;
            pr.ArticleNumber = ArticleTBox.Text;
            string stringCost = null;
            try
            {
                if (MinCostTBox.Text.Contains(','))
                    stringCost = stringCost.Replace(',', '.');
                stringCost = MinCostTBox.Text.Substring(0, MinCostTBox.Text.IndexOf('.'));
            }
            catch (Exception)
            { 
                pr.MinCostForAgent = Decimal.Parse(MinCostTBox.Text);
            }
            if (!String.IsNullOrWhiteSpace(stringCost))
                pr.MinCostForAgent = Decimal.Parse(stringCost);
            pr.Description = DescriptionTBox.Text;
            try
            { pr.ProductionPersonCount = Int32.Parse(PersonCountTBox.Text); }
            catch (Exception) { }
            try
            { pr.ProductionWorkshopNumber = Int32.Parse(WorkshopNumberTBox.Text); }
            catch (Exception) { }
            pr.ProductType = db.ProductTypes.Where(x => x.Title == ProductTypeCBox.Text).First();
            pr.ProductTypeId = db.ProductTypes.Where(x => x.Title == ProductTypeCBox.Text).First().Id;
            db.SaveChanges();
            this.Close();
        }
        private void Window_Closed(object sender, EventArgs e)
        {
            if (_mode == "add" && _exitMode == "delete")
            {
                db.ProductMaterials.RemoveRange(newProductMaterials);
                db.Products.Remove(_product);
                db.SaveChanges();
                UpdateAllLists();
                return;
            }
            if (_mode == "edit" && _exitMode == "delete")
            {
                db.ProductMaterials.AddRange(deletedProductMaterials);
                db.ProductMaterials.RemoveRange(newProductMaterials);
                db.SaveChanges();
                UpdateAllLists();
                return;
            }
            UpdateAllLists();
            db.SaveChanges();
        }
        private void DeleteMaterialMnItem_Click(object sender, RoutedEventArgs e)
        {
            DeleteMaterial();
        }
        private void DeleteMaterial()
        {
            var selectedProductMaterial = MaterialsDGrid.SelectedItem as ProductMaterial;
            if (!IsExists(selectedProductMaterial))
                return;
            deletedProductMaterials.Add(selectedProductMaterial);
            db.ProductMaterials.Remove(selectedProductMaterial);
            db.SaveChanges();
            UpdateAllLists();
        }
        private void IncreaseCountMnItem_Click(object sender, RoutedEventArgs e)
        {
            var selectedProductMaterial = MaterialsDGrid.SelectedItem as ProductMaterial;
            if (!IsExists(selectedProductMaterial))
                return;
            selectedProductMaterial.Count++;
            //var a = db.ProductMaterials.Where(x => x.ProductId == selectedProductMaterial.ProductId && x.MaterialId == selectedProductMaterial.MaterialId).FirstOrDefault();
            //a.Count++;
            db.SaveChanges();
            UpdateAllLists();
        }

        private void DecreaseCountMnItem_Click(object sender, RoutedEventArgs e)
        {
            var selectedProductMaterial = MaterialsDGrid.SelectedItem as ProductMaterial;
            if (!IsExists(selectedProductMaterial))
                return;
                selectedProductMaterial.Count--;
                if (selectedProductMaterial.Count <= 0)
                    DeleteMaterial();
                db.SaveChanges();
                UpdateAllLists();
        }
        private bool IsExists(ProductMaterial pm)
        {
            if (pm != null)
                return true;
            MessageBox.Show("Материал не выбран!", "Material not found", MessageBoxButton.OK, MessageBoxImage.Warning);
            return false;
        }
        private bool IsExists(Material m)
        {
            if (m != null)
                return true;
            MessageBox.Show("Материал не выбран!", "Material not found", MessageBoxButton.OK, MessageBoxImage.Warning);
            return false;
        }
    }
}
