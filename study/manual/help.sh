for i in getbestblockhash getblock getblockchaininfo getblockcount getblockhash getblockheader getchaintips getchaintxstats getdifficulty getmempoolancestors getmempooldescendants getmempoolentry getmempoolinfo getrawmempool gettxout gettxoutproof gettxoutsetinfo preciousblock pruneblockchain savemempool verifychain verifytxoutproof getmemoryinfo help logging stop uptime generate generatetoaddress getblocktemplate getmininginfo getnetworkhashps prioritisetransaction submitblock addnode clearbanned disconnectnode getaddednodeinfo getconnectioncount getnettotals getnetworkinfo getpeerinfo listbanned ping setban setnetworkactive combinerawtransaction createrawtransaction decoderawtransaction decodescript fundrawtransaction getrawtransaction sendrawtransaction signrawtransaction signrawtransactionwithkey createmultisig estimatesmartfee signmessagewithprivkey validateaddress verifymessage abandontransaction abortrescan addmultisigaddress backupwallet bumpfee dumpprivkey dumpwallet encryptwallet getaccount getaccountaddress getaddressesbyaccount getaddressinfo getbalance getnewaddress getrawchangeaddress getreceivedbyaccount getreceivedbyaddress gettransaction getunconfirmedbalance getwalletinfo importaddress importmulti importprivkey importprunedfunds importpubkey importwallet keypoolrefill listaccounts listaddressgroupings listlockunspent listreceivedbyaccount listreceivedbyaddress listsinceblock listtransactions listunspent listwallets lockunspent unlock move removeprunedfunds rescanblockchain sendfrom sendmany sendtoaddress setaccount settxfee signmessage signrawtransactionwithwallet walletlock walletpassphrase walletpassphrasechange
do 
    bitcoin-cli -regtest help $i>$i.man
done 
