



StephenSun@debian-1:~/bitcoin/study/mining$ rt getblock 27898e4976170fa6de941177c6d58b824535c3eca0a8cce6b2190b46ba84c308        
{                                                                                                                               
  "hash": "27898e4976170fa6de941177c6d58b824535c3eca0a8cce6b2190b46ba84c308",                                                   
  "confirmations": 101,                                                                                                         
  "strippedsize": 216,                                                                                                          
  "size": 252,                                                                                                                  
  "weight": 900,                                                                  
  "height": 861,                                                                                                              
  "version": 536870912,                                                                                                         
  "versionHex": "20000000",                                                                                                     
  "merkleroot": "ebb36de5cf88139ec7d0c8bd3e76c5b649ac00b754dfb1c8b83b1777dcda0be2",                                             
  "tx": [                                                                                                                       
    "ebb36de5cf88139ec7d0c8bd3e76c5b649ac00b754dfb1c8b83b1777dcda0be2"                                                          
  ],                                          
  "time": 1534087093,                                                             
  "mediantime": 1533850103,                                                                                                     
  "nonce": 0,                                                                                                                   
  "bits": "207fffff",                                                                                                           
  "difficulty": 4.656542373906925e-10,
  "chainwork": "00000000000000000000000000000000000000000000000000000000000006bc",
  "previousblockhash": "723ea73beae02d8e1f5c5591304b2581d846265ecdec2a4e4f1fd2e1aa1512b4",
  "nextblockhash": "04494109b828c6605afb571aeba447d80810898cb880a02802c8853ee98709f9"
}

StephenSun@debian-1:~/bitcoin/study/mining$ rt gettransaction ebb36de5cf88139ec7d0c8bd3e76c5b649ac00b754dfb1c8b83b1777dcda0be2
{
  "amount": 1.56250000,
  "confirmations": 101,
  "generated": true,
  "blockhash": "27898e4976170fa6de941177c6d58b824535c3eca0a8cce6b2190b46ba84c308",
  "blockindex": 0,
  "blocktime": 1534087093,
  "txid": "ebb36de5cf88139ec7d0c8bd3e76c5b649ac00b754dfb1c8b83b1777dcda0be2",
  "walletconflicts": [
  ],
  "time": 1534087093,
  "timereceived": 1534087093,
  "bip125-replaceable": "no",
  "details": [
    {
      "account": "",
      "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
      "category": "generate",
      "amount": 1.56250000,
      "label": "",
      "vout": 0
    }
  ],
  "hex": "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff05025d030101ffffffff02902f50090000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000"
}

rt decoderawtransaction "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff05025d030101ffffffff02902f50090000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000"

{
  "txid": "ebb36de5cf88139ec7d0c8bd3e76c5b649ac00b754dfb1c8b83b1777dcda0be2",
  "hash": "6e00ea6298d16bad063f3fdb46a102b15ed8d05a2440ad9736e627e7299e380d",
  "version": 2,
  "size": 171,
  "vsize": 144,
  "locktime": 0,
  "vin": [
    {
      "coinbase": "025d030101",
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 1.56250000,
      "n": 0,
      "scriptPubKey": {
        "asm": "OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
        "hex": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
        "reqSigs": 1,
        "type": "scripthash",
        "addresses": [
          "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
        ]
      }
    },
    {
      "value": 0.00000000,
      "n": 1,
      "scriptPubKey": {
        "asm": "OP_RETURN aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf9",
        "hex": "6a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf9",
        "type": "nulldata"
      }
    }
  ]
}


StephenSun@debian-1:~/bitcoin/study/mining$ rt getaddressinfo 2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM
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



rt decoderawtransaction "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff05025d030101ffffffff02902f50090000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000"

# coinbase 的格式 http://www.righto.com/2014/02/bitcoin-mining-hard-way-algorithms.html


02000000  # 版本
0001  # If present, always 0001, and indicates the presence of witness data 
     #https://en.bitcoin.it/wiki/Protocol_documentation#tx
01  # Number of Transaction inputs (never zero) 
0000000000000000000000000000000000000000000000000000000000000000 # 32字节的hash逆序 这里全部为0
ffffffff # sequence

05 #Now comes the scriptSig. 对coinbase来说 这个可能是一个随机值 或者区块信息? TODO
025d030101
ffffffff

02 # output count
902f500900000000 # value
17 # scriptLen
a91462983ea52b359d304548bf09e4a09f4a4ac7b70087 #script 代表着 "asm": "OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
0000000000000000 # 第二个数值value为空
26 # 长度 scriplen  0x26 = 38
6a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf9 # sript
#Pubkey Script: OP_RETURN <0 to 40 bytes of data>
#(Null data scripts cannot be spent, so there's no signature script.)
# https://bitcoin.org/en/developer-guide#standard-transactions

    #if (flags & 1) {                                                                                                          
    #    for (size_t i = 0; i < tx.vin.size(); i++) {
    #        s << tx.vin[i].scriptWitness.stack;
    #    }   
    #}  
01  # 下面这是什么 这里需要看源码 源码在这里 transaction.h: SerializeTransaction: if (flags & 1)  
    # 这里的1 代表 stack的长度为 1
    # 从这里开始涉及 txinwitness  这里的01 Number of stack items for input 0 (2) 	#https://en.bitcoin.it/wiki/Weight_units
   # scriptWitness.stack 部分
20 #长度  0x20 = 32
0000000000000000000000000000000000000000000000000000000000000000  # 数据为0
00000000 #locktime


# 这里解释上面最后一部分数据
# 可以看出 其 scriptWitness.stack 数据为0 , 32字节 相当于正常交易的witness部分
#(gdb) p tx.vin
#$27 = std::vector of length 1, capacity 1 = {{prevout = {hash = {<base_blob<256u>> = {static WIDTH = 32,
#          data = '\000' <repeats 31 times>}, <No data fields>}, n = 4294967295},
#    scriptSig = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 5, _union = {
#          direct = "\002]\003\001\001\272\363\246\272\060\001\245p\003\005w\306\177\000\000\177P\222~\306\177\000", {
#            capacity = 16997634,
#            indirect = 0xa50130baa6f3ba01 <error: Cannot access memory at address 0xa50130baa6f3ba01>}}}, <No data fields>},
#    nSequence = 4294967295, scriptWitness = {stack = std::vector of length 1, capacity 1 = {
#        std::vector of length 32, capacity 32 = {0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000',
#          0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000',
#          0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000', 0 '\000',
#          0 '\000', 0 '\000', 0 '\000'}}}, static SEQUENCE_FINAL = 4294967295,
#    static SEQUENCE_LOCKTIME_DISABLE_FLAG = 2147483648, static SEQUENCE_LOCKTIME_TYPE_FLAG = 4194304,
#    static SEQUENCE_LOCKTIME_MASK = 65535, static SEQUENCE_LOCKTIME_GRANULARITY = 9}}

# 序列化witness之后
#(gdb) p/x s
#$30 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 133, capacity 190 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff,
#    0x2, 0x90, 0x2f, 0x50, 0x9, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45,
#    0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7, 0x0, 0x87, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x26, 0x6a,
#    0x24, 0xaa, 0x21, 0xa9, 0xed, 0xe2, 0xf6, 0x1c, 0x3f, 0x71, 0xd1, 0xde, 0xfd, 0x3f, 0xa9, 0x99, 0xdf, 0xa3, 0x69, 0x53,
#    0x75, 0x5c, 0x69, 0x6, 0x89, 0x79, 0x99, 0x62, 0xb4, 0x8b, 0xeb, 0xd8, 0x36, 0x97, 0x4e, 0x8c, 0xf9}, nReadPos = 0x0,
#  nType = 0x1, nVersion = 0x1117f}
#(gdb) n
#253             for (size_t i = 0; i < tx.vin.size(); i++) {
#(gdb) p/x s
#$31 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 167, capacity 190 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff,
#    0x2, 0x90, 0x2f, 0x50, 0x9, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45,
#    0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7, 0x0, 0x87, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x26, 0x6a,
#    0x24, 0xaa, 0x21, 0xa9, 0xed, 0xe2, 0xf6, 0x1c, 0x3f, 0x71, 0xd1, 0xde, 0xfd, 0x3f, 0xa9, 0x99, 0xdf, 0xa3, 0x69, 0x53,
#    0x75, 0x5c, 0x69, 0x6, 0x89, 0x79, 0x99, 0x62, 0xb4, 0x8b, 0xeb, 0xd8, 0x36, 0x97, 0x4e, 0x8c, 0xf9, 0x1, 0x20, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, nReadPos = 0x0, nType = 0x1, nVersion = 0x1117f}

    COutPoint prevout;                                                                                                          
    CScript scriptSig;    # coinbase 的为空
    uint32_t nSequence;
    CScriptWitness scriptWitness; //! Only serialized through CTransaction

    CAmount nValue;
    CScript scriptPubKey;

(gdb) p/x *pblock->vtx[0]
$22 = (const CTransaction &) @0x7fc654001170: {static CURRENT_VERSION = 0x2, static MAX_STANDARD_VERSION = 0x2,
  vin = std::vector of length 1, capacity 1 = {{prevout = {hash = {<base_blob<256u>> = {static WIDTH = 0x20, data = {
              0x0 <repeats 32 times>}}, <No data fields>}, n = 0xffffffff},
      scriptSig = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x4, _union = {direct = {0x2, 0xc2, 0x3, 0x0,
              0xc6, 0x7f, 0x0, 0x0, 0x28, 0x11, 0x0, 0x54, 0xc6, 0x7f, 0x0, 0x0, 0x28, 0x11, 0x0, 0x54, 0xc6, 0x7f, 0x0, 0x0,
              0x2, 0x0, 0x0, 0x0}, {capacity = 0x3c202, indirect = 0x5400112800007fc6}}}, <No data fields>},
      nSequence = 0xffffffff, scriptWitness = {stack = std::vector of length 1, capacity 1 = {
          std::vector of length 32, capacity 32 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
            0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}}},
      static SEQUENCE_FINAL = 0xffffffff, static SEQUENCE_LOCKTIME_DISABLE_FLAG = 0x80000000,
      static SEQUENCE_LOCKTIME_TYPE_FLAG = 0x400000, static SEQUENCE_LOCKTIME_MASK = 0xffff,
      static SEQUENCE_LOCKTIME_GRANULARITY = 0x9}}, vout = std::vector of length 2, capacity 2 = {{nValue = 0x4a817c8,
      scriptPubKey = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x17, _union = {direct = {0xa9, 0x14,
              0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45, 0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7,
              0x0, 0x87, 0x30, 0x30, 0x30, 0x30, 0x30}, {capacity = 0x986214a9,
              indirect = 0x4845309d352ba53e}}}, <No data fields>}}, {nValue = 0x0,
      scriptPubKey = {<prevector<28u, unsigned char, unsigned int, int>> = {_size = 0x43, _union = {direct = {0x26, 0x0, 0x0,
              0x0, 0xb0, 0x9, 0x0, 0x54, 0xc6, 0x7f, 0x0 <repeats 18 times>}, {capacity = 0x26,
              indirect = 0x7fc6540009b0}}}, <No data fields>}}}, nVersion = 0x2, nLockTime = 0x0, hash = {<base_blob<256u>> = {
      static WIDTH = 0x20, data = {0x8f, 0xc, 0xe1, 0xe2, 0x31, 0x4a, 0xb1, 0x4c, 0x8d, 0x6e, 0xee, 0x92, 0x8a, 0xdd, 0xfe,
        0x52, 0x15, 0xc8, 0x56, 0x59, 0x63, 0xdf, 0x4d, 0x43, 0xb4, 0x29, 0x96, 0x34, 0x63, 0xa2, 0x8,
        0x16}}, <No data fields>}}



StephenSun@debian-1:~/bitcoin/study/mining$ rt getaddressinfo 2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM
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





