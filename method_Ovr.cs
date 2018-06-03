using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    class BC
    {
        public void print()
        {
            Console.WriteLine("BC Method calls");
        }
    }

    class DC : BC
    {
        public void print()
        {
            Console.Write("DC Method calls");
        }

    }

    class abc
    {
        public virtual void print()
        {            
            Console.Write("abc called\n");
        }
    }

    class def : abc
    {
        public override void print()
        {
            base.print();
            Console.Write("def Called\n");
        }
    }

    class efg : def
    {
        public override void print()
        {
            base.print();
            Console.Write("EFG called\n");
        }
    }

        
    class method_Ovr
    {

    }
}
