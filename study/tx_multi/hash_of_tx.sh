

# 需要继续研究 里面的这个循环

# for (unsigned int i = 0; i < mtx.vin.size(); i++) { 841         CTxIn& txin = mtx.vin[i];

# rawtransaction.cpp  构造多个输入

# 这里研究 transaction 的hash 得到的方法  再有多个输入的情况下
# 包括三个hash

# 参看下面的解码中的信息 

这里有两个id 一个是txid 一个是hash
  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",

另外还有一个是签名使用的hash
共三个hash， 探究这三个hashid的生成方式

# 先看第一个hash
  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
  再上一级目录中 compute_txid_of_tx.sh 这个文件中解释了这个数据的得到的方式

# 再看
  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",
  上一级目录中 compute_hash_of_tx.sh 这个文件中解释了这个数据的得到的方式
 
# 再看 生成签名时的hash
  参看文件 compute_hash_of_sign.sh

# 附录: 解码交易
{
  "hex": "02000000000102044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e820000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff0743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac0000000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c8870084d7170000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702473044022012af5c4a80ba25b1b16005e02ad8ae0a5c319c16eabc8ad6067e5c1a7f61ee1a02201b26cc93b7c6f0d8c94f79ca59075e91889ec88b4f498aa5196a6f63bcb62bc1012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf02483045022100a726863f2595b95a84d55341e9b85cf90a61cd3879b810db1d1e88cc2e1618c90220325d8e8012609fcbfd7f755a03240832e57d1f7381fd2fb28f3f0ba1ebc175e3012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000",
  "complete": true
}
rt decoderawtransaction "02000000000102044413904357b81220a40aed2aa1211b561ff818df1870556bf6bdd1fbf86e820000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff0743923fe8ed023e56d0d740b32669b7282e85aae128838e2013732b1d8210ac0000000017160014c1cad5b6368cfba6281a727c295d2ed43954981cffffffff02d0e5ea3b0000000017a914077a414c3d707eaff2718369bad42b26878279c8870084d7170000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702473044022012af5c4a80ba25b1b16005e02ad8ae0a5c319c16eabc8ad6067e5c1a7f61ee1a02201b26cc93b7c6f0d8c94f79ca59075e91889ec88b4f498aa5196a6f63bcb62bc1012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf02483045022100a726863f2595b95a84d55341e9b85cf90a61cd3879b810db1d1e88cc2e1618c90220325d8e8012609fcbfd7f755a03240832e57d1f7381fd2fb28f3f0ba1ebc175e3012102a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e50604087900000000" 

{
  "txid": "314ccfcbd7d95cb0c525982df7b08af51574f74ebbd0b14bc8af4c821a6710b8",
  "hash": "c340a9ea0471e2d8e5b6ade6d3c830e8111a95f6da8a9409246b5ad84c632246",
  "version": 2,
  "size": 419,
  "vsize": 257,
  "locktime": 0,
  "vin": [
    {
      "txid": "826ef8fbd1bdf66b557018df18f81f561b21a12aed0aa42012b8574390134404",
      "vout": 0,
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
      },
      "txinwitness": [
        "3044022012af5c4a80ba25b1b16005e02ad8ae0a5c319c16eabc8ad6067e5c1a7f61ee1a02201b26cc93b7c6f0d8c94f79ca59075e91889ec88b4f498aa5196a6f63bcb62bc101",
        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
      ],
      "sequence": 4294967295
    },
    {
      "txid": "ac10821d2b7313208e8328e1aa852e28b76926b340d7d0563e02ede83f924307",
      "vout": 0,
      "scriptSig": {
        "asm": "0014c1cad5b6368cfba6281a727c295d2ed43954981c",
        "hex": "160014c1cad5b6368cfba6281a727c295d2ed43954981c"
      },
      "txinwitness": [
        "3045022100a726863f2595b95a84d55341e9b85cf90a61cd3879b810db1d1e88cc2e1618c90220325d8e8012609fcbfd7f755a03240832e57d1f7381fd2fb28f3f0ba1ebc175e301",
        "02a65db2e280e40f8e546146d1f863aa74f18ed577b5cea330c39712e506040879"
      ],
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 10.05250000,
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
      "value": 4.00000000,
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
