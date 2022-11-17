using System;
using NUnit.Framework;
using Basics;

namespace TestSuite
{
    [TestFixture]
    public class DecodeBinary
    {  
        [Test]
        public static void Decode_Empty()
        {
            Assert.AreEqual(0, Hard.DecodeBinary(""));
        }
        
        [Test]
        public static void Decode_1()
        {
            Assert.AreEqual(1, Hard.DecodeBinary("1"));
        }
        
        [Test]
        public static void Decode_10()
        {
            Assert.AreEqual(2, Hard.DecodeBinary("10"));
        }
        
        [Test]
        public static void Decode_101111101111100101000()
        {
            Assert.AreEqual(1564456, Hard.DecodeBinary("101111101111100101000"));
        }
        
        [Test]
        public static void Decode_101010()
        {
            Assert.AreEqual(42, Hard.DecodeBinary("101010"));
        }
        
        [Test]
        public static void Decode_minus101010()
        {
            Assert.AreEqual(-42, Hard.DecodeBinary("-101010"));
        }
    }
    
    [TestFixture]
    public class EncodeBinary
    {
        [Test]
        public static void Encode_0()
        {
            Assert.AreEqual("0", Hard.EncodeBinary(0));
        }
        
        [Test]
        public static void Encode_1()
        {
            Assert.AreEqual("1", Hard.EncodeBinary(1));
        }
        
        [Test]
        public static void Encode_2()
        {
            Assert.AreEqual("10", Hard.EncodeBinary(2));
        }
        
        [Test]
        public static void Encode_1564456()
        {
            Assert.AreEqual("101111101111100101000", Hard.EncodeBinary(1564456));
        }
        
        [Test]
        public static void Encode_minus1564456()
        {
            Assert.AreEqual("-101111101111100101000", Hard.EncodeBinary(-1564456));
        }
    }
    
    [TestFixture]
    public class DecodeOctal
    {
        [Test]
        public static void Decode_Empty()
        {
            Assert.AreEqual(0, Hard.DecodeOctal(""));
        }
        
        [Test]
        public static void Decode_1()
        {
            Assert.AreEqual(1, Hard.DecodeOctal("1"));
        }
        
        [Test]
        public static void Decode_10()
        {
            Assert.AreEqual(8, Hard.DecodeOctal("10"));
        }
        
        [Test]
        public static void Decode_42()
        {
            Assert.AreEqual(34, Hard.DecodeOctal("42"));
        }
        
        [Test]
        public static void Decode_minus42()
        {
            Assert.AreEqual(-34, Hard.DecodeOctal("-42"));
        }
    }
    
    [TestFixture]
    public class EncodeOctal
    {
        [Test]
        public static void Encode_0()
        {
            Assert.AreEqual("0", Hard.EncodeOctal(0));
        }
        
        [Test]
        public static void Encode_1()
        {
            Assert.AreEqual("1", Hard.EncodeOctal(1));
        }
        
        [Test]
        public static void Encode_10()
        {
            Assert.AreEqual("12", Hard.EncodeOctal(10));
        }
        
        [Test]
        public static void Encode_42()
        {
            Assert.AreEqual("52", Hard.EncodeOctal(42));
        }
        
        [Test]
        public static void Encode_minus42()
        {
            Assert.AreEqual("-52", Hard.EncodeOctal(-42));
        }
    }
    
    [TestFixture]
    public class DecodeHexa
    {
        [Test]
        public static void Decode_Empty()
        {
            Assert.AreEqual(0, Hard.DecodeHexa(""));
        }
        
        [Test]
        public static void Decode_1()
        {
            Assert.AreEqual(1, Hard.DecodeHexa("1"));
        }
        
        [Test]
        public static void Decode_10()
        {
            Assert.AreEqual(16, Hard.DecodeHexa("10"));
        }
        
        [Test]
        public static void Decode_42()
        {
            Assert.AreEqual(66, Hard.DecodeHexa("42"));
        }
        
        [Test]
        public static void Decode_minus42()
        {
            Assert.AreEqual(-66, Hard.DecodeHexa("-42"));
        }
    }
    
    [TestFixture]
    public class EncodeHexa
    {
        [Test]
        public static void Encode_0()
        {
            Assert.AreEqual("0", Hard.EncodeHexa(0));
        }
        
        [Test]
        public static void Encode_1()
        {
            Assert.AreEqual("1", Hard.EncodeHexa(1));
        }
        
        [Test]
        public static void Encode_10()
        {
            Assert.AreEqual("A", Hard.EncodeHexa(10));
        }
        
        [Test]
        public static void Encode_42()
        {
            Assert.AreEqual("2A", Hard.EncodeHexa(42));
        }
        
        [Test]
        public static void Encode_minus42()
        {
            Assert.AreEqual("-2A", Hard.EncodeHexa(-42));
        }
    }
}