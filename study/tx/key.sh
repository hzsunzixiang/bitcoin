

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
02  # 从这里开始涉及 txinwitness  这里的02 代表 TODO   2个字段? 版本 ?
48   # 0x48 = 72
3045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e01   # 签名 我猜测这个签名和之前的区别是：之前是把签名放在中间，现在放在结尾
21   # 0x21 = 33
02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf   # 这个是公钥 
00000000
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
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3", # 0x0014 + 对公钥的hash
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
      },
      "txinwitness": [
        "3045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e01",
        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
      ],
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

---------------------------------------------------------------------------------
        
0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

02000000000101ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cacee8914755740fc1d347ba2188b8f951daf5f9a5f6f1ed2d47a015cffead37022066511fefcd546494bc8d068cc879a70b62c8e2745bf272ea071eaa1085ab879e012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000

