using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    abstract class baseclass1
    {
        protected int _x = 100;
        protected int _y = 200;
        public abstract void abstractMethod();
        public abstract int x { get; }
        public abstract int y { get; }
    }

    class derivedClass : baseclass1
    {
        public override void abstractMethod()
        {
            _x++;
            _y++;
        }


        public override int x   // overriding property
        {
            get
            {
                return _x + 50;
            }
        }

        public override int y   // overriding property
        {
            get
            {
                return _y + 10;
            }
        }
    }

    class abstraction2
    {
    }
}
