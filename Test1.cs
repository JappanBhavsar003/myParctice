using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    class Test1
    {
        private double seconds { get; set; }

        public double  hours
        {
            get
            {
                return seconds / 3600;
            }
            set
            {
                if(value < 0 || value > 24)
                {
                    throw new ArgumentOutOfRangeException($"{nameof(value)} must be between 0 and 24");
                }
                else
                {
                    seconds = value * 3600;
                }
            }
        }

        public void print()
        {
            Console.Write($"time Hours : {this.hours} and second {this.seconds}");
        }
    }
}
