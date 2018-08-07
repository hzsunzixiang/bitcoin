


libtool: link: g++ -std=c++11 -Wstack-protector -fstack-protector-all -fPIE -g -O0 -I/usr/local/BerkeleyDB.4.8/include -pthread -Wl,-z -Wl,relro -Wl,-z -Wl,now -pie -o bitcoind bitcoind-bitcoind.o  -L/usr/local/BerkeleyDB.4.8/lib libbitcoin_server.a libbitcoin_wallet.a libbitcoin_common.a univalue/.libs/libunivalue.a libbitcoin_util.a libbitcoin_consensus.a crypto/libbitcoin_crypto.a leveldb/libleveldb.a leveldb/libleveldb_sse42.a leveldb/libmemenv.a secp256k1/.libs/libsecp256k1.a -L/usr/lib/x86_64-linux-gnu -lboost_system -lboost_filesystem -lboost_program_options -lboost_thread -lboost_chrono /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so -lssl -lcrypto -levent_pthreads -levent -pthread  -D__LIBTOOL_IS_A_FOOL__   -D__LIBTOOL_IS_A_FOOL__

