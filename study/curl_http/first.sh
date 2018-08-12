
最终成功了

注意使用密码
而且如果用户名没设置，则置空
StephenSun@debian-1:~/bitcoin/study/curl_http$ curl --user :1234567890987654321xyz --data-binary '{"method": "getblockchaininfo", "params": [], "id":1 }' -H 'content-type: text/plain;' http://127.0.0.1:18443/                                                                                      
{"result":{"chain":"regtest","blocks":966,"headers":966,"bestblockhash":"0b17f17eb5bea92ce1c12f90f4965a1c6e83b09a0d8a78636e9142285dedfc05","difficulty":4.656542373906925e-10,"mediantime":1534087109,"verificationprogress":1,"initialblockdownload":false,"chainwork":"000000000000000000000000000000000000000000000000000000000000078e","size_on_disk":292408,"pruned":false,"softforks":[{"id":"bip34","version":2,"reject":{"status":false}},{"id":"bip66","version":3,"reject":{"status":false}},{"id":"bip65","version":4,"reject":{"status":false}}],"bip9_softforks":{"csv":{"status":"active","startTime":0,"timeout":9223372036854775807,"since":432},"segwit":{"status":"active","startTime":-1,"timeout":9223372036854775807,"since":0}},"warnings":"This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"},"error":null,"id":1}



curl --user :1234567890987654321xyz --data-binary '{"method": "getbalance", "params": [], "id":1 }' -H 'content-type: text/plain;' http://127.0.0.1:18443/                                                                                      


StephenSun@debian-1:~/bitcoin/study/curl_http$ curl --user :1234567890987654321xyz --data-binary '{"method": "getbalance", "params": [], "id":1 }' -H 'content-type: text/plain;' http://127.0.0.1:18443/                                                        
{"result":10962.49000000,"error":null,"id":1}
StephenSun@debian-1:~/bitcoin/study/curl_http$
StephenSun@debian-1:~/bitcoin/study/curl_http$ curl --user :1234567890987654321xyz --data-binary '{"method": "getbalance", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18443/                                                       
{"result":10962.49000000,"error":null,"id":null}


####
下面是实验过程


curl  --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getbalance", "params": ["*", 6] }' -H 'content-type: text/plain;' http://127.0.0.1:18443/

curl  --data-binary '{"method": "getbalance"}' -H 'content-type: text/plain;' http://127.0.0.1:18443/




curl --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18443/


06:40:43.620303 IP 127.0.0.1.44985 > 127.0.0.1.18443: Flags [P.], seq 1:181, ack 1, win 342, options [nop,nop,TS val 25101044 ec
r 25101044], length 180                                                                                                                 0x0000:  4500 00e8 bf69 4000 4006 7ca4 7f00 0001  E....i@.@.|.....
        0x0010:  7f00 0001 afb9 480b a6d0 bd94 3477 fbec  ......H.....4w..
        0x0020:  8018 0156 fedc 0000 0101 080a 017f 02f4  ...V............
        0x0030:  017f 02f4 504f 5354 202f 2048 5454 502f  ....POST./.HTTP/
        0x0040:  312e 310d 0a48 6f73 743a 2031 3237 2e30  1.1..Host:.127.0
        0x0050:  2e30 2e31 0d0a 436f 6e6e 6563 7469 6f6e  .0.1..Connection                                                              0x0060:  3a20 636c 6f73 650d 0a41 7574 686f 7269  :.close..Authori
        0x0070:  7a61 7469 6f6e 3a20 4261 7369 6320 4f6a  zation:.Basic.Oj
        0x0080:  4579 4d7a 5131 4e6a 6334 4f54 4135 4f44  EyMzQ1Njc4OTA5OD
        0x0090:  6332 4e54 517a 4d6a 4634 6558 6f3d 0d0a  c2NTQzMjF4eXo=..                                                      
        0x00a0:  436f 6e74 656e 742d 4c65 6e67 7468 3a20  Content-Length:.
        0x00b0:  3530 0d0a 0d0a 7b22 6d65 7468 6f64 223a  50....{"method":                                                              0x00c0:  2267 6574 626c 6f63 6b63 6861 696e 696e  "getblockchainin
        0x00d0:  666f 222c 2270 6172 616d 7322 3a5b 5d2c  fo","params":[],
        0x00e0:  2269 6422 3a31 7d0a                      "id":1}. 
06:42:05.862340 IP 127.0.0.1.44986 > 127.0.0.1.18443: Flags [P.], seq 1:182, ack 1, win 342, options [nop,nop,TS val 25121604 ec
r 25121604], length 181                                                                                                         
        0x0000:  4500 00e9 2140 4000 4006 1acd 7f00 0001  E...!@@.@.......
        0x0010:  7f00 0001 afba 480b bf91 727b ea91 8dc6  ......H...r{....                                                              0x0020:  8018 0156 fedd 0000 0101 080a 017f 5344  ...V..........SD
        0x0030:  017f 5344 504f 5354 202f 2048 5454 502f  ..SDPOST./.HTTP/
        0x0040:  312e 310d 0a55 7365 722d 4167 656e 743a  1.1..User-Agent:
        0x0050:  2063 7572 6c2f 372e 3338 2e30 0d0a 486f  .curl/7.38.0..Ho                                                      
        0x0060:  7374 3a20 3132 372e 302e 302e 313a 3138  st:.127.0.0.1:18
        0x0070:  3434 330d 0a41 6363 6570 743a 202a 2f2a  443..Accept:.*/*                                                              0x0080:  0d0a 636f 6e74 656e 742d 7479 7065 3a20  ..content-type:.
        0x0090:  7465 7874 2f70 6c61 696e 3b0d 0a43 6f6e  text/plain;..Con
        0x00a0:  7465 6e74 2d4c 656e 6774 683a 2035 340d  tent-Length:.54.
        0x00b0:  0a0d 0a7b 226d 6574 686f 6422 3a20 2267  ...{"method":."g                                                      
        0x00c0:  6574 626c 6f63 6b63 6861 696e 696e 666f  etblockchaininfo
        0x00d0:  222c 2022 7061 7261 6d73 223a 205b 5d2c  ",."params":.[],
        0x00e0:  2022 6964 223a 3120 7d                   ."id":1.}   

curl --data-binary '{"method": "getblockchaininfo", "params": [], "id":1 }' -H 'content-type: text/plain;' http://127.0.0.1:18443/


rpcpassword=1234567890987654321xyz
curl --user bitcoinrpc:1234567890987654321xyz--data-binary '{"method": "getblockchaininfo", "params": [], "id":1 }' -H 'content-type: text/plain;' http://127.0.0.1:18443/

--user bitcoinrpc:xxxxxxxxxxxxxxx 
