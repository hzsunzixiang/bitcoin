set logging file signtx.txt 
set logging on


break CRPCTable::execute                                                                                    

break signrawtransaction 
break signrawtransactionwithwallet
#break DecodeHexTx
#break CheckTxScriptsSanity
#
#break CTransaction::IsCoinBase
#
#CScript::HasValidOps
#break CScript::GetOp
#
#
#break SignTransaction
#break VerifyScript

# 公钥对应的私钥
StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest dumpprivkey  2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ
cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg

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
