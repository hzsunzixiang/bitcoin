

# 已验证完毕
# compute the hash of a nowitness trasaction
#相对应的源码
# interpreter.cpp 中的函数 SignatureHash

      # 这里是两个vin
      #"txid": "ac10821d2b7313208e8328e1aa852e28b76926b340d7d0563e02ede83f924307",
      #"txid": "826ef8fbd1bdf66b557018df18f81f561b21a12aed0aa42012b8574390134404",




$2 = (const CTransaction &) @0x7feb30791fa0: {static CURRENT_VERSION = 0x2, static MAX_STANDARD_VERSION = 0x2,
  vin = std::vector of length 2, capacity 2 = {{prevout = {hash = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0x4,
              0x44, 0x13, 0x90, 0x43, 0x57, 0xb8, 0x12, 0x20, 0xa4, 0xa, 0xed, 0x2a, 0xa1, 0x21, 0x1b, 0x56, 0x1f, 0xf8, 0x18,
              0xdf, 0x18, 0x70, 0x55, 0x6b, 0xf6, 0xbd, 0xd1, 0xfb, 0xf8, 0x6e, 0x82}}, <No data fields>}, n = 0x0},
      scriptSig = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x0, _union = {direct = {0x10, 0x65, 0x0,
              0x4, 0xeb, 0x7f, 0x0, 0x0, 0x90, 0x7e, 0x0, 0x4, 0xeb, 0x7f, 0x0, 0x0, 0x90, 0x7d, 0x0, 0x4, 0xeb, 0x7f, 0x0,
              0x0, 0xd0, 0x6a, 0xa8, 0x38}, {capacity = 0x4006510, indirect = 0x4007e9000007feb}}}, <No data fields>},
      nSequence = 0xffffffff, scriptWitness = {stack = std::vector of length 0, capacity 0},
      static SEQUENCE_FINAL = 0xffffffff, static SEQUENCE_LOCKTIME_DISABLE_FLAG = 0x80000000,
      static SEQUENCE_LOCKTIME_TYPE_FLAG = 0x400000, static SEQUENCE_LOCKTIME_MASK = 0xffff,
      static SEQUENCE_LOCKTIME_GRANULARITY = 0x9}, {prevout = {hash = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0x7,
              0x43, 0x92, 0x3f, 0xe8, 0xed, 0x2, 0x3e, 0x56, 0xd0, 0xd7, 0x40, 0xb3, 0x26, 0x69, 0xb7, 0x28, 0x2e, 0x85, 0xaa,
              0xe1, 0x28, 0x83, 0x8e, 0x20, 0x13, 0x73, 0x2b, 0x1d, 0x82, 0x10, 0xac}}, <No data fields>}, n = 0x0},
      scriptSig = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x0, _union = {direct = {0x0, 0xc8, 0x9f,
              0x38, 0xeb, 0x7f, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x44, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
              0x80, 0x4b, 0x1, 0x4}, {capacity = 0x389fc800, indirect = 0x4000007feb}}}, <No data fields>},
      nSequence = 0xffffffff, scriptWitness = {stack = std::vector of length 0, capacity 0},
      static SEQUENCE_FINAL = 0xffffffff, static SEQUENCE_LOCKTIME_DISABLE_FLAG = 0x80000000,
      static SEQUENCE_LOCKTIME_TYPE_FLAG = 0x400000, static SEQUENCE_LOCKTIME_MASK = 0xffff,
      static SEQUENCE_LOCKTIME_GRANULARITY = 0x9}}, vout = std::vector of length 2, capacity 2 = {{nValue = 0x3beae5d0,
      scriptPubKey = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x17, _union = {direct = {0xa9, 0x14, 0x7,
              0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf, 0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82, 0x79,
              0xc8, 0x87, 0x64, 0x33, 0x30, 0x34, 0x35}, {capacity = 0x7a0714a9,
              indirect = 0x71f2af7e703d4c41}}}, <No data fields>}}, {nValue = 0x17d78400,
      scriptPubKey = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x17, _union = {direct = {0xa9, 0x14,
              0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45, 0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7,
              0x0, 0x87, 0x38, 0xeb, 0x7f, 0x0, 0x0}, {capacity = 0x986214a9,
              indirect = 0x4845309d352ba53e}}}, <No data fields>}}}, nVersion = 0x2, nLockTime = 0x0,
  hash = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0xf0, 0xda, 0xb3, 0x34, 0x7a, 0x27, 0x68, 0x8e, 0xc9, 0x6, 0x51,
        0xa1, 0x3, 0xe5, 0xca, 0x8, 0x2f, 0x7d, 0xb9, 0xcf, 0x18, 0x45, 0xd8, 0x9d, 0xc6, 0xe, 0xa5, 0xec, 0xdd, 0xb5, 0xd4,
        0xd5}}, <No data fields>}}
(gdb)



# 第一个签名

(gdb) p/x ss
$5 = {ctx = {sha = {s = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19},
      buf = {0x4, 0x44, 0x13, 0x90, 0x43, 0x57, 0xb8, 0x12, 0x20, 0xa4, 0xa, 0xed, 0x2a, 0xa1, 0x21, 0x1b, 0x56, 0x1f, 0xf8,
        0x18, 0xdf, 0x18, 0x70, 0x55, 0x6b, 0xf6, 0xbd, 0xd1, 0xfb, 0xf8, 0x6e, 0x82, 0x0, 0x0, 0x0, 0x0, 0xeb, 0x7f, 0x0,
        0x0, 0x0, 0xf3, 0x4a, 0xbf, 0xad, 0xde, 0x91, 0x19, 0xa0, 0xd, 0x79, 0x30, 0xeb, 0x7f, 0x0, 0x0, 0xdf, 0x1d, 0x6,
        0x37, 0xeb, 0x7f, 0x0, 0x0}, bytes = 0x24, static OUTPUT_SIZE = 0x20}, static OUTPUT_SIZE = 0x20}, nType = 0x4,
  nVersion = 0x0}

prevtxid1="826ef8fbd1bdf66b557018df18f81f561b21a12aed0aa42012b8574390134404"
prevtxid2="ac10821d2b7313208e8328e1aa852e28b76926b340d7d0563e02ede83f924307"

# 这是第1个vin中的 prevout 注意是逆序
044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e8200000000

# 这是第2个vin中的 prevout 逆序
0743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac00000000

# 合并起来
printf  044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e82000000000743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac00000000 | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b


#**** 得到结果 hashPrevouts  这个在所有的签名中一样
#fc32914446204621b11c5d7a3ce477bae7f542353e3b144d3a2938ae780e296a



# 序列化所有 sequence


(gdb) p/x ss
$10 = {ctx = {sha = {s = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19},
      buf = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x61, 0x64, 0x4b, 0x88, 0x30, 0x5d, 0xa5, 0x52, 0xaf, 0xd5, 0x90,
        0xf7, 0x3, 0xcc, 0xb0, 0x26, 0x31, 0x55, 0x32, 0x32, 0x4c, 0xc2, 0xa7, 0x38, 0x80, 0x0 <repeats 29 times>, 0x1, 0x0},
      bytes = 0x8, static OUTPUT_SIZE = 0x20}, static OUTPUT_SIZE = 0x20}, nType = 0x4, nVersion = 0x0}

printf  ffffffffffffffff| xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

#***** 得到 hashSequence 这个在所有的签名中也一样
# 752adad0a7b9ceca853768aebb6965eca126a62965f698a0c1bc43d83db632ad

(gdb) p/x ss
$12 = {ctx = {sha = {s = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19},
      buf = {0xd0, 0xe5, 0xea, 0x3b, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x7, 0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf,
        0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82, 0x79, 0xc8, 0x87, 0x80, 0x0 <repeats 29 times>, 0x1, 0x0},
      bytes = 0x20, static OUTPUT_SIZE = 0x20}, static OUTPUT_SIZE = 0x20}, nType = 0x4, nVersion = 0x0}

#*** 

d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c887

#这里有俩输出
#d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c887
#0084d7170000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087

# 合起来
#d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c8870084d7170000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087
# 所以计算hash 可得
printf d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c8870084d7170000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为 hashOutputs 这个在所有的签名中也一样
# a5da866ed4004689b22bd1f9a99a52c10d6a1a76686e24a3941e8bd0f9d32ad4


# ** 不一样的部分包括
#  ss << txTo.vin[nIn].prevout;
#  ss << scriptCode;
#  ss << amount;



# TODO  可以继续 把签名流程走完

(gdb) p/x hashPrevouts
$16 = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0x98, 0x7d, 0x52, 0x3f, 0xc4, 0xff, 0xcd, 0x2b, 0x8d, 0x45, 0x27,
      0xab, 0x26, 0xbc, 0xc2, 0x94, 0xf8, 0xfa, 0x7, 0x16, 0x85, 0x78, 0x71, 0xc0, 0x84, 0x38, 0x62, 0x57, 0xf5, 0x47, 0xcb,
      0x33}}, <No data fields>}
(gdb) p/x hashSequence
$17 = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0xc9, 0x0, 0x2d, 0xcc, 0x64, 0xba, 0x45, 0xf5, 0xc2, 0xf9, 0xb2, 0x8,
      0x36, 0xc3, 0x5, 0xdb, 0x7f, 0x83, 0x7b, 0xb5, 0xcd, 0x9f, 0x8a, 0x56, 0x48, 0x38, 0x8c, 0x1b, 0x79, 0xb1, 0x85,
      0xc4}}, <No data fields>}
(gdb) p/x hashOutputs
$18 = {<base_blob<256u>> = {static WIDTH = 0x20, data = {0xa, 0x27, 0xf9, 0xfb, 0xae, 0xe5, 0x57, 0xc3, 0xb, 0x85, 0x45, 0x20,
      0xe1, 0x70, 0x8a, 0xe2, 0x18, 0x6f, 0x7f, 0xba, 0x51, 0x46, 0x98, 0x2f, 0x7d, 0xf, 0xee, 0x91, 0x45, 0xbe, 0x71,
      0xa9}}, <No data fields>}
#### 开始第一个vin的签名
# 详细细节为： 
#*** 4个字节
02000000  # 版本

#*** 32个字节 已搞明白: 所有vin序列化之后做hash 所有的vin一样
fc32914446204621b11c5d7a3ce477bae7f542353e3b144d3a2938ae780e296a

#*** 32个字节
# 这里通过序列化所有的 sequence 数据 然后做hash 所有的vin一样
752adad0a7b9ceca853768aebb6965eca126a62965f698a0c1bc43d83db632ad #  hashSequence

#*** 这里占用了 0x24 = 36 个字节  这里每个vin是有区别的 
044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e82 # hashPrevout 的逆序
00000000   # 序号 注意是在后面 跟类的序列化相对应 

      #"txid": "826ef8fbd1bdf66b557018df18f81f561b21a12aed0aa42012b8574390134404",
      #"txid": "ac10821d2b7313208e8328e1aa852e28b76926b340d7d0563e02ede83f924307",

#*** 这里占用 0x1a = 26个字节   scriptCode
19  # 0x19 =25
76a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac   # scriptCode 

#*** 8个字节
807c814a00000000 # amount 小端字节

#*** 4个字节
ffffffff # nsequence

#遍历所有的输出 然后hash 所有的vin一样
a5da866ed4004689b22bd1f9a99a52c10d6a1a76686e24a3941e8bd0f9d32ad4

#*** 4个字节
00000000 # nlocktime 4字节
#*** 4个字节
01000000   # 00000001 #  hashtype  逆序

# 以上共 0xb6 = 182 个字节 = 364 个16进制


# 组合起来

printf 02000000fc32914446204621b11c5d7a3ce477bae7f542353e3b144d3a2938ae780e296a752adad0a7b9ceca853768aebb6965eca126a62965f698a0c1bc43d83db632ad044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e82000000001976a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac807c814a00000000ffffffffa5da866ed4004689b22bd1f9a99a52c10d6a1a76686e24a3941e8bd0f9d32ad40000000001000000 | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为
449f35c8561aca6a14995bb1280853621a18820d860381476cdc8da4982af540

# 签名为

        "3044022012af5c4a80ba25b1b16005e02ad8ae0a5c319c16eabc8ad6067e5c1a7f61ee1a02201b26cc93b7c6f0d8c94f79ca59075e91889ec88b4f498aa5196a6f63bcb62bc101",


#### 结束第一个vin的签名




#### 开始第2个vin的签名
# 详细细节为： 
#*** 4个字节
02000000  # 版本

#*** 32个字节 已搞明白: 所有vin序列化之后做hash 所有的vin一样
fc32914446204621b11c5d7a3ce477bae7f542353e3b144d3a2938ae780e296a

#*** 32个字节
# 这里通过序列化所有的 sequence 数据 然后做hash 所有的vin一样
752adad0a7b9ceca853768aebb6965eca126a62965f698a0c1bc43d83db632ad #  hashSequence

#*** 这里占用了 0x24 = 36 个字节  这里每个vin是有区别的 
0743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac # hashPrevout 的逆序
00000000   # 序号 注意是在后面 跟类的序列化相对应 

      #"txid": "826ef8fbd1bdf66b557018df18f81f561b21a12aed0aa42012b8574390134404",
      #"txid": "ac10821d2b7313208e8328e1aa852e28b76926b340d7d0563e02ede83f924307",

#*** 这里占用 0x1a = 26个字节   scriptCode
19  # 0x19 =25
76a914c1cad5b6368cfba6281a727c295d2ed43954981c88ac # scriptCode 



#*** 8个字节
902f500900000000 # amount 小端字节

#*** 4个字节
ffffffff # nsequence

#遍历所有的输出 然后hash 所有的vin一样
a5da866ed4004689b22bd1f9a99a52c10d6a1a76686e24a3941e8bd0f9d32ad4

#*** 4个字节
00000000 # nlocktime 4字节
#*** 4个字节
01000000   # 00000001 #  hashtype  逆序

# 以上共 0xb6 = 182 个字节 = 364 个16进制


# 组合起来

printf 02000000fc32914446204621b11c5d7a3ce477bae7f542353e3b144d3a2938ae780e296a752adad0a7b9ceca853768aebb6965eca126a62965f698a0c1bc43d83db632ad0743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac000000001976a914c1cad5b6368cfba6281a727c295d2ed43954981c88ac902f500900000000ffffffffa5da866ed4004689b22bd1f9a99a52c10d6a1a76686e24a3941e8bd0f9d32ad40000000001000000 | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b
# 结果为
d92581697aaf43fe2134ebe498e4cff4b9112984e79815db35da6a102bed2dee

# 签名为

"3045022100a726863f2595b95a84d55341e9b85cf90a61cd3879b810db1d1e88cc2e1618c90220325d8e8012609fcbfd7f755a03240832e57d1f7381fd2fb28f3f0ba1ebc175e301",

#### 结束第2个vin的签名


# ~/secp256k1/study_cpp/sign3.cpp 用这个程序验证签名的时候 需要注意私钥

