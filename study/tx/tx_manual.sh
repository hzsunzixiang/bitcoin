

# 获取 trasaction id对应的信息
StephenSun@debian-1:~/bitcoin/study/tx$ rt gettransaction 45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00
{
  "amount": 50.00000000,
  "confirmations": 906,
  "generated": true,
  "blockhash": "7416f6e8513431db502ee27f59cb1d47ab9559d1f655de9e705e9291c8557457",
  "blockindex": 0,
  "blocktime": 1533402747,
  "txid": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
  "walletconflicts": [
  ],
  "time": 1533402735,
  "timereceived": 1533402735,
  "bip125-replaceable": "no",
  "details": [
    {
      "account": "",
      "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
      "category": "generate",
      "amount": 50.00000000,
      "label": "",
      "vout": 0
    }
  ],
  "hex": "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff0401550101ffffffff0200f2052a0100000017a914077a414c3d707eaff2718369bad42b26878279c8870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000"
}


# 根据 信息 获取 blockinfo  "blockhash": "7416f6e8513431db502ee27f59cb1d47ab9559d1f655de9e705e9291c8557457",
StephenSun@debian-1:~/bitcoin/study/tx$ rt getblock 7416f6e8513431db502ee27f59cb1d47ab9559d1f655de9e705e9291c8557457
{
  "hash": "7416f6e8513431db502ee27f59cb1d47ab9559d1f655de9e705e9291c8557457",
  "confirmations": 906,
  "strippedsize": 215,
  "size": 251,
  "weight": 896,
  "height": 85,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00",
  "tx": [
    "45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00"
  ],
  "time": 1533402747,
  "mediantime": 1533402746,
  "nonce": 2,
  "bits": "207fffff",
  "difficulty": 4.656542373906925e-10,
  "chainwork": "00000000000000000000000000000000000000000000000000000000000000ac",
  "previousblockhash": "7db8a5d4e158ebbc3c95b6482a766b67fbc22a1748804dd62603dea4b3eaad04",
  "nextblockhash": "6f034889b755114fea55d482ea5a62ac32d51b076707eeb70142e667e30b4247"
}


# 根据信息获取前一个 "height": 85,


StephenSun@debian-1:~/bitcoin/study/tx$ rt getblockhash 84
7db8a5d4e158ebbc3c95b6482a766b67fbc22a1748804dd62603dea4b3eaad04
StephenSun@debian-1:~/bitcoin/study/tx$ rt getblock 7db8a5d4e158ebbc3c95b6482a766b67fbc22a1748804dd62603dea4b3eaad04
{
  "hash": "7db8a5d4e158ebbc3c95b6482a766b67fbc22a1748804dd62603dea4b3eaad04",
  "confirmations": 907,
  "strippedsize": 215,
  "size": 251,
  "weight": 896,
  "height": 84,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "2af04dfd2597ab1858bfa39aade83f2b65d48dd1aa7451b288fa621b85eb24a9",
  "tx": [
    "2af04dfd2597ab1858bfa39aade83f2b65d48dd1aa7451b288fa621b85eb24a9"
  ],
  "time": 1533402747,
  "mediantime": 1533402746,
  "nonce": 4,
  "bits": "207fffff",
  "difficulty": 4.656542373906925e-10,
  "chainwork": "00000000000000000000000000000000000000000000000000000000000000aa",
  "previousblockhash": "7aab7913b5df1affd182101eb12a8d8f62f01241d951efc041c723c5b44788f7",
  "nextblockhash": "7416f6e8513431db502ee27f59cb1d47ab9559d1f655de9e705e9291c8557457"
}

# 32个字节
ad15f6b0317497b72a6cad8fd0a16c9677d7ca246c3a437f50becc121de92cc0  # hashPrevouts
# 32个字节
3bb13029ce7b1f559ef5e747fcac439f1455a2ec7c5f09b72290795e70665044 #  hashSequence




for i in `seq 1 100`
do 
    rt getblockhash $i
done

# 获取最近一次
StephenSun@debian-1:~/bitcoin/study/tx$ rt getbestblockhash
25b13dcc0d1c0cdc972c7b962ce4a46b4e11f413115837389e4ce283b072db40


# 然后查看信息
StephenSun@debian-1:~/bitcoin/study/tx$ rt getblock 25b13dcc0d1c0cdc972c7b962ce4a46b4e11f413115837389e4ce283b072db40
{
  "hash": "25b13dcc0d1c0cdc972c7b962ce4a46b4e11f413115837389e4ce283b072db40",
  "confirmations": 1,
  "strippedsize": 216,
  "size": 252,
  "weight": 900,
  "height": 990,
  "version": 536870912,
  "versionHex": "20000000",
  "merkleroot": "22aeefd06efbc840f0f9ed621fa4e132345e735b2964e3d10d846099da692d9f",
  "tx": [
    "22aeefd06efbc840f0f9ed621fa4e132345e735b2964e3d10d846099da692d9f"
  ],
  "time": 1534754471,
  "mediantime": 1534744806,
  "nonce": 3,
  "bits": "207fffff",
  "difficulty": 4.656542373906925e-10,
  "chainwork": "00000000000000000000000000000000000000000000000000000000000007be",
  "previousblockhash": "1d8b7b40adf20ff4e9126f63c1ce3ca9c267b1d69b8c33e2e0e54ebe5d89a427"
}


