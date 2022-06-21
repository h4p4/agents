using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Agent.Models;
using Microsoft.EntityFrameworkCore;
namespace Agent
{
    public partial class MainWindow : Window
    {
        public static AgentContext agentContext = new AgentContext();
        static int shift = 20;
        int pageStart = 0;
        int pageEnd = shift;
        IQueryable<Product>? list;
        public MainWindow()
        {
            InitializeComponent();
            var types = agentContext.ProductTypes.ToList();
            types.Insert(0, new ProductType { Title = "--Фильтрация--" });
            FilterCBox.ItemsSource = types;
            FilterCBox.SelectedIndex = 0;
            list = ListFill();
            ProductsList.ItemsSource = MakeGap().ToList();
            agentContext.Database.EnsureCreated();
        }
        private void SearchTBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Handle();
        }
        private void SortCBox_DropDownClosed(object sender, EventArgs e)
        {
            Handle();
        }
        private void SortCBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Handle();
        }
        private void FilterCBox_DropDownClosed(object sender, EventArgs e)
        {
            Handle();
        }
        private void FilterCBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Handle();
        }
        private void PreviousBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(-1, list != null && pageStart >= 5);
        }
        private void NextBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(1, list != null && pageEnd < list.Count());
        }
        private void Handle()
        {
            pageStart = 0;
            pageEnd = shift;
            list = ListFill();
            if (!String.IsNullOrWhiteSpace(SearchTBox.Text))
                list = list.Where(x => x.Title.Contains(SearchTBox.Text));
            if (FilterCBox != null && FilterCBox.SelectedIndex != 0)
                list = list.Where(x => x.ProductType == FilterCBox.SelectedItem);
            if (SortCBox != null && SortCBox.SelectedIndex != 0)
                switch (SortCBox.SelectedItem.ToString().Split(new string[] { ": " }, StringSplitOptions.None).Last())
                {
                    case "По возрастанию (Наименование)":
                        list = list.OrderBy(x => x.Title);
                        break;
                    case "По убыванию (Наименование)":
                        list = list.OrderByDescending(x => x.Title);
                        break;
                    case "По возрастанию (Номер цеха)":
                        list = list.OrderBy(x => x.ProductionWorkshopNumber);
                        break;
                    case "По убыванию (Номер цеха)":
                        list = list.OrderByDescending(x => x.ProductionWorkshopNumber);
                        break;
                    case "По возрастанию (Стоимость)":
                        list = list.ToList().OrderBy(x => x.Cost).AsQueryable();
                        break;
                    case "По убыванию (Стоимость)":
                        list = list.ToList().OrderByDescending(x => x.Cost).AsQueryable();
                        break;
                }
            if (ProductsList != null && list != null) // если не пустой и текст нашелся
                ProductsList.ItemsSource = MakeGap().ToList();
        }

        private void ChangePage(int a, bool condition)
        {
            if (condition)
            {
                pageEnd += shift * a;
                pageStart += shift * a;
                ProductsList.ItemsSource = MakeGap().ToList();
            }
        }
        private IQueryable<Product>? ListFill()
        {
            return agentContext.Products.Include(x => x.ProductType).Include(x => x.ProductMaterials).ThenInclude(x => x.Material);
        }
        private IQueryable<Product> MakeGap()
        {
            return list.Take(pageEnd).Skip(pageStart);
        }

        private void DeleteMenuItem_Click(object sender, RoutedEventArgs e)
        {
            var productForDelete = ProductsList.SelectedItem as Product;
            agentContext.Products.Remove(productForDelete);
            agentContext.SaveChanges();
            Handle();
        }

        private void EditMenuItem_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

