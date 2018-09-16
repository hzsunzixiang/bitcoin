

# 需要继续研究 里面的这个循环

# for (unsigned int i = 0; i < mtx.vin.size(); i++) { 841         CTxIn& txin = mtx.vin[i];

# rawtransaction.cpp  构造多个输入

# 这里研究 transaction 的hash 得到的方法
# 包括三个hash

alias rt='bitcoin-cli -regtest'


#set -x
prevtxid="45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00"
addr1="2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
addr2="2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"

#bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$prevtxid\", \"vout\":0}]"  "{\"$addr1\":21.49, \"$addr2\":28.5}"


# 如果提供私钥 省略中间的 一定要 写上[]
StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]
{
	  "hex": "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
		    "complete": true
}

# 参看下面的解码中的信息 

这里有两个id 一个是txid 一个是hash
  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",

另外还有一个是签名使用的hash
共三个hash， 探究这三个hashid的生成方式

# 先看第一个hash
  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
  compute_txid_of_tx.sh 这个文件中解释了这个数据的得到的方式

# 再看
  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",
  compute_hash_of_tx.sh 这个文件中解释了这个数据的得到的方式
 
# 再看 生成签名时的hash
  参看文件 compute_hash_of_sign.sh

# 附录: 解码交易
StephenSun@debian-1:~/bitcoin/study/tx$ rt decoderawtransaction 0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000 
{
  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",
  "version": 2,
  "size": 248,
  "vsize": 166,
  "locktime": 0,
  "vin": [
    {
      "txid": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
      "vout": 0,
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
      },
      "txinwitness": [
        "3045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc701",
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


StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]
{
	  "hex": "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
		    "complete": true
}
