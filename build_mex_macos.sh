if [ -d dist/mexopencv ]
then
   rm -rf dist/mexopencv/*
else
   mkdir dist/mexopencv
fi

export PKG_CONFIG_PATH=$(pwd)/dist/lib/pkgconfig
cd mexopencv
git checkout 3.4.11

make clean MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1
make all MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1  CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 
make contrib MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1 LDFLAGS="-lopencv_img_hash" CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 

cd ..

cp -r mexopencv/opencv_contrib/+cv/* mexopencv/+cv
cp -r mexopencv/opencv_contrib/samples/* mexopencv/samples
cp -r mexopencv/opencv_contrib/test/* mexopencv/test
cp  dist/lib/*.dylib mexopencv/lib

for f in mexopencv/+cv/*.mexmaci64
do
   install_name_tool -delete_rpath @loader_path/../../lib $f
   install_name_tool -delete_rpath @loader_path/../../../lib $f
   install_name_tool -add_rpath @loader_path/../lib $f
done

for f in mexopencv/+cv/private/*.mexmaci64
do
   install_name_tool -delete_rpath @loader_path/../../../lib $f
   install_name_tool -add_rpath @loader_path/../../lib $f
done

/Applications/MATLAB_R2019b.app/bin/matlab -nodesktop -wait -sd . -r "cd mexopencv;addpath(pwd);addpath(fullfile(pwd, 'utils'));MDoc('-clean');MDoc; quit"

rm -rdf dist/mexopencv/*
mkdir dist/mexopencv/lib

cp mexopencv/*.m dist/mexopencv
cp -r mexopencv/+mexopencv dist/mexopencv
cp -r mexopencv/+cv dist/mexopencv
cp -r dist/lib/* dist/mexopencv/lib
cp -r mexopencv/test dist/mexopencv
cp -r mexopencv/samples dist/mexopencv
cp mexopencv_setup.m dist/mexopencv
cp -r mexopencv/doc dist/mexopencv

