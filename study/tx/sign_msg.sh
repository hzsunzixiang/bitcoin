
# StephenSun@debian-1:~/bitcoin/study/tx$ bitcoin-cli -regtest dumpprivkey  2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ                   
#cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg


#Create the signature
#bitcoin-cli signmessagewithprivkey "privkey" "my message"
bitcoin-cli  -regtest signmessagewithprivkey "cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg" "fea376f0c10280bde725bbe35122d0e9289384ca1a79d1d25abc6108dd536e3d",

# Invalid private key
#bitcoin-cli  -regtest signmessagewithprivkey "xVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg"  "d9f409afddfc82f637230dca8e08415e30d75479b90debaf0ec59960b49060c8"

#bitcoin-cli  -regtest signmessagewithprivkey "cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg"  "020000000100cd8b2cb2364e85907fda5aa94e52ee29bbd97b12af14805f217b2f2a8fa8450000000000ffffffff02402317800000000017a914077a414c3d707eaff2718369bad42b26878279c887808cdfa90000000017a91462983ea52b359d304548bf09e4a09f4a4ac7b7008700000000"
#Verify the signature
#bitcoin-cli verifymessage "1D1ZrZNe3JUo7ZycKEYQQiQAWd9y54F4XX" "signature" "my message"

