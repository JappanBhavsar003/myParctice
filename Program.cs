using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CsharpParc
{
    class Program
    {
        public static void FolderNames(string xml, char startingLetter)
        {
            
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xml);
            
        }

        public class TextInput
        {

            public string str { get; set; }

            public virtual void Add(char c)
            {
                this.str = this.str + c;
            }

            public TextInput()
            {
                this.str = "";
            }

            public string GetValue()
            {
                return this.str;
            }
        }

        public class NumericInput : TextInput
        {
            public override void Add(char c)
            {
                if (IsCharDigit(c))
                {
                    str = str + c;
                }
            }
        }

        public static bool IsCharDigit(char c)
        {
            return ((c >= '0') && (c <= '9'));
        }

        public static bool IsPalindrome(string word)
        {
            char[] array = word.ToCharArray();
            string temp = "";

            for (int i = array.Count(); i > 0; i--)
            {
                temp = temp + array[i - 1].ToString();
            }

            if (word.ToLower() == temp.ToLower())
            {
                return true;
            }
            else {
                return false;
            }
        }
        
        static void Main(string[] args)
        {
            // When we create any data type to system.object method then clr convert this data type to object's method and this it is stored in server's heap area as system.object object datatype 
            // It can be done implicitly
            int i = 1111;
            Object o = i;
            //Console.WriteLine(o);

            // When we create an sysrem.object type datatype and stored a value in it than we have convert to speciific datatype like string or integer then we have to do unboxing.
            // when we are doiing unboxing we need to do it explicitly like using type converting
            object o1 = "Jappan";
            string s1 = (string)o1;
            //Console.Write(s1);

            TextInput input = new NumericInput();
            input.Add('1');
            input.Add('a');
            input.Add('0');
            Console.WriteLine(input.GetValue());


            Console.WriteLine(IsPalindrome("Deleveled"));

            // XML
            string xml =
            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
            "<folder name=\"c\">" +
                "<folder name=\"program files\">" +
                    "<folder name=\"uninstall information\" />" +
                "</folder>" +
                "<folder name=\"users\" />" +
            "</folder>";

            //foreach (string name in FolderNames(xml, 'u'))
            //{
            //    Console.WriteLine(name);
            //}

            // c# prooperties example
            Test1 test = new Test1();
            test.hours = 22;
            //Console.WriteLine($"Time : {test.hours}");
            //test.print();

            // Abstraction method
            employee e1 = new employee();
            e1.address = "Krishannangar";
            e1.isManagement = true;
            e1.name = "Jappan bhavsar";
            e1.userID = 0;

            Console.WriteLine($"name is {e1.name} and their id is {e1.userID} and thier address is  {e1.address} " +
                                    $"and he is {e1.isManagement}");

            // Abstraction Method example
            derivedClass d1 = new derivedClass();
            d1.abstractMethod();
            Console.Write($"x = {d1.x} and y {d1.y}");

            // Indexer example
            Indexer1 ind = new Indexer1();
            ind[0] = "Jappan";
            ind[1] = "tanvi";
            ind[2] = "neel";
            ind[3] = "krishna";
            ind[4] = "karzari";

            foreach(string str in ind.getString())
            {
                Console.Write("string is " + str +"\n\r");
            }

            // Static constructer
            staticConstructer sc = new staticConstructer();
            staticConstructer sc2 = new staticConstructer();

            // Interface use
            interfaceImplememnter imp1 = new interfaceImplememnter();
            imp1.print();

            interfaceImp1 imp2 = new interfaceImp1();
            imp2.print();


            // Method Overridding
            abc a = new abc();
            a.print();

            def d = new def();
            d.print();

            efg e = new efg();
            e.print();


            // Opearator Overloading
            box b1 = new box();
            b1.length = 10;
            b1.width= 20;
            b1.height = 30;

            box b2 = new box();
            b2.width = 90;
            b2.length = 80;
            b2.height = 70;

            box b3 = new box();
            b3 = b1 + b2;

            Console.WriteLine($"Box 3 has length of {b3.length} , and width of {b3.width} and the height of {b3.height}");

            Console.ReadKey();

        }

        public enum e1
        {
            jannat = 1,
            jannat2 = 2
        }
    }
}
