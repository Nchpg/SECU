using System;

namespace Basics
{
    public class Core
    {
        /// <summary>
        /// This function must write in the console "Hello Olympus!" Followed by a new line
        /// </summary>
        public static void HelloGods()
        {
            Console.WriteLine("Hello Olympus!");
        }
        
        
        
        /// <summary>
        /// This function return the addition of your age and the number of letter in your name
        /// multiplied by 42.
        /// </summary>
        /// <param name="age">Your age</param>
        /// <param name="name">Your name</param>
        /// <returns>An int corresponding to your age if you were a god</returns>
        public static int MyGodAge(int age, string name)
        {
            if (age < 0 || name.Length == 0)
                return -1;
            return age + 42 * name.Length;
        }

        /// <summary>
        /// Your own implementation of x power n.
        /// </summary>
        /// <param name="x">The number that will be powered</param>
        /// <param name="n">The power wanted</param>
        /// <returns>A double corresponding to the x powered by n </returns>
        public static double MyPow(double x, int n)
        {
            double res = 1;
            if (n < 0)
            {
                res = 1 / (MyPow(x, -n));
                if (Double.IsNormal(res))
                    return res;
                return -1;
            }
            
            while (n != 0)
            {
                res *= x;
                n--;
            }
            
            return res;
            
        }
        
        /// <summary>
        /// Factorial of n.
        /// </summary>
        /// <param name="n">Number of the factorial</param>
        /// <returns>An int corresponding to the factorial of n</returns>
        public static int Facto(int n)
        {
            if (n < 0)
                return -1;
            if (n == 0)
                return 1;
            int res = n * Facto(n - 1);
            if (res == 0)
                return -1;
            return res;
        }

        /// <summary>
        /// Fibonacci sequence of n.
        /// </summary>
        /// <param name="n">Term of the fibonacci wanted</param>
        /// <returns>An int corresponding to the n-th term of the fibonacci sequence</returns>
        public static int Fibo(int n)
        {
            
            if (n < 0) 
                return -1;

            if (n == 0)
                return 0;
            
            int fib0 = 0;
            int fib1 = 1;
            int fibtmp = 0;
            
            for (uint i = 1;i < n; ++i)
            {
                fibtmp = fib0;
                fib0 = fib1;
                fib1 = fibtmp + fib1;
            }
            return fib1;
        }
        
        ///<summary>
        ///Try to understand what this function is supposed to do, and debug it !
        ///</summary>
        public static uint DebugMe1(uint x)
        {
            uint result = 0;
            for (uint i = x; x > 0; x /= 10)
            {
                result += x % 10;
            }
            return result;
        }

        ///<summary>
        ///Try to understand what this function is supposed to do, and debug it !
        /// </summary>
        public static int DebugMe2(int x)
        {
            int i = 1;
            int result = 0;
            while (i < x)
            {
                if (i % 2 == 0)
                {
                    result += i;
                }
                i += 1;
            }
            return result;
        }
        
        /// <summary>
        /// Determine if a number is prime or not.
        /// </summary>
        /// <param name="n">Number that we want to determine verify its primeness</param>
        /// <returns>A boolean that is true if n is prime</returns>
        public static bool IsPrime(uint n)
        {
            if (n < 2)
                return false;
            
            uint i = 2;
            while (i * i <= n)
            {
                if (n % i == 0)
                    return false;
                i += 1;
            }

            return true;
        }

        /// <summary>
        /// Ask for a number and print in the console if the number is prime or not
        /// </summary>
        public static void AskPrime()
        {
            Console.WriteLine("What's your number?");
            string input = Console.ReadLine();
            uint number = Convert.ToUInt32(input);

            if (IsPrime(number))
                Console.WriteLine("Yes, {0} is a prime number.", number);
            else
                Console.WriteLine("No, {0} is not a prime number.", number);
        }
    }
}