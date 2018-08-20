alias rt='bitcoin-cli -regtest'

set -x
prevtxid="45a88f2a2f7b215f8014af127bd9bb29ee524ea95ada7f90854e36b22c8bcd00"
addr1="2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
addr2="2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM"

bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$prevtxid\", \"vout\":0}]"  "{\"$addr1\":21.49, \"$addr2\":28.5}"

#bitcoin-cli -regtest signrawtransaction  020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 

#echo $request

#bitcoin-cli -regtest  createrawtransaction $request
#rt createrawtransaction '[{"txid":"$prevtxid", "vout":0}]' '{"$addr1":21.49, "$addr2":28.5}'

#StephenSun@debian-1:~/bitcoin/study/tx$ rt createrawtransaction '[{"txid":"36cde5c4e1d8e2ef8a6c696ef6d9c594e54501edb2945d4f418511206d83adff", "vout":0}]' '{"2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ":21.49, "2N2EYbEMbZyr1zy7GAghRKSDo4EXpFYRvQM":28.5}'


#StephenSun@debian-1:~/bitcoin/study/tx$ rt signrawtransaction  0200000001ffad836d201185414f5d94b2ed0145e594c5d9f66e696c8aefe2d8e1c4e5cd360000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000 
