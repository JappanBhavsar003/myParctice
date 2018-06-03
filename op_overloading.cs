using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    class op_overloading
    {
       
    }

    class box
    {
        public int width { get; set; }
        public int height { get; set; }
        public int length { get; set; }

        public static box operator+(box b, box c)
        {
            box new_box = new box();
            new_box.length = b.length + c.length;
            new_box.width = b.width + c.width;
            new_box.height = b.height + c.height;
            return new_box;
        }

    }
}
