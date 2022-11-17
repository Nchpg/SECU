using System;
using NUnit.Framework;
using Basics;

namespace TestSuite
{
    
    [TestFixture]
    public class MyGodAge
    {
        [Test]
        public static void MyGodAge20()
        {
            Assert.AreEqual(230, Core.MyGodAge(20, "Cyril"));
        }

        [Test]
        public static void MyGodAge30()
        {
            Assert.AreEqual(294, Core.MyGodAge(42, "Hermes"));
        }

        [Test]
        public static void MyGodAgeEmpty()
        {
            Assert.AreEqual(-1, Core.MyGodAge(42, ""));
        }
        
        [Test]
        public static void MyGodAgeNegative()
        {
            Assert.AreEqual(-1, Core.MyGodAge(-1, ""));
        }
        
        [Test]
        public static void MyGodAgeNull()
        {
            Assert.AreEqual(-1, Core.MyGodAge(0, ""));
        }
        
    }
    
    [TestFixture]
    public class MyPow
    {
        [Test]
        public void MyPow100()
        {
            Assert.AreEqual(100, Core.MyPow(10, 2));
        }

        [Test]
        public void MyPow420()
        {
            Assert.AreEqual(1, Core.MyPow(42, 0));
        }
        
        [Test]
        public void MyPowMinus()
        {
            Assert.AreEqual(0.25, Core.MyPow(2, -2));
        }
        
        [Test]
        public void MyPow00()
        {
            Assert.AreEqual(1, Core.MyPow(0, 0));
        }
        
        [Test]
        public void MyPow02()
        {
            Assert.AreEqual(0, Core.MyPow(0, 2));
        }
        
        [Test]
        public void MyPow2minus0()
        {
            Assert.AreEqual(1, Core.MyPow(2, -0));
        }
        


    }
    
    [TestFixture]
    public class Facto
    {
        [Test]
        public static void Facto0()
        {
            Assert.AreEqual(1, Core.Facto(0));
        }
        
        [Test]
        public static void Facto2()
        {
            Assert.AreEqual(2, Core.Facto(2));
        }

        [Test]
        public static void Facto7()
        {
            Assert.AreEqual(5040, Core.Facto(7));
        }
        
        [Test]
        public static void FactoNegative()
        {
            Assert.AreEqual(-1, Core.Facto(-42));
        }

        [Test]
        public static void Facto1()
        {
            Assert.AreEqual(1, Core.Facto(1));
        }

    }
    
    [TestFixture]
    public class Fibo
    {
        [Test]
        public static void Fibo0()
        {
            Assert.AreEqual(0, Core.Fibo(0));
        }
        
        [Test]
        public static void Fibo1()
        {
            Assert.AreEqual(1, Core.Fibo(1));
        }

        [Test]
        public static void Fibo2()
        {
            Assert.AreEqual(1, Core.Fibo(2));
        }
        
        [Test]
        public static void Fibo10()
        {
            Assert.AreEqual(55, Core.Fibo(10));
        }
        
        [Test]
        public static void FiboNegative()
        {
            Assert.AreEqual(-1, Core.Fibo(-42));
        }
        

    }
    
    [TestFixture]
    public class DebugMe1
    {
        [Test]
        public static void DebugMe1_42()
        {
            Assert.AreEqual(6, Core.DebugMe1(42));
        }
        
        [Test]
        public static void DebugMe1_123456789()
        {
            Assert.AreEqual(45, Core.DebugMe1(123456789));
        }

        [Test]
        public static void DebugMe1_6()
        {
            Assert.AreEqual(6, Core.DebugMe1(6));
        }
        
        [Test]
        public static void DebugMe1_987654321()
        {
            Assert.AreEqual(45, Core.DebugMe1(987654321));
        }
        
        [Test]
        public static void DebugMe1_0()
        {
            Assert.AreEqual(0, Core.DebugMe1(0));
        }
        

    }
    
    [TestFixture]
    public class DebugMe2
    {
        [Test]
        public static void DebugMe2_6()
        {
            Assert.AreEqual(6, Core.DebugMe2(6));
        }
        
        [Test]
        public static void DebugMe2_123456789()
        {
            Assert.AreEqual(-1513215762, Core.DebugMe2(123456789));
        }

        [Test]
        public static void DebugMe2_2()
        {
            Assert.AreEqual(0, Core.DebugMe2(2));
        }
        
        [Test]
        public static void DebugMe2_0()
        {
            Assert.AreEqual(0, Core.DebugMe2(0));
        }
        

    }
    
    [TestFixture]
    public class isPrime
    {
        [Test]
        public static void isPrime_1()
        {
            Assert.AreEqual(false, Core.IsPrime(1));
        }
        
        [Test]
        public static void isPrime_2()
        {
            Assert.AreEqual(true, Core.IsPrime(2));
        }

        [Test]
        public static void isPrime_22091()
        {
            Assert.AreEqual(true, Core.IsPrime(22091));
        }

        [Test]
        public static void isPrime_25()
        {
            Assert.AreEqual(false, Core.IsPrime(25));
        }
        

    }
    
}