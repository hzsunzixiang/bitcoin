

# rpcwallet.cpp 
break gettransaction


#2203     std::string strHex = EncodeHexTx(*wtx.tx, RPCSerializationFlags());                                                    


#break EncodeHexTx
break core_write.cpp:124

#break SerializeTransaction
break transaction.h:232



# 序列化输入 之后
#
#(gdb) p/x s
#$24 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 53, capacity 78 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff},
#  nReadPos = 0x0, nType = 0x1, nVersion = 0x1117f}
# 序列化输出之后
#(gdb) p/x s
#$26 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 133, capacity 190 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff,
#    0x2, 0x90, 0x2f, 0x50, 0x9, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45,
#    0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7, 0x0, 0x87, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x26, 0x6a,
#    0x24, 0xaa, 0x21, 0xa9, 0xed, 0xe2, 0xf6, 0x1c, 0x3f, 0x71, 0xd1, 0xde, 0xfd, 0x3f, 0xa9, 0x99, 0xdf, 0xa3, 0x69, 0x53,
#    0x75, 0x5c, 0x69, 0x6, 0x89, 0x79, 0x99, 0x62, 0xb4, 0x8b, 0xeb, 0xd8, 0x36, 0x97, 0x4e, 0x8c, 0xf9}, nReadPos = 0x0,
#  nType = 0x1, nVersion = 0x1117f}


# 序列化 witness之后
#(gdb) p/x s
#$30 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 133, capacity 190 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff,
#    0x2, 0x90, 0x2f, 0x50, 0x9, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45,
#    0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7, 0x0, 0x87, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x26, 0x6a,
#    0x24, 0xaa, 0x21, 0xa9, 0xed, 0xe2, 0xf6, 0x1c, 0x3f, 0x71, 0xd1, 0xde, 0xfd, 0x3f, 0xa9, 0x99, 0xdf, 0xa3, 0x69, 0x53,
#    0x75, 0x5c, 0x69, 0x6, 0x89, 0x79, 0x99, 0x62, 0xb4, 0x8b, 0xeb, 0xd8, 0x36, 0x97, 0x4e, 0x8c, 0xf9}, nReadPos = 0x0,
#  nType = 0x1, nVersion = 0x1117f}
#(gdb) n
#253             for (size_t i = 0; i < tx.vin.size(); i++) {
#(gdb) p/x s
#$31 = (CDataStream &) @0x7fc6780521a0: {vch = std::vector of length 167, capacity 190 = {0x2, 0x0, 0x0, 0x0, 0x0, 0x1, 0x1,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xff, 0xff, 0x5, 0x2, 0x5d, 0x3, 0x1, 0x1, 0xff, 0xff, 0xff, 0xff,
#    0x2, 0x90, 0x2f, 0x50, 0x9, 0x0, 0x0, 0x0, 0x0, 0x17, 0xa9, 0x14, 0x62, 0x98, 0x3e, 0xa5, 0x2b, 0x35, 0x9d, 0x30, 0x45,
#    0x48, 0xbf, 0x9, 0xe4, 0xa0, 0x9f, 0x4a, 0x4a, 0xc7, 0xb7, 0x0, 0x87, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x26, 0x6a,
#    0x24, 0xaa, 0x21, 0xa9, 0xed, 0xe2, 0xf6, 0x1c, 0x3f, 0x71, 0xd1, 0xde, 0xfd, 0x3f, 0xa9, 0x99, 0xdf, 0xa3, 0x69, 0x53,
#    0x75, 0x5c, 0x69, 0x6, 0x89, 0x79, 0x99, 0x62, 0xb4, 0x8b, 0xeb, 0xd8, 0x36, 0x97, 0x4e, 0x8c, 0xf9, 0x1, 0x20, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
#    0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, nReadPos = 0x0, nType = 0x1, nVersion = 0x1117f}
#


