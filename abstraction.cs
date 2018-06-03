using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpParc
{
    public abstract class user_Common
    {
        public int userID { get; set; }
        public string name { get; set; }
        public string address { get; set; }
    }

    public class employee : user_Common
    {
        public bool isManagement { get; set; }
    }

    public class student : user_Common
    {
        public string class_Name { get; set; }
        public string roll_No { get; set; }
    }

    class abstraction
    {


    }
}
