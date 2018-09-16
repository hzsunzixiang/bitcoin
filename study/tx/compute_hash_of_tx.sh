
# compute the hash of a nowitness trasaction
#相对应的源码

# coinbase 的 hashtx

#  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",

# 直接对所有数据进行hash
printf "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000" | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

# 结果为  hash的逆序
# 3d6e53dd0861bc5ad2d1791aca849328e9d02251e3bb25e7bd8002c1f076a3fe



######补充说明
# 下面两部分字在这里不用去掉
### 开头的 0001 # If present, always 0001, and indicates the presence of witness data 

###  这是 部分
# 02483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf
#解释为:
02  # 从这里开始涉及 txinwitness  这里的02 Number of stack items for input 0 (2) 	#https://en.bitcoin.it/wiki/Weight_units
   # scriptWitness.stack 部分
48   # 0x48 = 72
3045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc701 # 签名 这个签名和之前的区别是：之前是把签名放在中间，现在放在结尾
21   # 0x21 = 33
02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf   # 这个是公钥 


# 同样这里对应的源码部分为 
    #void TxToUniv(const CTransaction& tx, const uint256& hashBlock, UniValue& entry, bool include_hex, int serialize_flags)
    #{
    #   entry.pushKV("txid", tx.GetHash().GetHex());

    #(gdb) p/x tx.GetHash().GetHex()
    #$11 = "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8"




