
bitcoin之编译方法

# 下载
git clone git@github.com:bitcoin/bitcoin.git


# 安装必要软件
sudo aptitude install autoconf automake
sudo aptitude install libtool
sudo aptitude install pkg-config
sudo aptitude install libboost-all-dev
sudo aptitude search libssl-dev
sudo aptitude install libevent-dev

sudo aptitude install  libdb++-dev  libdb-dev    # 这个版本不合适


# 发现报错
configure: error: Found Berkeley DB other than 4.8, required for portable wallets (--with-incompatible-bdb to ignore)
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"

按照下面的方式安装
https://github.com/bitcoin/bitcoin/issues/3686
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix
../dist/configure --enable-cxx
make
sudo make install

# 生成Makefile文件
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"

# 编译
make -j 2 


StephenSun@debian-1:~/bitcoin$ ldd ./src/bitcoind 
.......
 libdb_cxx-4.8.so => not found 

StephenSun@debian-1:~/bitcoin$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/BerkeleyDB.4.8/lib
StephenSun@debian-1:~/bitcoin$ ldd ./src/bitcoind
......
        libdb_cxx-4.8.so => /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so (0x00007f3a51e41000)


# 开启调试模式 覆盖优化级别
#./configure CXXFLAGS="-g -O0 -I/usr/local/BerkeleyDB.4.8/include" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --enable-debug=true
# 如果libvent安装了多个版本， 版本报错， 则可以指定库的目录-L/usr/local/lib
./configure CXXFLAGS="-g -O0 -I/usr/local/BerkeleyDB.4.8/include" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib -L/usr/local/lib" --enable-debug=true


# 编译时的详细输出
# make V=1 

# 运行时
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/BerkeleyDB.4.8/lib:/usr/local/lib
