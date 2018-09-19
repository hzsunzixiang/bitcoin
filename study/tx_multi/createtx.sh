#rt listunspent

# rt generatetoaddress 200 2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
# rt generatetoaddress 200 "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy"


# 用下面的俩
# 第一个
#  {
#    "txid": "565bee2424e7d9e15e52db5489ae5466a1e51adc506a38a99631897f83eeba03",
#    "vout": 0,
#    "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
#    "account": "",
#    "redeemScript": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
#    "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
#    "amount": 50.00000000,
#    "confirmations": 377,
#    "spendable": true,
#    "solvable": true,
#    "safe": true
#  },


#  {
#    "txid": "f2cc1bd2861159aa0348dc19189241a3aabbb4e5bd2af2cc5c47ce640b248d04",
#    "vout": 0,
#    "address": "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
#    "account": "",
#    "redeemScript": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee",
#    "scriptPubKey": "a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee787",
#    "amount": 12.50000000,
#    "confirmations": 145,
#    "spendable": true,
#    "solvable": true,
#    "safe": true
#  },

alias rt='bitcoin-cli -regtest'

#set -x
prevtxid1="565bee2424e7d9e15e52db5489ae5466a1e51adc506a38a99631897f83eeba03"
prevtxid2="f2cc1bd2861159aa0348dc19189241a3aabbb4e5bd2af2cc5c47ce640b248d04"
addr1="2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
addr2="2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy"


# 费用 0.01
bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$prevtxid1\", \"vout\":0}, {\"txid\":\"$prevtxid2\", \"vout\":0}]"  "{\"$addr1\":17.49, \"$addr2\":20.0}"

exit
# 020000000203baee837f893196a9386a50dc1ae5a16654ae8954db525ee1d9e72424ee5b560000000000ffffffff048d240b64ce475cccf22abde5b4bbaaa341921819dc4803aa591186d21bccf20000000000ffffffff02409f3f680000000017a914077a414c3d707eaff2718369bad42b26878279c887009435770000000017a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee78700000000
bitcoin-cli -regtest decoderawtransaction  020000000203baee837f893196a9386a50dc1ae5a16654ae8954db525ee1d9e72424ee5b560000000000ffffffff048d240b64ce475cccf22abde5b4bbaaa341921819dc4803aa591186d21bccf20000000000ffffffff02409f3f680000000017a914077a414c3d707eaff2718369bad42b26878279c887009435770000000017a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee78700000000

bitcoin-cli -regtest signrawtransaction 020000000203baee837f893196a9386a50dc1ae5a16654ae8954db525ee1d9e72424ee5b560000000000ffffffff048d240b64ce475cccf22abde5b4bbaaa341921819dc4803aa591186d21bccf20000000000ffffffff02409f3f680000000017a914077a414c3d707eaff2718369bad42b26878279c887009435770000000017a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee78700000000
# {
#   "hex": "0200000000010203baee837f893196a9386a50dc1ae5a16654ae8954db525ee1d9e72424ee5b560000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff048d240b64ce475cccf22abde5b4bbaaa341921819dc4803aa591186d21bccf20000000017160014dea077b40bd2fde2740a1b746d8b4034e32f46eeffffffff02409f3f680000000017a914077a414c3d707eaff2718369bad42b26878279c887009435770000000017a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee78702483045022100e1121fae2fc20c32f20c64fe66183bf975243cbe2ae2dfc5933a9fbee4b93ed502200d20d70a7b11f5741073067b86eb24860b17e99d1432cdad28ae80382a79bf9a012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0247304402204f2168f48e428769334ac832d7d2035a8a12dd227b7c59588d10535c0fdbee4c02205575d536b14b8cae77c13c18c4bc228949811ca60c22cec76ca8a7f24349b816012103a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c0129400000000",
#   "complete": true
# }

# 因为每个输入都需要一个各自的签名，所以需要循环计算
#  rawtransaction.cpp  
#for (unsigned int i = 0; i < mtx.vin.size(); i++) {


# bitcoin-cli -regtest decoderawtransaction  "0200000000010203baee837f893196a9386a50dc1ae5a16654ae8954db525ee1d9e72424ee5b560000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff048d240b64ce475cccf22abde5b4bbaaa341921819dc4803aa591186d21bccf20000000017160014dea077b40bd2fde2740a1b746d8b4034e32f46eeffffffff02409f3f680000000017a914077a414c3d707eaff2718369bad42b26878279c887009435770000000017a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee78702483045022100e1121fae2fc20c32f20c64fe66183bf975243cbe2ae2dfc5933a9fbee4b93ed502200d20d70a7b11f5741073067b86eb24860b17e99d1432cdad28ae80382a79bf9a012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf0247304402204f2168f48e428769334ac832d7d2035a8a12dd227b7c59588d10535c0fdbee4c02205575d536b14b8cae77c13c18c4bc228949811ca60c22cec76ca8a7f24349b816012103a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c0129400000000"


#{
#  "txid": "16db82bd6b4eb5ff22434a2f9d20e2083785202db4c76646173d96cf78dcf5da",
#  "hash": "a4c9717492c7be6956424104c86fdda1a22d90cf3de765acd3b06dc5b49206b8",
#  "version": 2,
#  "size": 419,
#  "vsize": 257,
#  "locktime": 0,
#  "vin": [
#    {
#      "txid": "565bee2424e7d9e15e52db5489ae5466a1e51adc506a38a99631897f83eeba03",
#      "vout": 0,
#      "scriptSig": {
#        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
#        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
#      },
#      "txinwitness": [
#        "3045022100e1121fae2fc20c32f20c64fe66183bf975243cbe2ae2dfc5933a9fbee4b93ed502200d20d70a7b11f5741073067b86eb24860b17e99d1432cdad28ae80382a79bf9a01",
#        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
#      ],
#      "sequence": 4294967295
#    },
#    {
#      "txid": "f2cc1bd2861159aa0348dc19189241a3aabbb4e5bd2af2cc5c47ce640b248d04",
#      "vout": 0,
#      "scriptSig": {
#        "asm": "0014dea077b40bd2fde2740a1b746d8b4034e32f46ee",
#        "hex": "160014dea077b40bd2fde2740a1b746d8b4034e32f46ee"
#      },
#      "txinwitness": [
#        "304402204f2168f48e428769334ac832d7d2035a8a12dd227b7c59588d10535c0fdbee4c02205575d536b14b8cae77c13c18c4bc228949811ca60c22cec76ca8a7f24349b81601",
#        "03a11a64621cadcd4d3d4dd862e255f078fb4d2d748a9dddf7bd1630b705c01294"
#      ],
#      "sequence": 4294967295
#    }
#  ],
#  "vout": [
#    {
#      "value": 17.49000000,
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
#      "value": 20.00000000,
#      "n": 1,
#      "scriptPubKey": {
#        "asm": "OP_HASH160 8c0ee7f37984f8525708a708ddb41ac9abdf8ee7 OP_EQUAL",
#        "hex": "a9148c0ee7f37984f8525708a708ddb41ac9abdf8ee787",
#        "reqSigs": 1,
#        "type": "scripthash",
#        "addresses": [
#          "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy"
#        ]
#      }
#    }
#  ]
#}
