using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    class Indexer1
    {
        private string[] range = new string[5];
        public string this[int indexer]
        {
            get
            {
                return range[indexer];
            }
            set
            {
                range[indexer] = value;
            }
        }

        public string[] getString()
        {
            return this.range;
        }
    }
}
