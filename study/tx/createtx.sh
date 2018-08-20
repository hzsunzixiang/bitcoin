#  {
#    "txid": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
#    "vout": 0,
#    "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
#    "account": "",
#    "redeemScript": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
#    "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
#    "amount": 50.00000000,
#    "confirmations": 906,
#    "spendable": true,
#    "solvable": true,
#    "safe": true
#  },
alias rt='bitcoin-cli -regtest'

#set -x
prevtxid="45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00"
addr1="2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
addr2="2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"

bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$prevtxid\", \"vout\":0}]"  "{\"$addr1\":21.49, \"$addr2\":28.5}"

#bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 
#
#StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest signrawtransaction 020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000
#{
#	  "hex": "0200000000010100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008702483045022100cd5cf208a4c06419d64df98ba7efccd4f66a7e77ba4b30b9285d502b748e662a0220432160a1acb7f2188d385b0d6ced441aa2db1ffc1e6fc88c3fd43ed95f562bc7012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
#	  "complete": true
#}
#
#{
#  "txid": "fb6bf3e0613a97db8373e6fa4c4af850db19ce15dee63c77f141f879546a1bce",
#  "hash": "fb6bf3e0613a97db8373e6fa4c4af850db19ce15dee63c77f141f879546a1bce",
#  "version": 2,
#  "size": 115,
#  "vsize": 115,
#  "locktime": 0,
#  "vin": [
#    {
#      "txid": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
#      "vout": 0,
#      "scriptSig": {
#        "asm": "",
#        "hex": ""
#      },
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
