



# 设计一个简单的交易 为了验证区块的生成


# 第一个交易

StephenSun@debian-1:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"
]


# 获取一个交易
  {
    "txid": "161e3567b3c4b349ccda0f089e226009352b03ba6d7ea267c2f5dec13d3da5ff",
    "vout": 0,
    "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
    "account": "",
    "redeemScript": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
    "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
    "amount": 3.12500000,
    "confirmations": 391,
    "spendable": true,
    "solvable": true,
    "safe": true
  }


# 必须有费用
rt createrawtransaction '[{"txid":"161e3567b3c4b349ccda0f089e226009352b03ba6d7ea267c2f5dec13d3da5ff", "vout":0}]' '{"2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":3.115}'

0200000001ffa53d3dc1def5c267a27e6dba032b350960229e080fdacc49b3c4b367351e160000000000ffffffff01e01c91120000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000
注意输出中的 asm 和 hex


# 签名

rt signrawtransaction 0200000001ffa53d3dc1def5c267a27e6dba032b350960229e080fdacc49b3c4b367351e160000000000ffffffff01e01c91120000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000

{
  "hex": "02000000000101ffa53d3dc1def5c267a27e6dba032b350960229e080fdacc49b3c4b367351e160000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff01e01c91120000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870248304502210081f4a0d41cb8cd17ef350c46b024ae8062c281edcd3935fac7d4d33c70f62ca0022049dc0eef968810efc7f5997fba6c81c0ed834751c9174d993e0a2bf9be2b9ae8012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000",
  "complete": true
}

 看最后面的备注 中有详细信息 这里把txid和 hash放在这里 
  "txid": "7c2caa00ea331216d6835433b6c177448ca5133ba22cd85e8488b19c811ccf66",  # 这个就是txid
  "hash": "c12dbca0a024400dd2de8da47a0bf7fcd8d61953f9a84054a81e3a3927433c8d",  # 这个是通过某种方式计算出来的hash值

把这个交易发送出去



# 发送到网络之前 先看下
  rt getmempoolinfo
StephenSun@debian-1:~/bitcoin/study/experiment$ rt getmempoolinfo
{
  "size": 0,
  "bytes": 0,
  "usage": 0,
  "maxmempool": 300000000,
  "mempoolminfee": 0.00001000,
  "minrelaytxfee": 0.00001000
}

rt getrawmempool true
StephenSun@debian-1:~/bitcoin/study/experiment$ rt getrawmempool true
{
}
StephenSun@debian-1:~/bitcoin/study/experiment$ rt getrawmempool 
[
]


# 发送出去
rt  sendrawtransaction "02000000000101ffa53d3dc1def5c267a27e6dba032b350960229e080fdacc49b3c4b367351e160000000017160014682f951f473c437f4489af026e5bfb1d1ed22aa3ffffffff01e01c91120000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b700870248304502210081f4a0d41cb8cd17ef350c46b024ae8062c281edcd3935fac7d4d33c70f62ca0022049dc0eef968810efc7f5997fba6c81c0ed834751c9174d993e0a2bf9be2b9ae8012102b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf00000000"

   结果为 7c2caa00ea331216d6835433b6c177448ca5133ba22cd85e8488b19c811ccf66


#  再次查看 
StephenSun@debian-1:~/bitcoin/study/mining$ rt getrawmempool true
{
  "7c2caa00ea331216d6835433b6c177448ca5133ba22cd85e8488b19c811ccf66": {
    "size": 134,
    "fee": 0.01000000,
    "modifiedfee": 0.01000000,
    "time": 1537142834,
    "height": 996,
    "descendantcount": 1,
    "descendantsize": 134,
    "descendantfees": 1000000,
    "ancestorcount": 1,
    "ancestorsize": 134,
    "ancestorfees": 1000000,
    "wtxid": "c12dbca0a024400dd2de8da47a0bf7fcd8d61953f9a84054a81e3a3927433c8d",
    "depends": [
    ],
    "spentby": [
    ]
  }
}

StephenSun@debian-1:~/bitcoin/study/mining$ rt getmempoolinfo
{
  "size": 1,
  "bytes": 134,
  "usage": 1120,
  "maxmempool": 300000000,
  "mempoolminfee": 0.00001000,
  "minrelaytxfee": 0.00001000
}


# 现在开始 看 summarize.txt 

# hash block
# 备注 这是decode之后的


{
  "txid": "7c2caa00ea331216d6835433b6c177448ca5133ba22cd85e8488b19c811ccf66",
  "hash": "c12dbca0a024400dd2de8da47a0bf7fcd8d61953f9a84054a81e3a3927433c8d",
  "version": 2,
  "size": 216,
  "vsize": 134,
  "locktime": 0,
  "vin": [
    {
      "txid": "161e3567b3c4b349ccda0f089e226009352b03ba6d7ea267c2f5dec13d3da5ff",
      "vout": 0,
      "scriptSig": {
        "asm": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
        "hex": "160014682f951f473c437f4489af026e5bfb1d1ed22aa3"
      },
      "txinwitness": [
        "304502210081f4a0d41cb8cd17ef350c46b024ae8062c281edcd3935fac7d4d33c70f62ca0022049dc0eef968810efc7f5997fba6c81c0ed834751c9174d993e0a2bf9be2b9ae801",
        "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf"
      ],
      "sequence": 4294967295
    }
  ],
  "vout": [
    {
      "value": 3.11500000,
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
    }
  ]
}

