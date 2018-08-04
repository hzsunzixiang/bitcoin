



#ps aux|grep bitcoind |grep -v grep |awk '{print $2}' |xargs	kill -9
ps aux|grep bitcoind |grep -v grep
killall bitcoind
sleep 2
bitcoind -regtest -daemon -deprecatedrpc=signrawtransaction
ps aux|grep bitcoind |grep -v grep
