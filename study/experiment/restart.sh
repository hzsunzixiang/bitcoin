



#ps aux|grep bitcoind |grep -v grep |awk '{print $2}' |xargs	kill -9
ps aux|grep bitcoind |grep -v grep
killall bitcoind
bitcoind -regtest -daemon -deprecatedrpc=signrawtransaction
ps aux|grep bitcoind |grep -v grep
