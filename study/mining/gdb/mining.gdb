






#break generatetoaddress
break generateBlocks

#break BlockAssembler::CreateNewBlock
#break GenerateCoinbaseCommitment
#
#break CheckProofOfWork



# mining.cpp  在这里写入  hashMerkleRoot
#        IncrementExtraNonce(pblock, chainActive.Tip(), nExtraNonce);



break IncrementExtraNonce


break BlockMerkleRoot
