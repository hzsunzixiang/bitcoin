



#ps aux|grep bitcoind |grep -v grep |awk '{print $2}' |xargs	kill -9
ps aux|grep bitcoind |grep -v grep
killall bitcoind
sleep 2
BITCOIND=/home/ericksun/bitcoin/src/bitcoind

$BITCOIND -regtest -daemon -deprecatedrpc=signrawtransaction
ps aux|grep bitcoind |grep -v grep
