using System;
using NUnit.Framework;
using Basics;

namespace TestSuite
{
    [TestFixture]
    public class Atoi
    {
        [Test]
        public static void Atoi_42()
        {
            Assert.AreEqual(42, Advanced.Atoi("42"));
        }
        
        [Test]
        public static void Atoi_minus42()
        {
            Assert.AreEqual(-42, Advanced.Atoi("-42"));
        }
    }
    
    [TestFixture]
    public class Itoa
    {
        [Test]
        public static void Itoa_24()
        {
            Assert.AreEqual("24", Advanced.Itoa(24));
        }
        
        [Test]
        public static void Itoa_minus5()
        {
            Assert.AreEqual("-5", Advanced.Itoa(-5));
        }
    }
}