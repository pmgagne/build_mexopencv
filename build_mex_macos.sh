if [ -d dist/mexopencv ]
then
   rm -rf dist/mexopencv/*
else
   mkdir dist/mexopencv
fi

export PKG_CONFIG_PATH=$(pwd)/dist/lib/pkgconfig
cd mexopencv
git checkout 3.4.1.1

make clean MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1  -j2
make all MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1 CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 
make contrib MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1 CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 

cd ..
rm -rf dist/mexopencv/*
cp -r mexopencv/*.m dist/mexopencv
cp -r mexopencv/+mexopencv dist/mexopencv
cp -r mexopencv/+cv dist/mexopencv
cp -r mexopencv/opencv_contrib/+cv/* dist/mexopencv/+cv
cp -r dist/lib dist/mexopencv
cp -r mexopencv/test dist/mexopencv
cp -r mexopencv/samples dist/mexopencv
cp -r mexopencv/opencv_contrib/samples/* dist/mexopencv/samples
cp mexopencv_setup.m dist/mexopencv

for f in dist/mexopencv/+cv/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../lib $f
done

for f in dist/mexopencv/+cv/private/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../../lib $f
done

