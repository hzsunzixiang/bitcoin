




ericksun@192.168.56.101:~/bitcoin/study/tx$ rt  importprivkey cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg                                                    
ericksun@192.168.56.101:~/bitcoin/study/tx$ rt getaddressesbyaccount ""
[
  "mq1qa6TxMyHmNVTFhRqtKfMFxXxcPx5tCz",
  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "2N61nSqAsqvUukEA6YP4cnTCYr5n283bXVy",
  "2N7W2N2sZYbQ7h7BK55iR5JBbGzMbo42QFF",
  "2N8w6HGi6bzuZEhfiv8i1RedHezVA1KvuLx",
  "2NBcGGR2RW5FHdXEM1vW3ep6uBsQaUg9YpJ",
  "2NEj1PfA5YNEP9LqTQp9jGwadEg8hJCb53N",
  "bcrt1qdqhe286883ph73yf4upxuklmr50dy24ra7qpd0"
]
ericksun@192.168.56.101:~/bitcoin/study/tx$ rt dumpprivkey "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
cVSKEzHXxJ8pJcMB1BX6H6wPXG9ZPDKZQwtqBe9uvjDxoZwjySXg

ericksun@192.168.56.101:~/bitcoin/study/key$ rt getaddressinfo  "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ"
{
  "address": "2MsvmB4K5yFMxAdFhGyGW87SeWrPRSksRYJ",
  "scriptPubKey": "a914077a414c3d707eaff2718369bad42b26878279c887",
  "ismine": true,
  "iswatchonly": false,
  "isscript": true,
  "iswitness": false,
  "script": "witness_v0_keyhash",
  "hex": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3",
  "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
  "embedded": {
    "isscript": false,
    "iswitness": true,
    "witness_version": 0,
    "witness_program": "682f951f473c437f4489af026e5bfb1d1ed22aa3",
    "pubkey": "02b9c7077daaa55acf00048bca3c5d04d053a5a4e48c32c88e6776ccc275c94daf",
    "address": "bcrt1qdqhe286883ph73yf4upxuklmr50dy24ra7qpd0",
    "scriptPubKey": "0014682f951f473c437f4489af026e5bfb1d1ed22aa3"
  },
  "account": "",
  "timestamp": 1
}

