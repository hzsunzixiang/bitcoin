

set logging file mining.txt 
set logging on
set print pretty


break generatetoaddress
break generateBlocks

#break BlockAssembler::CreateNewBlock
#break GenerateCoinbaseCommitment
#
#break CheckProofOfWork

break TestBlockValidity


# mining.cpp  在这里写入  hashMerkleRoot
#        IncrementExtraNonce(pblock, chainActive.Tip(), nExtraNonce);



break IncrementExtraNonce


break BlockMerkleRoot

#(gdb) p/x *pblocktemplate
#Could not find operator*.
#(gdb) p/x *(pblocktemplate.get())

# (gdb) p/x *(block.vtx[0].get())

# 交易最终在这里放到区块中
break BlockAssembler::AddToBlock
