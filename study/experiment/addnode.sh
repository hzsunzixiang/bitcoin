


# 注意端口一定要正确，不然两个节点总是连接不上，并且节点信息无法同步
bitcoin-cli -regtest addnode "192.168.1.120:18444" "add" 

#. ~/.bashrc
bitcoin-cli -regtest getpeerinfo
