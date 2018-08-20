set logging file createtx.txt 
set logging on


break CRPCTable::execute                                                                                    
break createrawtransaction 
break key_io.cpp:73 #CTxDestination DecodeDestination(const std::string& str, const CChainParams& params)

#break signrawtransaction 
#break signrawtransactionwithwallet
#break DecodeHexTx
#break CheckTxScriptsSanity
#
#break CTransaction::IsCoinBase
#
#CScript::HasValidOps
#break CScript::GetOp
#
#
#break SignTransaction
#break VerifyScript

