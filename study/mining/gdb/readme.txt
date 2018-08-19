


# mining.cpp  在这里写入  hashMerkleRoot
#        IncrementExtraNonce(pblock, chainActive.Tip(), nExtraNonce);

#block->hashMerkleRoot = BlockMerkleRoot(*pblock);



# 在这里转换为一个智能指针
pblock->vtx[0] = MakeTransactionRef(std::move(txCoinbase));


# 计算 merkle 树根
# IncrementExtraNonce
# BlockMerkleRoot
# MerkleComputation



# 这里对区块进行检查  进行到这里
f (!ProcessNewBlock(Params(), shared_pblock, true, nullptr))

