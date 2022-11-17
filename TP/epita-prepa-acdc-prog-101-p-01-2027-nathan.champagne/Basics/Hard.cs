using System;

namespace Basics
{
    public class Hard
    {
        /// <summary>
        /// Decode a binary in a string into its decimal representation
        /// </summary>
        /// <param name="s">String holding the binary</param>
        /// <returns>An int corresponding to the decimal representation of the
        /// binary</returns>

        public static int DecodeBinary(string s)
        {
            int number = 0;
            int sign = 1;
            int k = 0;

            if (s.Length == 0)
                return 0;
            
            if (s[0] == '-')
            {
                sign = -1;
                k = 1;
                if (s.Length == 1)
                    return -1;
            }

            for(int i = k; i < s.Length; i++)
            {
                int dig = s[i]-48;
                if (dig < 0 || dig > 1)
                    return -1;
                number = number * 2 + dig;
            }

            return number*sign;
        }

        /// <summary>
        /// Encode a decimal in binary
        /// </summary>
        /// <param name="n">An int that we want to convert in binary</param>
        /// <returns>A string holding the binary representation of n</returns>
        public static string EncodeBinary(int n)
        {
            if(n<0)
                return "-"+EncodeBinary(-n);
            if (n == 0)
                return "0";
            else
            {
                string[] tab = {"0", "1"};

                if (n / 2 == 0)
                    return tab[n%2];
                return EncodeBinary(n / 2) + tab[n%2];
            }
        }

        /// <summary>
        ///Decode a number written in octal in a string into its decimal representation
        /// </summary>
        /// <param name="s">String holding the octal</param>
        /// <returns>An int corresponding to the decimal representation of the octal</returns>
        public static int DecodeOctal(string s)
        {
            int number = 0;
            int sign = 1;
            int k = 0;

            if (s.Length == 0)
                return 0;
            
            if (s[0] == '-')
            {
                sign = -1;
                k = 1;
                if (s.Length == 1)
                    return -1;
            }

            for(int i = k; i < s.Length; i++)
            {
                int dig = s[i] - 48;
                if (dig < 0 || dig > 7)
                    return -1;
                number = number * 8 + dig;
            }

            return number*sign;
        }

        /// <summary>
        /// Encode a decimal in octal
        /// </summary>
        /// <param name="n">An int that we want to convert in octal</param>
        /// <returns>A string holding the octal representation of n</returns>
        public static string EncodeOctal(int n)
        {
            if(n<0)
                return "-"+EncodeOctal(-n);
            if (n == 0)
                return "0";
            else
            {
                string[] tab = {"0", "1","2","3","4","5","6","7"};

                if (n / 8 == 0)
                    return tab[n%8];
                return EncodeOctal(n / 8) + tab[n%8];
            }
        }
        
        /// <summary>
        ///Decode a number written in hexadecimal in a string into its decimal representation
        /// </summary>
        /// <param name="s">String holding the hexadecimal</param>
        /// <returns>An int corresponding to the decimal representation of the hexadecimal</returns>
        public static int DecodeHexa(string s)
        {
            int number = 0;
            int sign = 1;
            int k = 0;

            if (s.Length == 0)
                return 0;
            
            if (s[0] == '-')
            {
                sign = -1;
                k = 1;
                if (s.Length == 1)
                    return -1;
            }
            
            for(int i = k; i < s.Length; i++)
            {
                int dig = -1;
                if('0'<=s[i] && s[i]<'9')
                    dig = s[i]-48;
                else if ('a'<=s[i] && s[i]<='f')
                    dig = s[i]-97+10;
                else if ('A' <= s[i] && s[i] <= 'F')
                    dig = s[i]-65+10;
                else
                    return -1;
                number = number * 16 + dig;
            }

            return number*sign;
        }

        /// <summary>
        /// Encode a decimal in hexadecimal
        /// </summary>
        /// <param name="n">An int that we want to convert in hexadecimal</param>
        /// <returns>A string holding the hexadecimal representation of n</returns>
        public static string EncodeHexa(int n)
        {
            if(n<0)
                return "-"+EncodeHexa(-n);
            if (n == 0)
                return "0";
            else
            {
                string[] tab = {"0", "1","2","3","4","5","6","7", "8", "9", "A", "B", "C", "D", "E", "F"};

                if (n / 16 == 0)
                    return tab[n%16];
                return EncodeHexa(n / 16) + tab[n%16];
            }
        }
    }
}