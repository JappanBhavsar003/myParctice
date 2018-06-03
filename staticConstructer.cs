using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    public abstract class staticParent
    {
        public int i { get; set; }

        public staticParent()
        {
            Console.Write("HEllo i am paret construcyte");
        }
    }


    public class staticConstructer : staticParent
    {
        public static int a = 10;

        static staticConstructer()
        {
            // static constructor only access the static member of that class
            a = 80;
            Console.Write("Hey i am static constructer and i am only one time called \n " +
                "It doesn't metter how many times object is initialized.");            
        }
    }
}
