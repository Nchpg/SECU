using System;
using NUnit.Framework;
using Basics;

namespace TestSuite
{
    [TestFixture]
    public class DebugMe3
    {
        [Test]
        public static void DebugMe_13()
        {
            Assert.AreEqual(6, Intermediate.DebugMe3(13));
        }
        
        [Test]
        public static void DebugMe_1()
        {
            Assert.AreEqual(0, Intermediate.DebugMe3(1));
        }
        
        [Test]
        public static void DebugMe_4096()
        {
            Assert.AreEqual(564, Intermediate.DebugMe3(4096));
        }
        
        [Test]
        public static void DebugMe_2()
        {
            Assert.AreEqual(1, Intermediate.DebugMe3(2));
        }
    }
    
    [TestFixture]
    public class DivisorSum
    {
        [Test]
        public static void DivisorSum_1()
        {
            Assert.AreEqual(0, Intermediate.DivisorSum(1));
        }
        
        [Test]
        public static void DivisorSum_2()
        {
            Assert.AreEqual(1, Intermediate.DivisorSum(2));
        }
        
        [Test]
        public static void DivisorSum_6()
        {
            Assert.AreEqual(6, Intermediate.DivisorSum(6));
        }
        
        [Test]
        public static void DivisorSum_42()
        {
            Assert.AreEqual(54, Intermediate.DivisorSum(42));
        }
    }
    
    [TestFixture]
    public class SplitString
    {
        [Test]
        public static void SplitString_4()
        {
            Assert.AreEqual(("Hello", " Olympus"), Intermediate.SplitString("Hello Olympus", 4));
        }
        
        [Test]
        public static void SplitString_3()
        {
            Assert.AreEqual(("Hell", "o Olympus"), Intermediate.SplitString("Hello Olympus", 3));
        }
        
        [Test]
        public static void SplitString_3_2()
        {
            Assert.AreEqual(("Eros", ""), Intermediate.SplitString("Eros", 3));
        }
    }
}