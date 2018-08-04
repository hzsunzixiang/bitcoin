


加密之后需要重启
StephenSun@debian-1:~/bitcoin/study/experiment$ bitcoin-cli -regtest encryptwallet foo
wallet encrypted; Bitcoin server stopping, restart to run with encrypted wallet. The keypool has been flushed and a new HD seed was generated (if you are using HD). You need to make a new backup.



之前犯的几个错误

1. 搞错了监听地址，导致两个节点连接不起来，并且无法同步交易信息
2. 在bitcoin.conf 中的节点连接信息


