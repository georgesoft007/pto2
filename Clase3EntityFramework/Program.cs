using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clase3EntityFramework
{
    class Program
    {
        static void Main(string[] args)
        {
            TiendaWebDatabase db = new TiendaWebDatabase();
            Categories category = new Categories();
            category.Name = "Ferreteria";
            db.Categories.Add(category);
            Products producto = new Products();
            producto.Name = "Martillo";
            producto.Price = 30;
            producto.Categories.Add(category);
            category.Products.Add(producto);
            db.SaveChanges();

        }
    }
}
