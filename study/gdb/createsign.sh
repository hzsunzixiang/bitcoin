



# 调试  createrawtransaction 


# 第一个交易


三个钱包地址
StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "2Mva38hwbWhkSC3xR6aGDKgyqFpugWss7oQ",
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
]

StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressinfo 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
{
  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "iswitness": false,
  "script": "witness_v0_keyhash",
  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",  # (0x0014{20-byte-key-hash}) 0x0014 加上对公钥的hash
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
  "embedded": {
    "isscript": false,
    "iswitness": true,
    "witness_version": 0,
    "witness_program": "682f951f473c437f4489af026e5bfb1d1ed22aa3",  # 这里是公钥的hash
    "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
    "address": "bcrt1qdqhe286883ph73yf4upxuklmr50dy24ra7qpd0",
    "scriptPubKey": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3"
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
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ", 
{
  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
}
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
{
  "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
  "scriptPubKey": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
  "hex": "0014c1cad5b6368cfba6281a727c295d2ed43954981c",
  "pubkey": "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879",
}


# 构造一个交易

bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab

StephenSun@debian-1:~/bitcoin/study/gdb$ rt gettransaction bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab


{
  "blockhash": "1ccc6f233eda360cb1e25d78e0ca418e10d70b9c8a89086a2cb29eb470fb4a86",
  "txid": "bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab",
  "details": [
.....
    {
      "account": "",
      "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
      "category": "receive",
      "amount": 11.88000000,
....
    },
    {
      "account": "",
      "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
      "category": "receive",
      "amount": 38.10000000,
...
    }
  ],
.....
}


rt createrawtransaction '[{"txid":"bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab", "vout":0}, {"txid":"bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab", "vout":1}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":39.86, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":10.11}' 

StephenSun@debian-1:~/bitcoin/study/gdb$ rt createrawtransaction '[{"txid":"bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab", "vout":0}, {"txid":"bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab", "vout":1}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":39.86, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":10.11}'
0200000002ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000000ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000000ffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

# 分解这个二进制
02000000     #四字节版本号version
02 #一个字节的输入个数
ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd

00000000   # 四字节 指定输出的index
00  # scriptSig 注意 这里我猜测是暂时置空了 指定其长度为0 可以decode验证的
ffffffff #  scriptSig 的 nSequence 
#还有个输入
ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd
01000000
00  # scriptSig
ffffffff # scriptSig Then we write a four-byte field denoting the sequence. This is currently always set to 0xffffffff: ffffffff
# 开始输出
02 # Next comes a one-byte varint containing the number of outputs in our new transaction.  2 in this example: 02 
808895ed00000000 # We then write an 8-byte field (64 bit integer, little-endian) containing the amount we want to redeem from the specified output   2149000000   0x80172340
17 # Then we start writing our transaction's output. We start with a one-byte varint denoting the length of the output script (0x17 or 23 bytes): 17 
a914077a414c3d707eaff2718369bad42b26878279c887  # 对应输出的 "scriptPubKey"
                                                #意思是"OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
c0a2423c00000000
17
a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 # 对应输出的 "scriptPubKey"
                                                #意思是"OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
00000000 # Then we write the four-byte "lock time" field: 00000000



StephenSun@debian-1:~/bitcoin/study/gdb$ rt signrawtransaction 0200000002ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000000ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000000ffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000
{
	  "hex": "02000000000102ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870247304402203e21c46e702779be870e847da60da523a2f7dbbdc0f73155907bf596be76ad4602204cd0eb152be5904f1232e5b22a071d64bdd4bb19572e03c6aaab67f8deb35106012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf024830450221009e681830a1169d6e3e83a6a8e5dcfbd9e7249a551b23258d25c6bfe7664b1dac02201701a6f64a379e3c8bc2cc9a231cd72560414bbdf69e2be506feea3eb2a7eeaf012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000",
		    "complete": true
}

解析如下

	  "hex": "02000000000102ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870247304402203e21c46e702779be870e847da60da523a2f7dbbdc0f73155907bf596be76ad4602204cd0eb152be5904f1232e5b22a071d64bdd4bb19572e03c6aaab67f8deb35106012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf024830450221009e681830a1169d6e3e83a6a8e5dcfbd9e7249a551b23258d25c6bfe7664b1dac02201701a6f64a379e3c8bc2cc9a231cd72560414bbdf69e2be506feea3eb2a7eeaf012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000",



# 由公钥得到公钥hash 进而组合成 0014+pubkeyhash, 再进行hash 然后组合成scriptPubKey a914 + hash160(0014+pubkeyhash) + 87
# https://bitcoin.stackexchange.com/questions/32628/redeeming-a-raw-transaction-step-by-step-example-required
# http://www.righto.com/2014/02/bitcoins-hard-way-using-raw-bitcoin.html
02000000  # 版本
0001  # If present, always 0001, and indicates the presence of witness data  未签名之前没有个这个字段
     #https://en.bitcoin.it/wiki/Protocol_documentation#tx  
02   # Number of Transaction inputs (never zero) 
ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd # 32字节的hash逆序
00000000  #Four-byte field denoting the output index we want to redeem from the transaction with the above hash (counting from zero): 00000000
17  #Now comes the scriptSig. For the purpose of signing the transaction, this is temporarily filled with the scriptPubKey of the output we want to redeem. First we write a one-byte varint which denotes the length of the scriptSig (0x17 = 23 bytes): 17
16  # 16在这里是长度 0x16=22
0014682f951f473c437f4489af026e5bfb1d1ed22aa3 # 对应上面的 "hex": "0014" + pubkey的hash值,
                                             # 对这个做hash 就可以得到输出中的 scriptPubKey
ffffffff #Then we write a four-byte field denoting the sequence. This is currently always set to 0xffffffff: ffffffff
# 下面开始第二个输出
ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd
01000000
17
16
0014c1cad5b6368cfba6281a727c295d2ed43954981c
ffffffff  # 第二个输出完毕
02 # Next comes a one-byte varint containing the number of outputs in our new transaction. set this to 2 in this example: 02
808895ed00000000 # 8-byte field (64 bit integer, little-endian) containing the amount 
17  # 0x17  = 23 
a914077a414c3d707eaff2718369bad42b26878279c887 #"scriptPubKey": "a914 077a414c3d707eaff2718369bad42b26878279c8 87",
c0a2423c00000000 # 第二个 amount
17
a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 # scriptPubKey
# 下面开始witness
02  # 从这里开始涉及 txinwitness  这里的02 代表 TODO   2个字段? 版本 ?
47 # 0x47 = 71
304402203e21c46e702779be870e847da60da523a2f7dbbdc0f73155907bf596be76ad4602204cd0eb152be5904f1232e5b22a071d64bdd4bb19572e03c6aaab67f8deb3510601
21   # 0x21 = 33
02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
# 另一个
02
48   # 0x48 = 72
30450221009e681830a1169d6e3e83a6a8e5dcfbd9e7249a551b23258d25c6bfe7664b1dac02201701a6f64a379e3c8bc2cc9a231cd72560414bbdf69e2be506feea3eb2a7eeaf01
21   # 0x21 = 33
02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879
00000000


#


# 下面的描述

# 证明 可以兼容之前的版本

# vin 中提供的数据正好可以验证 vout 中的数据, 也就是用vout中的脚本执行
# 跟之前版本效果一样
# 之前版本 是在vin中提供公钥和签名，验证 vout 中的脚本， hash然后验证签名


# 由公钥得到公钥hash 进而组合成 0014+pubkeyhash, 再进行hash 然后组合成scriptPubKey a914 + hash160(0014+pubkeyhash) + 87

  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887", # 对应输出的 "scriptPubKey"

 #对应含义
  "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",

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

  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",  # (0x0014{20-byte-key-hash}) 0x0014 加上对公钥的hash
        # 这个体现在 vin 中
        # 公钥hash的生成方式 已经清楚
        #StephenSun@debian-1:~/bitcoin/study/gdb$ printf  "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf" | xxd -r -p |sha256sum -b |xxd -r -p |openssl rmd160
        #(stdin)= 682f951f473c437f4489af026e5bfb1d1ed22aa3
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",






StephenSun@debian-1:~/bitcoin/study/gdb$ rt sendrawtransaction 02000000000102ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870247304402203e21c46e702779be870e847da60da523a2f7dbbdc0f73155907bf596be76ad4602204cd0eb152be5904f1232e5b22a071d64bdd4bb19572e03c6aaab67f8deb35106012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf024830450221009e681830a1169d6e3e83a6a8e5dcfbd9e7249a551b23258d25c6bfe7664b1dac02201701a6f64a379e3c8bc2cc9a231cd72560414bbdf69e2be506feea3eb2a7eeaf012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000
2a16bc4d3ce5bcbda8a77ec420e453b8a3c3ae49cc44e384e89d95e1d222c8f3


# 发现这样不对
StephenSun@debian-1:~/bitcoin/study/gdb$ printf 02000000000102ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870247304402203e21c46e702779be870e847da60da523a2f7dbbdc0f73155907bf596be76ad4602204cd0eb152be5904f1232e5b22a071d64bdd4bb19572e03c6aaab67f8deb35106012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf024830450221009e681830a1169d6e3e83a6a8e5dcfbd9e7249a551b23258d25c6bfe7664b1dac02201701a6f64a379e3c8bc2cc9a231cd72560414bbdf69e2be506feea3eb2a7eeaf012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000 | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum
470eb908b5ad451ef495d781ca8b2a2579906e80e948ef3dd887afa2a69cf282  -

# 把witness去掉 这样也不对
StephenSun@debian-1:~/bitcoin/study/gdb$ printf 02000000000102ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum

# 对比源码 witness去掉之后， 还要去掉 0001 这两个字节
# transaction.h
#template<typename Stream, typename TxType>
#inline void SerializeTransaction(const TxType& tx, Stream& s) {
#    const bool fAllowWitness = !(s.GetVersion() & SERIALIZE_TRANSACTION_NO_WITNESS);
# 这样就对了 完美
StephenSun@debian-1:~/bitcoin/study/gdb$ printf 0200000002ab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffffab07113739db8a2a9ad35afa242bf942f6655375ba8e3209a2a1a0a995e06bbd0100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02808895ed0000000017a914077a414c3d707eaff2718369bad42b26878279c887c0a2423c0000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 | xxd -r -p |sha256sum -b |xxd -r -p |sha256sum
f3c822d2e1959de884e344cc49aec3a3b853e420c47ea7a8bdbce53c4dbc162a  -
正好是 上面hash值的逆序
2a16bc4d3ce5bcbda8a77ec420e453b8a3c3ae49cc44e384e89d95e1d222c8f3




