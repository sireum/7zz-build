rm -fR cosmocc* 7zip
curl -JLO https://github.com/jart/cosmopolitan/releases/download/$COSMOCC_V/cosmocc-$COSMOCC_V.zip
mkdir cosmocc
cd cosmocc
unzip ../cosmocc-$COSMOCC_V.zip
cd bin
ln -s cosmocc cc
ln -s cosmoc++ c++
cd ../..
export PATH=`pwd`/cosmocc/bin:$PATH
git clone https://github.com/ip7z/7zip
cd 7zip
git checkout $P7ZIP_V
git grep -lz "GetLastError" | xargs -0 sed -i'' -e 's/GetLastError/Get7zLastError/g'
git grep -lz "SetLastError" | xargs -0 sed -i'' -e 's/SetLastError/Set7zLastError/g'
git grep -lz "-Werror" | xargs -0 sed -i'' -e 's/-Werror//g'
cd CPP/7zip/Bundles/Alone2
make -j -f makefile.gcc
cp _o/7zz $GITHUB_WORKSPACE
