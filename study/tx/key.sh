

# 好文章  介绍了 segwit的好处
https://bitcoincore.org/en/2016/01/26/segwit-benefits/


注意这个字段太重要了 要研究一下
      "txinwitness": 

# https://bitcoin.stackexchange.com/questions/32628/redeeming-a-raw-transaction-step-by-step-example-required

StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
]

# 由公钥得到公钥hash 进而组合成 0014+pubkeyhash, 再进行hash 然后组合成scriptPubKey a914 + hash160(0014+pubkeyhash) + 87
# 从而如果提供公钥 用scriptPubKey 就能证明所有人的公钥正确； 再结合签名证明所有人的签名正确
# witness 的钱包地址生成方式 跟普通的差别较大
StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressinfo 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
{
  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
        # 由钱包地址得到 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ -> c4 + 077a414c3d707eaff2718369bad42b26878279c8 + a76c6897
  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887", 
        # printf "c4077a414c3d707eaff2718369bad42b26878279c8" | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum -b
        # 得到 a76c689754f7962a9ccad94e7e52ca44cf31e577c73ab62935a0b14213f2a5cd  取最前面四位
        # base58(c4 + 077a414c3d707eaff2718369bad42b26878279c8 + a76c6897) - > 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ

        # 对应输出的 "scriptPubKey" #0xa9 指的是 OP_HASH160 指令 0x14指的是长度 0x87=OP_EQUAL
        # *script << OP_HASH160 << ToByteVector(scriptID) << OP_EQUAL;
	    # 0xa9 + 0x14 + （pubhash）+ 0x87

        # 这个体现在 vout 中
        # 这个 scriptPubKey 的生成方式 
        # 在非 sigwit的交易中 这个 脚本中其实就是 公钥的hash
        #"asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
        #"hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
        # https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki
        # 这里有描述 但是没有得知如何计算出的这个
        # 恍然大悟 原来 077a414c3d707eaff2718369bad42b26878279c8 是对 下面的hex 也就是 0014+pubkeyhash 又做了一次hash
        # 0014682f951f473c437f4489af026e5bfb1d1ed22aa3 也就是 
        # StephenSun@debian-1:~/bitcoin/study/gdb$ printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
        # (stdin)= 077a414c3d707eaff2718369bad42b26878279c8
        # 由 hex 到 scriptPubKey 是单向的， 所以 在输入中提供的hex， 可以验证之前的上一个输出

  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "iswitness": false,
  "script": "witness_v0_keyhash",
  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",  # (0x0014{20-byte-key-hash}) 0x0014 加上对公钥的hash
        # 这个体现在 vin 中
        # 公钥hash的生成方式 已经清楚
        #StephenSun@debian-1:~/bitcoin/study/gdb$ printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
        #(stdin)= 682f951f473c437f4489af026e5bfb1d1ed22aa3
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
        # 这个 是真正的公钥pubkey 已经清楚
  "embedded": {
    "isscript": false,
    "iswitness": true,   # 意思是对于 iswitness 版本的交易, 
    "witness_version": 0,

     # 这里是公钥的hash 参看上面  已经清楚 
	 # 要想花费这笔钱 必须提供这个 pubkeyhash  本篇后面有解释
    "witness_program": "682f951f473c437f4489af026e5bfb1d1ed22aa3",  
    "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",  # 公钥 已经清楚
    "address": "bcrt1qdqhe286883ph73yf4upxuklmr50dy24ra7qpd0",  # TODO

    #scriptPubKey  已经清楚 就是 0x0014 +  公钥hash  注意是公钥hash
    "scriptPubKey": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3"  # 也就是 00 + 0x14 + pubkeyhash 
  },
  "account": "",
  "timestamp": 1533402402,
  "hdkeypath": "m/0'/0'/0'",
  "hdmasterkeyid": "ed118f14056f4115cf6bbb0482bd17edd041e85c"
}



StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressinfo 2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM
{
  "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
  "scriptPubKey": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "iswitness": false,
  "script": "witness_v0_keyhash",
  "hex": "0014c1cad5b6368cfba6281a727c295d2ed43954981c",
  "pubkey": "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879",
  "embedded": {
    "isscript": false,
    "iswitness": true,
    "witness_version": 0,
    "witness_program": "c1cad5b6368cfba6281a727c295d2ed43954981c",
    "pubkey": "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879",
    "address": "bcrt1qc89dtd3k3na6v2q6wf7zjhfw6su4fxqu6hpupw",
    "scriptPubKey": "0014c1cad5b6368cfba6281a727c295d2ed43954981c"
  },
  "account": "",
  "timestamp": 1533402402,
  "hdkeypath": "m/0'/0'/1'",
  "hdmasterkeyid": "ed118f14056f4115cf6bbb0482bd17edd041e85c"
}




总结一下
地址 及对应的公钥
对应私钥 
ea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20

  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ", 
{
   # 编码 base58(c4 + 077a414c3d707eaff2718369bad42b26878279c8 + a76c6897) - > 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
   # 再做一次rmd160
   # StephenSun@debian-1:~/bitcoin/study/gdb$ printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
   # (stdin)= 077a414c3d707eaff2718369bad42b26878279c8
  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",               
   # 对公钥做rmd160
   # printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
   #(stdin)= 682f951f473c437f4489af026e5bfb1d1ed22aa3
  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",                          
   # 公钥 前缀为 02 
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf", 
       # 对应私钥这个需要解密的 ea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20
  #priv = 0xea628ae24b0a6852fc55f8a40bf07fa9a9e3be78d76359671f2c4aa2e695ca20
  # 符合 这个点为
  #result: ('0xb9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94dafL', '0x473a9dbea3fb3ebcb43797a9583c634fd205c7d87469b0e4f2a5d3f6a794f424L')
}

# TODO 没搞清楚
          data = {0x68, 0x2f, 0x95, 0x1f, 0x47, 0x3c, 0x43, 0x7f, 0x44, 0x89, 0xaf, 0x2, 0x6e, 0x5b, 0xfb, 0x1d, 0x1e, 0xd2,
            0x2a, 0xa3}       
        }, <No data fields>}, <No data fields>}] = {
      static PRIVATE_KEY_SIZE = 0x117,              
      static COMPRESSED_PRIVATE_KEY_SIZE = 0xd6,            
      fValid = 0x1,  
      fCompressed = 0x1,
      keydata = std::vector of length 32, capacity 32 = {0xea, 0x62, 0x8a, 0xe2, 0x4b, 0xa, 0x68, 0x52, 0xfc, 0x55, 0xf8,    
        0xa4, 0xb, 0xf0, 0x7f, 0xa9, 0xa9, 0xe3, 0xbe, 0x78, 0xd7, 0x63, 0x59, 0x67, 0x1f, 0x2c, 0x4a, 0xa2, 0xe6, 0x95, 0xca,
        0x20}

 data = {0x7, 0x7a, 0x41, 0x4c, 0x3d, 0x70, 0x7e, 0xaf, 0xf2, 0x71, 0x83, 0x69, 0xba, 0xd4, 0x2b, 0x26, 0x87, 0x82,
            0x79, 0xc8}
        }, <No data fields>}, <No data fields>}] = {
      <prevector<28u, unsigned char, unsigned int, int>> = {
        _size = 0x16,
        _union = {
          direct = {0x0, 0x14, 0x68, 0x2f, 0x95, 0x1f, 0x47, 0x3c, 0x43, 0x7f, 0x44, 0x89, 0xaf, 0x2, 0x6e, 0x5b, 0xfb, 0x1d,
            0x1e, 0xd2, 0x2a, 0xa3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0},
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
{
  "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
  "scriptPubKey": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
  "hex": "0014c1cad5b6368cfba6281a727c295d2ed43954981c",
  "pubkey": "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879",
}


# 构造一个交易

  {
    "txid": "36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff",
    "vout": 0,
    "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
    "account": "",
    "redeemScript": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
    "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
    "amount": 50.00000000,
    "confirmations": 189,
    "spendable": true,
    "solvable": true,
    "safe": true
  }

rt createrawtransaction '[{"txid":"36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff", "vout":0}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":21.49, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":28.5}'

StephenSun@debian-1:~/bitcoin/study/tx$ rt createrawtransaction '[{"txid":"36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff", "vout":0}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":21.49, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":28.5}'
0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

# 分解这个二进制
02000000     #四字节版本号version
01  #一个字节的输入个数
ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd36 # 32字节的hash逆序
00000000   # 四字节 指定输出的index
00  # 注意 这里我猜测是暂时置空了 指定其长度为0 可以decode验证的
ffffffff # Then we write a four-byte field denoting the sequence. This is currently always set to 0xffffffff: ffffffff
02 # Next comes a one-byte varint containing the number of outputs in our new transaction.  2 in this example: 02 
4023178000000000  # We then write an 8-byte field (64 bit integer, little-endian) containing the amount we want to redeem from the specified output   2149000000   0x80172340
17 # Then we start writing our transaction's output. We start with a one-byte varint denoting the length of the output script (0x17 or 23 bytes): 17 
a914077a414c3d707eaff2718369bad42b26878279c887  # 对应输出的 "scriptPubKey"
                                                #意思是"OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
808cdfa900000000
17
a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 # 另外一个
00000000 # Then we write the four-byte "lock time" field: 00000000



注意输出中的 asm 和 hex


{
  "txid": "bc7727bcf98ed68ec52271f68f3e5ea336afe08433a881c1a7eaae7e2b007946",
  "hash": "bc7727bcf98ed68ec52271f68f3e5ea336afe08433a881c1a7eaae7e2b007946",
  "version": 2,
  "size": 115,
  "vsize": 115,
  "locktime": 0,
  "vin": [
    {
      "txid": "36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff",
      "vout": 0,
      "scriptSig": {
        "asm": "",
        "hex": ""
      },
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 21.49000000,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
        "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
        "reqSigs": 1,
        "type": "scripthash",
        "addresses": [
          "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
        ]
      }
    },
    {
      "value": 28.50000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
        "hex": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
        "reqSigs": 1,
        "type": "scripthash",
        "addresses": [
          "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
        ]
      }
    }
  ]
}
# 签名


StephenSun@debian-1:~/bitcoin/study/tx$ rt signrawtransaction  0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 
{
  "hex": "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
  "complete": true
}

rt decoderawtransaction "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000"
# http://www.righto.com/2014/02/bitcoins-hard-way-using-raw-bitcoin.html
解析
02000000  # 版本
0001  # If present, always 0001, and indicates the presence of witness data 
     #https://en.bitcoin.it/wiki/Protocol_documentation#tx
01  # Number of Transaction inputs (never zero) 
ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd36 # 32字节的hash逆序
00000000  #Four-byte field denoting the output index we want to redeem from the transaction with the above hash (counting from zero): 00000000
17  #Now comes the scriptSig. For the purpose of signing the transaction, this is temporarily filled with the scriptPubKey of the output we want to redeem. First we write a one-byte varint which denotes the length of the scriptSig (0x17 = 23 bytes): 17
16  # 16在这里是长度 0x16=22
0014682f951f473c437f4489af026e5bfb1d1ed22aa3 # 对应上面的 "hex": "0014" + pubkey的hash值,
ffffffff #Then we write a four-byte field denoting the sequence. This is currently always set to 0xffffffff: ffffffff
02 # Next comes a one-byte varint containing the number of outputs in our new transaction. set this to 2 in this example: 02
4023178000000000  # 8-byte field (64 bit integer, little-endian) containing the amount 808cdfa900000000
17  # 0x17  = 23 
a914077a414c3d707eaff2718369bad42b26878279c887 
808cdfa900000000
17 # 0x17 = 23
a91462983ea52b359d304548bf09e4a09f4a4ac7b70087
02  # 从这里开始涉及 txinwitness  这里的02 Number of stack items for input 0 (2) 	#https://en.bitcoin.it/wiki/Weight_units
   # scriptWitness.stack 部分
48   # 0x48 = 72
3045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e01   # 签名 我猜测这个签名和之前的区别是：之前是把签名放在中间，现在放在结尾
21   # 0x21 = 33
02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf   # 这个是公钥 
00000000


# 这里做一些解释
{
  "txid": "666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375",
  "hash": "6a6ed4b53aa9a7ec4c4dfd7fdf58dabd677908e2470d5e594a1b6dc3ae69c24d",
  "version": 2,
  "size": 248,
  "vsize": 166,
  "locktime": 0,
  "vin": [
    {
      "txid": "36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff",
      "vout": 0,
      # 要花费这笔钱 需要提供的脚本  也就是包含公钥hash的 (详情参看上面)
      # 这样就可以验证txout "asm": 或者 "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
      # 以证明提供的pubkeyhash是跟txout中的 相关信息匹配
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3", # 0x0014 + 对公钥的hash
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
      },
      #  这里是签名+公钥 
      #  由公钥对应公钥hash，从而证明公钥是匹配的
      #  由签名证明确实有拥有者的私钥
      "txinwitness": [
        "3045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e01",
        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
      ],
	 # sign<- private -> pubukey 签名证明拥有私钥  而且可以用公钥pubkey验证
     # pubkey -> pubkeyhash(scriptSig) -> scriptPubKey 
	 # vin中提供的scriptSig  跟vout中的scriptPubKey 相匹配, 已搞明白
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 21.49000000,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
        "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
        "reqSigs": 1,
        "type": "scripthash",
        "addresses": [
          "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
        ]
      }
    },
    {
      "value": 28.50000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
        "hex": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
        "reqSigs": 1,
        "type": "scripthash",
        "addresses": [
          "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
        ]
      }
    }
  ]
}

从下面这个类型可以看出
        "type": "scripthash",
这其实是一个支付到脚本hash(P2SH)


printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160 

StephenSun@debian-1:~/bitcoin/study/gdb$ printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
(stdin)= 682f951f473c437f4489af026e5bfb1d1ed22aa3

StephenSun@debian-1:~/bitcoin/study/gdb$ printf   0014682f951f473c437f4489af026e5bfb1d1ed22aa3 | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
(stdin)= 077a414c3d707eaff2718369bad42b26878279c8
---------------------------------------------------------------------------------
P2WPKH

The following example is a version 0 pay-to-witness-public-key-hash (P2WPKH):

    witness:      <signature> <pubkey>
    scriptSig:    (empty)
    scriptPubKey: 0 <20-byte-key-hash>    # 这里的keyhash是对公钥的hash
                  (0x0014{20-byte-key-hash})

The '0' in scriptPubKey indicates the following push is a version 0 witness program. The length of the witness program indicates that it is a P2WPKH type. The witness must consist of exactly 2 items. The HASH160 of the pubkey in witness must match the witness program.

The signature is verified as

    <signature> <pubkey> CHECKSIG

Comparing with a traditional P2PKH output, the P2WPKH equivalent occupies 3 less bytes in the scriptPubKey, and moves the signature and public key from scriptSig to witness. 


https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki


# 更接近下面这个描述
P2WPKH nested in BIP16 P2SH

The following example is the same P2WPKH, but nested in a BIP16 P2SH output.

    witness:      <signature> <pubkey>
    scriptSig:    <0 <20-byte-key-hash>>
                  (0x160014{20-byte-key-hash})
    scriptPubKey: HASH160 <20-byte-script-hash> EQUAL
                  (0xA914{20-byte-script-hash}87)


---------------------------------------------------------------------------------
        
0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000

