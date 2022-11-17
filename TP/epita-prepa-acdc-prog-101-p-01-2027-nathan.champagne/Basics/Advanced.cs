using System;

namespace Basics
{
    public class Advanced
    {
        /// <summary>
        /// Convert an number written in a string into the corresponding int
        /// </summary>
        /// <param name="num">String of the number</param>
        /// <returns>An int of the number contained in the string</returns>

        public static int Atoi(string num)
        {
            int number = 0;
            int sign = 1;

            if (num.Length == 0)
                return -1;
            
            if (num[0] == '-')
            {
                sign = -1;
                if (num.Length == 1)
                    return -1;
            }

            int k = 0;
            if (sign == -1) 
                k = 1;

            for (int i = k; i <= num.Length - 1; ++i)
            {
                char[] tab = {'0', '1','2','3','4','5','6','7','8','9'};
                // int dig = Array.IndexOf(tab, num[i]);
                int dig = num[i] - 48;
                if (dig<10 && dig>=0)
                {
                    number = number * 10 + dig;
                }
                else
                    return -1;
            }

            return number*sign;
        }

        /// <summary>
        /// Convert an int into its string representation 
        /// </summary>
        /// <param name="n">Int that we want to convert</param>
        /// <returns>A string representation of n</returns>
        public static string Itoa(int n)
        {
            string[] tab = {"0", "1","2","3","4","5","6","7", "8", "9"};
            
            if (n < 0)
                return "-" + Itoa(-n);
            if (n/10 == 0)
                return tab[n%10];
            return Itoa(n / 10) + tab[n%10];
        }
    }
}