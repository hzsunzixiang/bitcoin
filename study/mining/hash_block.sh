15      breakpoint     keep y   <MULTIPLE>
15.1                        y     0x00007f7392689f32 in CBlockHeader::SerializationOp<CDataStream, CSerActionUnserialize>(CDataStream&, CSerActionUnserialize) at ./primitives/block.h:39
15.2                        y     0x00007f73926a336a in CBlockHeader::SerializationOp<CVectorWriter, CSerActionSerialize>(CVectorWriter&, CSerActionSerialize) at ./primitives/block.h:39
15.3                        y     0x00007f73926df15a in CBlockHeader::SerializationOp<CDataStream, CSerActionSerialize>(CDataStream&, CSerActionSerialize) at ./primitives/block.h:39
15.4                        y     0x00007f7392705e0a in CBlockHeader::SerializationOp<CSizeComputer, CSerActionSerialize>(CSizeComputer&, CSerActionSerialize) at ./primitives/block.h:39
15.5                        y     0x00007f739284ae92 in CBlockHeader::SerializationOp<CAutoFile, CSerActionUnserialize>(CAutoFile&, CSerActionUnserialize) at ./primitives/block.h:39
15.6                        y     0x00007f7392861548 in CBlockHeader::SerializationOp<CAutoFile, CSerActionSerialize>(CAutoFile&, CSerActionSerialize) at ./primitives/block.h:39
15.7                        y     0x00007f73928626ba in CBlockHeader::SerializationOp<CBufferedFile, CSerActionUnserialize>(CBufferedFile&, CSerActionUnserialize) at ./primitives/block.h:39
15.8                        y     0x00007f7392b130ae in CBlockHeader::SerializationOp<CHashWriter, CSerActionSerialize>(CHashWriter&, CSerActionSerialize) at ./primitives/block.h:39




(gdb) p/x pblock->GetHash()
$110 = {
  <base_blob<256u>> = {
    static WIDTH = 0x20,
    data = {0x7b, 0x3, 0x2b, 0x3a, 0xcd, 0x8d, 0xb8, 0x50, 0xf4, 0x9f, 0x2a, 0xeb, 0xb8, 0xeb, 0x7b, 0x19, 0xf4, 0xce, 0xe9,
      0x62, 0x3b, 0xd9, 0x9b, 0xb1, 0xfb, 0x5b, 0x5c, 0x1d, 0x51, 0xda, 0x61, 0x4a}
  }, <No data fields>}

38     template <typename Stream, typename Operation>
 39     inline void SerializationOp(Stream& s, Operation ser_action) {
 40         READWRITE(this->nVersion);
 41         READWRITE(hashPrevBlock);
 42         READWRITE(hashMerkleRoot);
 43         READWRITE(nTime);
 44         READWRITE(nBits);
 45         READWRITE(nNonce);
 46     }

# 下面开始过程
 READWRITE(this->nVersion);  # bytes=0x4字节
 0x0, 0x0, 0x0, 0x20

 READWRITE(hashPrevBlock);  #bytes = 0x24 = 36,
#(gdb) p/x pblock->hashPrevBlock
#$120 = {
#  <base_blob<256u>> = {
#    static WIDTH = 0x20,
#    data = {0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4,
#      0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d}
#  }, <No data fields>}
 {0x0, 0x0, 0x0, 0x20, 0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4, 0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d,

 READWRITE(hashMerkleRoot); #bytes = 0x44,
(gdb) p/x pblock->hashMerkleRoot
#$119 = {
#  <base_blob<256u>> = {
#    static WIDTH = 0x20,
#    data = {0xda, 0x57, 0x2, 0xe, 0xd6, 0xee, 0x59, 0xed, 0x64, 0xe5, 0x52, 0xd2, 0x69, 0xf7, 0xb8, 0x94, 0x63, 0xd5, 0x27,
#      0x25, 0x14, 0x95, 0x65, 0xbc, 0x67, 0xb4, 0x55, 0xfe, 0x28, 0x48, 0x6, 0xeb}
#  }, <No data fields>}
 {0x0, 0x0, 0x0, 0x20, 0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4, 0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d, 0xda, 0x57, 0x2, 0xe, 0xd6, 0xee, 0x59, 0xed, 0x64, 0xe5, 0x52, 0xd2, 0x69, 0xf7, 0xb8, 0x94, 0x63, 0xd5, 0x27, 0x25, 0x14, 0x95, 0x65, 0xbc, 0x67, 0xb4, 0x55, 0xfe, 0x28, 0x48, 0x6, 0xeb, 

 READWRITE(nTime); #bytes = 0x48,
 {0x0, 0x0, 0x0, 0x20, 0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4, 0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d, 0xda, 0x57, 0x2, 0xe, 0xd6, 0xee, 0x59, 0xed, 0x64, 0xe5, 0x52, 0xd2, 0x69, 0xf7, 0xb8, 0x94, 0x63, 0xd5, 0x27, 0x25, 0x14, 0x95, 0x65, 0xbc, 0x67, 0xb4, 0x55, 0xfe, 0x28, 0x48, 0x6, 0xeb, 0x68, 0xfb, 0x9e, 0x5b

 READWRITE(nBits); # bytes = 0x4c,
 {0x0, 0x0, 0x0, 0x20, 0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4, 0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d, 0xda, 0x57, 0x2, 0xe, 0xd6, 0xee, 0x59, 0xed, 0x64, 0xe5, 0x52, 0xd2, 0x69, 0xf7, 0xb8, 0x94, 0x63, 0xd5, 0x27, 0x25, 0x14, 0x95, 0x65, 0xbc, 0x67, 0xb4, 0x55, 0xfe, 0x28, 0x48, 0x6, 0xeb, 0x68, 0xfb, 0x9e, 0x5b, 0xff, 0xff, 0x7f, 0x20

 READWRITE(nNonce); #bytes = 0x50,
 {0x0, 0x0, 0x0, 0x20, 0xda, 0x57, 0x71, 0x91, 0x8c, 0x4d, 0xf2, 0xb0, 0xd9, 0xbd, 0x5c, 0x37, 0x99, 0xde, 0x8b, 0x9f, 0xe1, 0x4d, 0x4, 0x73, 0x54, 0xe, 0x13, 0x69, 0x2d, 0x53, 0x8, 0xc8, 0xc1, 0x9d, 0x8b, 0x2d, 0xda, 0x57, 0x2, 0xe, 0xd6, 0xee, 0x59, 0xed, 0x64, 0xe5, 0x52, 0xd2, 0x69, 0xf7, 0xb8, 0x94, 0x63, 0xd5, 0x27, 0x25, 0x14, 0x95, 0x65, 0xbc, 0x67, 0xb4, 0x55, 0xfe, 0x28, 0x48, 0x6, 0xeb, 0x68, 0xfb, 0x9e, 0x5b, 0xff, 0xff, 0x7f, 0x20,0x0, 0x0, 0x0, 0x0,



printf  00000020da5771918c4df2b0d9bd5c3799de8b9fe14d0473540e13692d5308c8c19d8b2dda57020ed6ee59ed64e552d269f7b89463d52725149565bc67b455fe284806eb68fb9e5bffff7f2000000000 | xxd -r -p |sha256sum -b |xxd -r -p | sha256sum -b

#结果为 
7b032b3acd8db850f49f2aebb8eb7b19f4cee9623bd99bb1fb5b5c1d51da614a

正好符合

# 然后逆序
StephenSun@debian-1:~/bitcoin/study/mining/gdb$ rt getblockcount
997
StephenSun@debian-1:~/bitcoin/study/mining/gdb$ rt getblockhash 997
4a61da511d5c5bfbb19bd93b62e9cef4197bebb8eb2a9ff450b88dcd3a2b037b
