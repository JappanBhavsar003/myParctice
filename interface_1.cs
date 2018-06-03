using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    public interface interface_1
    {
        void print();
    }

    public interface inteface_2
    {
        void print();
    }

    class interfaceImplememnter : interface_1, inteface_2
    {
        public void print()
        {
            Console.Write("Hello this is first object which are mplement the print method on its way!\n");
        }
    }

    class interfaceImp1 : interface_1, inteface_2
    {
        public void print()
        {
            Console.Write("This is second class which emplement print method on its way!\n");
        }
    }
}
