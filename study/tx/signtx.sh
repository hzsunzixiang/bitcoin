alias rt='bitcoin-cli -regtest'

#set -x
prevtxid="45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00"
addr1="2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
addr2="2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"

#bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$prevtxid\", \"vout\":0}]"  "{\"$addr1\":21.49, \"$addr2\":28.5}"


# 如果提供私钥 省略中间的 一定要 写上[]
bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]

#bitcoin-cli -regtest signrawtransactionwithkey 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]

#StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]
#{
#	  "hex": "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
#		    "complete": true
#}
#
#StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000
#{
#	  "hex": "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
#	  "complete": true
#}
#

# bitcoin-cli -regtest decoderawtransaction 0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000


bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000  [] [\"cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg\"]

s = {0x51d93ded, 0x20307eeb, 0xe2cee452, 0xcc6412d1, 0xe3a2f515, 0x2301a171, 0x6a401a9e, 0x933d8158},
      buf = {0x88, 0xac, 0x0, 0xf2, 0x5, 0x2a, 0x1, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0xdd, 0xc2, 0x89, 0x7e, 0xda, 0xc1, 0xd6, 0x7e, 0x87, 0x7c, 0x63, 0xcb, 0x51, 0xff, 0xa, 0x2b, 0xb3, 0xf6, 0xf0, 0xab, 0xbd, 0xaa, 0x5f, 0x66, 0xb6, 0x13, 0x86, 0xc8, 0x76, 0x4c, 0x1, 0x8b, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0xaf, 0x2, 0x6e, 0x5b, 0xfb, 0x1d, 0x1e, 0xd2, 0x2a, 0xa3}, bytes = 0xb6,


#{
#  "txid": "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8",
#  "hash": "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",
#  "version": 2,
#  "size": 248,
#  "vsize": 166,
#  "locktime": 0,
#  "vin": [
#    {
#      "txid": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
#      "vout": 0,
#      "scriptSig": {
#        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
#        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
#      },
#      "txinwitness": [
#        "3045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc701",
#        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
#      ],
#      "sequence": 4294967295
#    }
#  ],
#  "vout": [
#    {
#      "value": 21.49000000,
#      "n": 0,
#      "scriptPubKey": {
#        "asm": "OP_HASH160 077a414c3d707eaff2718369bad42b26878279c8 OP_EQUAL",
#        "hex": "a914077a414c3d707eaff2718369bad42b26878279c887",
#        "reqSigs": 1,
#        "type": "scripthash",
#        "addresses": [
#          "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
#        ]
#      }
#    },
#    {
#      "value": 28.50000000,
#      "n": 1,
#      "scriptPubKey": {
#        "asm": "OP_HASH160 62983ea52b359d304548bf09e4a09f4a4ac7b700 OP_EQUAL",
#        "hex": "a91462983ea52b359d304548bf09e4a09f4a4ac7b70087",
#        "reqSigs": 1,
#        "type": "scripthash",
#        "addresses": [
#          "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
#        ]
#      }
#    }
#  ]
#}

