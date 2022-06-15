using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Agent.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int? ProductTypeId { get; set; }
        public string ArticleNumber { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public int? ProductionPersonCount { get; set; }
        public int? ProductionWorkshopNumber { get; set; }
        public decimal MinCostForAgent { get; set; }
        public ProductType ProductType { get; set; }
        public decimal? Cost 
        {
            get => ProductMaterials.Sum(x => x.Material.Cost);
        }
        public ICollection<ProductMaterial> ProductMaterials { get; set; }
        public ICollection<ProductCostHistory> ProductCostHistories { get; set; }

        public Product(
            int id,
            string title,
            int productTypeId,
            string articleNumber,
            string description,
            string image,
            int productionPersonCount,
            int productionWorkshopNumber,
            decimal minCostForAgent,
            ProductType productType,
            decimal? cost
            )
        {
            Id = id;
            Title = title;
            ProductTypeId = productTypeId;
            ArticleNumber = articleNumber;
            Description = description;
            Image = image;
            ProductionPersonCount = productionPersonCount;
            ProductionWorkshopNumber = productionWorkshopNumber;
            MinCostForAgent = minCostForAgent;
            ProductType = productType;
        }
        public Product()
        {

        }

    }

}
