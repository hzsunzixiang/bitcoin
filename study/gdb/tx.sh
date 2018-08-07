(gdb) info break
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x000055c3ed0160f8 in signrawtransaction(JSONRPCRequest const&) at rpc/rawtransaction.cpp:942
        breakpoint already hit 3 times
2       breakpoint     keep y   0x000055c3ed23a003 in GetWalletForJSONRPCRequest(JSONRPCRequest const&) at wallet/rpcwallet.cpp:43
        breakpoint already hit 5 times
3       breakpoint     keep y   0x000055c3ed25e2eb in signrawtransactionwithwallet(JSONRPCRequest const&) at wallet/rpcwallet.cpp:3260
        breakpoint already hit 2 times
4       breakpoint     keep y   0x000055c3ed23a003 in GetWalletForJSONRPCRequest(JSONRPCRequest const&) at wallet/rpcwallet.cpp:43
        breakpoint already hit 4 times
5       breakpoint     keep y   0x000055c3ed377134 in DecodeHexTx(CMutableTransaction&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, bool, bool) at core_read.cpp:112
        breakpoint already hit 2 times
6       breakpoint     keep y   0x000055c3ed013653 in SignTransaction(CMutableTransaction&, UniValue const&, CBasicKeyStore*, bool, UniValue const&)
                                                   at rpc/rawtransaction.cpp:708
        breakpoint already hit 2 times
7       breakpoint     keep y   0x000055c3ed3ab02e in ProduceSignature(BaseSignatureCreator const&, CScript const&, SignatureData&) at script/sign.cpp:142
        breakpoint already hit 2 times
8       breakpoint     keep y   <MULTIPLE>
        breakpoint already hit 4 times
8.1                         y     0x000055c3ed3ac51a in CombineSignatures(CScript const&, BaseSignatureChecker const&, txnouttype, std::vector<std::vector<unsigned char, std::allocator<unsigned char> >, std::allocator<std::vector<unsigned char, std::allocator<unsigned char> > > > const&, (anonymous namespace)::Stacks, (anonymous namespace)::Stacks, SigVersion) at script/sign.cpp:312
8.2                         y     0x000055c3ed3aceb5 in CombineSignatures(CScript const&, BaseSignatureChecker const&, SignatureData const&, SignatureData const&)
                                                   at script/sign.cpp:386
9       breakpoint     keep y   <MULTIPLE>
        breakpoint already hit 3 times
9.1                         y     0x000055c3ed3ac51a in CombineSignatures(CScript const&, BaseSignatureChecker const&, txnouttype, std::vector<std::vector<unsigned char, std::allocator<unsigned char> >, std::allocator<std::vector<unsigned char, std::allocator<unsigned char> > > > const&, (anonymous namespace)::Stacks, (anonymous namespace)::Stacks, SigVersion) at script/sign.cpp:312
9.2                         y     0x000055c3ed3aceb5 in CombineSignatures(CScript const&, BaseSignatureChecker const&, SignatureData const&, SignatureData const&)
                                                   at script/sign.cpp:386

