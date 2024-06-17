using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowRepairApp.Entities
{
    public partial class OrderService
    {
        public int Total
        {
            get
            {

                return (int)(Service.Price * Count);
            }
        }
    }
}