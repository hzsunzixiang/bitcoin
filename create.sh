CURDIR=`pwd`
DIR=`pwd`


find -L $DIR/src -name "*.hpp" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" > cscope_my.files

cscope -bkq -i cscope_my.files  -f cscope_my.out

for i in  $DIR/src $DIR/src/rpc
do 
	cp .vimrc	$i/
done


