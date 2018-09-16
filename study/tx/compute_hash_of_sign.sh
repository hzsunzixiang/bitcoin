
# compute the hash of a nowitness trasaction
#相对应的源码
# interpreter.cpp 中的函数 SignatureHash

# 构成签名字符串里面的hash 已经搞明白

# coinbase 的 hashtx

#  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",

printf "02000000ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc03bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e7066504400cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa845000000001976a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac00f2052a01000000ffffffffddc2897edac1d67e877c63cb51ff0a2bb3f6f0abbdaa5f66b61386c8764c018b0000000001000000" | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b


# 结果为  hash的  不用逆序， 这个就是要签名的字符串
5a720979cd61f92feafce2d5bd4467b0f07bfda2b366505ba64c724d82f840e8

# 用私钥  ea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20 签名之后
结果为
        "3045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc701",


# 签名过程参看  ~/secp256k1/study_cpp/sign3.cpp

# 附录： 这里有构成的过程

02000000ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc03bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e7066504400cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa845000000001976a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac00f2052a01000000ffffffffddc2897edac1d67e877c63cb51ff0a2bb3f6f0abbdaa5f66b61386c8764c018b0000000001000000 

02000000
ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc0
3bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e70665044

00cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa845
00000000
19
76a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac
00f2052a01000000 
ffffffff
ddc2897edac1d67e877c63cb51ff0a2bb3f6f0abbdaa5f66b61386c8764c018b
00000000
01000000 


# 详细细节为： 
#*** 4个字节
02000000  # 版本

#*** 32个字节 已搞明白: 所有vin序列化之后做hash
ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc0  # hashPrevouts

# uint256 GetPrevoutHash(const CTransaction& txTo) {
#     CHashWriter ss(SER_GETHASH, 0);
#     for (const auto& txin : txTo.vin) {
#         ss << txin.prevout;
#     }
#     return ss.GetHash();
# } 

#      buf = {0x0, 0xcd, 0x8b, 0x2c, 0xb2, 0x36, 0x4e, 0x85, 0x90, 0x7f, 0xda, 0x5a, 0xa9, 0x4e, 0x52, 0xee, 0x29, 0xbb, 0xd9,
#        0x7b, 0x12, 0xaf, 0x14, 0x80, 0x5f, 0x21, 0x7b, 0x2f, 0x2a, 0x8f, 0xa8, 0x45, 0x0, 0x0, 0x0, 0x0, 0x29, 0x7f, 0x0,
#        0x0, 0x0, 0x2c, 0xd7, 0xc7, 0xbb, 0xd2, 0x1a, 0x59, 0x30, 0xb0, 0x17, 0x87, 0x29, 0x7f, 0x0, 0x0, 0xef, 0xac, 0x24,
#        0x8d, 0x29, 0x7f, 0x0, 0x0},
#      bytes = 0x24,

# 这里通过循环序列化所有的输入数据数据的 prevout  然后做hash
printf "00cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa84500000000" | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为  
# ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc0
# 也就是上面的32个字节的hash

#*** 32个字节
3bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e70665044 #  hashSequence

#      s = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19},
#      buf = {0xff, 0xff, 0xff, 0xff, 0x95, 0xc8, 0x25, 0xdd, 0x74, 0xd6, 0x36, 0x9d, 0x7c, 0x0, 0x69, 0x5d, 0x53, 0x7e, 0xa8,
#        0xd5, 0x79, 0xcc, 0x9, 0xd6, 0x15, 0x9c, 0x95, 0x5a, 0x16, 0xd6, 0xe4, 0x6d, 0x80, 0x0 <repeats 29 times>, 0x1, 0x0},
#n      bytes = 0x4,
# 这里通过序列化所有的 sequence 数据 然后做hash
printf "ffffffff" | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为 3bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e70665044
# 也就是上面的hash


#*** 这里占用了 0x24 = 36 个字节 这里只有32个
00cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa845  # hashPrevout 的逆序
00000000   # 序号 注意是在后面 跟类的序列化相对应 

#*** 这里占用 0x1a = 26个字节 
19  # 0x19 =25
76a914682f951f473c437f4489af026e5bfb1d1ed22aa388ac   # scriptCode 

#*** 8个字节
00f2052a01000000 #12a05f200 # amount 小端字节
#0x000000  012a05f200

#*** 4个字节
ffffffff # nsequence

#***  32个字节
ddc2897edac1d67e877c63cb51ff0a2bb3f6f0abbdaa5f66b61386c8764c018b # hashOutputs

#      buf = {0x40, 0x23, 0x17, 0x80, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x7, 0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf,
#        0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82, 0x79, 0xc8, 0x87, 0x80, 0x0 <repeats 29 times>, 0x1, 0x0},
#      bytes = 0x20,
#
# 遍历所有的输出 然后hash
402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887
    # 含义如下
    4023178000000000  # We then write an 8-byte field (64 bit integer, little-endian) containing the amount we want to redeem from the specified output  
    17 # Then we start writing our transaction's output. We start with a one-byte varint denoting the length of the output script (0x17 or 23 bytes): 17 
    a914077a414c3d707eaff2718369bad42b26878279c887  # 对应输出的 "scriptPubKey"
                                                    #意思是"OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
#      buf = {0x40, 0x23, 0x17, 0x80, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x7, 0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf,
#        0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82, 0x79, 0xc8, 0x87, 0x80, 0x8c, 0xdf, 0xa9, 0x0, 0x0, 0x0,
#        0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45, 0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a,
#        0x4a, 0xc7, 0xb7, 0x0, 0x87},
#      bytes = 0x40,  

#402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 
#这里有俩输出
#402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887
#808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 

# 所以计算hash 可得
printf "402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b70087" | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为  ddc2897edac1d67e877c63cb51ff0a2bb3f6f0abbdaa5f66b61386c8764c018b
# 即对应着上面的hash值

#*** 4个字节
00000000 # nlocktime 4字节
#*** 4个字节
01000000   # 00000001 #  hashtype  逆序

