



# 设计一个有两个输入的交易


# 交易两次

# 交易之后看下区块上的交易信息
      "txinwitness": 



# 第一个交易

StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
]

StephenSun@debian-1:~/bitcoin/study/tx$ rt getnewaddress
2Mva38hwbWhkSC3xR6aGDKgyqFpugWss7oQ

这样有三个钱包地址
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

注意输出中的 asm 和 hex

# 签名

StephenSun@debian-1:~/bitcoin/study/tx$ rt signrawtransaction  0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 
{
  "hex": "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
  "complete": true
}

rt decoderawtransaction "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000"


把这个交易发送出去

StephenSun@debian-1:~/bitcoin/study/tx$ rt sendrawtransaction "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000"
666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375

# 注意 在另外一个节点上挖矿的时候不能马上搜集到信息 需要等一段时间 就能同步到了
# 被这个区块搜集到了
StephenSun@debian-1:~/bitcoin/study/tx$ rt generatetoaddress 1 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ                              
[                                                                                                                               
  "2625bb7db166c60e2d41bc9806d9744451c430e0853538cc5ca7ffdec3c552b8"                                            
]


# gettransaction 获取所有输入信息 和原始二进制
StephenSun@debian-1:~/bitcoin/study/tx$ rt gettransaction 666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375
{
  "amount": 0.00000000,
  "fee": -0.01000000,
  "confirmations": 180,
  "blockhash": "2625bb7db166c60e2d41bc9806d9744451c430e0853538cc5ca7ffdec3c552b8",
  "blockindex": 1,
  "blocktime": 1533846104,
  "txid": "666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375",
  "walletconflicts": [
  ],
  "time": 1533845555,
  "timereceived": 1533845555,
  "bip125-replaceable": "no",
  "details": [
    {
      "account": "",
      "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
      "category": "send",
      "amount": -21.49000000,
      "label": "",
      "vout": 0,
      "fee": -0.01000000,
      "abandoned": false
    },
    {
      "account": "",
      "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
      "category": "send",
      "amount": -28.50000000,
      "label": "",
      "vout": 1,
      "fee": -0.01000000,
      "abandoned": false
    },
    {
      "account": "",
      "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
      "category": "receive",
      "amount": 21.49000000,
      "label": "",
      "vout": 0
    },
    {
      "account": "",
      "address": "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM",
      "category": "receive",
      "amount": 28.50000000,
      "label": "",
      "vout": 1
    }
  ],
  "hex": "02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000"
}

# 上面的二进制中解析出来发现还是有witness 说明 区块链中仍然会存放这个数据？ 这个数据存放在哪里呢 ？

详情
rt gettxout  666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375 0
rt gettxout  666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375 1 


StephenSun@debian-1:~/bitcoin/study/tx$ rt gettxout  666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375 0
{
  "bestblock": "7aab3c89c39a9e3c0d5cc40cfb464b9b5907ddb47a9faa906f440eb0d2aea97d",
  "confirmations": 180,
  "value": 21.49000000,
  "scriptPubKey": {
    "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
    "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
    "reqSigs": 1,
    "type": "scripthash",
    "addresses": [
      "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
    ]
  },
  "coinbase": false
}

再在这个交易上继续交易

用这个交易的两个输出做输入 构造交易
666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375


就以这个交易的第一个输出作为输入 来交易

目前信息有 
  "value": 21.49000000,
  "scriptPubKey": {
    "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
    "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
    "reqSigs": 1,
    "type": "scripthash",
    "addresses": [
      "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
    ]

rt createrawtransaction '[{"txid":"666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375", "vout":0}, {"txid":"666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375", "vout":1}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":11.88, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":38.10}' 


StephenSun@debian-1:~/bitcoin/study/tx$ rt createrawtransaction '[{"txid":"666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375", "vout":0}, {"txid":"666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375", "vout":1}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":11.88, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":38.10}'
020000000275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000000ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000000ffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

rt signrawtransaction  020000000275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000000ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000000ffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

StephenSun@debian-1:~/bitcoin/study/tx$ rt signrawtransaction  020000000275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000000ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000000ffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000
{
  "hex": "0200000000010275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec5432012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0248304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f2012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000",
  "complete": true
}


rt decoderawtransaction "0200000000010275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec5432012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0248304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f2012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000"
{
  "txid": "bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab",
  "hash": "8d2d23d5ff8a3858c5ba7f8a4674ee731ee3ea20fb39e3d911cdae9d375ceaa5",
  "version": 2,
  "size": 420,
  "vsize": 257,
  "locktime": 0,
  "vin": [
    {
      "txid": "666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375",
      "vout": 0,
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3", ##"hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",  # (0x0014{20-byte-key-hash}) 0x0014 加上对公钥的hash
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3" # "witness_program": "682f951f473c437f4489af026e5bfb1d1ed22aa3",  # 这里是公钥的hash
      },
      "txinwitness": [
        "3045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec543201",
        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
      ],
      "sequence": 4294967295
    },
    {
      "txid": "666643850c1df51b32e4deda2637b2c72562b02f85cb479d99fcb7e68f0f6375",
      "vout": 1,
      "scriptSig": {
        "asm": "0014c1cad5b6368cfba6281a727c295d2ed43954981c",
        "hex": "160014c1cad5b6368cfba6281a727c295d2ed43954981c"
      },
      "txinwitness": [
        "304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f201",
        "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879"
      ],
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 11.88000000,
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
      "value": 38.10000000,
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

rt sendrawtransaction "0200000000010275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec5432012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0248304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f2012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000"





StephenSun@debian-1:~/bitcoin/study/tx$ rt sendrawtransaction "0200000000010275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec5432012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0248304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f2012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000"
bd6be095a9a0a1a209328eba755365f642f92b24fa5ad39a2a8adb39371107ab



rt decoderawtransaction "0200000000010275630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff75630f8fe6b7fc999d47cb852fb06225c7b23726dadee4321bf51d0c854366660100000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff020071cf460000000017a914077a414c3d707eaff2718369bad42b26878279c88780fc17e30000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100fe5ef513a1813c466ff09e3a4f1ddb4ad5a637fbca15ec47fe2686775a28554b022004615d229843fb378ed75e5d0a4f27932024955bea27d237735466df03ec5432012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0248304502210081eb2158397f54183d84eff15279c5e0ab3b8284df162f249ed182c7406fd6e6022032a05646c28f428c1c5765547e4bd36552c98c2cb4008eefd8ecea3bb2a705f2012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000"

