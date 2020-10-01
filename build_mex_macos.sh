export PKG_CONFIG_PATH=$(pwd)/dist/lib/pkgconfig
cd mexopencv
git checkout 3.4.11
git pull

cp -R ../dist opencv
cp ../mexopencv_setup.m .
cp ../mexopencv_mac64.prj .

make clean MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1
make all MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1  CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 
make contrib MATLABDIR=/Applications/MATLAB_R2019b.app PKG_CONFIG_OPENCV=opencv WITH_CONTRIB=1 LDFLAGS="-lopencv_img_hash" CXXFLAGS="CFLAGS='$CFLAGS -Wno-deprecated-declarations -Wno-potentially-evaluated-expression'" 

for f in +cv/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../opencv/lib $f
done

for f in +cv/private/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../../opencv/lib $f
done

for f in opencv_contrib/+cv/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../../opencv/lib $f
done

for f in opencv_contrib/+cv/private/*.mexmaci64
do
   install_name_tool -add_rpath @loader_path/../../../opencv/lib $f
done

/Applications/MATLAB_R2019b.app/bin/matlab -nodesktop -sd . -r "addpath(pwd);addpath(fullfile(pwd, 'utils'));MDoc('-clean');MDoc('-wiki');MDoc; quit"

# rm -rdf dist/mexopencv/*
# mkdir dist/mexopencv/lib
# mkdir dist/mexopencv/opencv_contrib

# cp mexopencv/*.m dist/mexopencv
# cp -r mexopencv/+mexopencv dist/mexopencv
# cp -r mexopencv/+cv dist/mexopencv
# cp -r dist/lib/* dist/mexopencv/lib
# cp -r mexopencv/test dist/mexopencv
# cp -r mexopencv/samples dist/mexopencv
# cp -r mexopencv/opencv_contrib/test dist/mexopencv/opencv_contrib
# cp -r mexopencv/opencv_contrib/samples dist/mexopencv/opencv_contrib

# cp mexopencv_setup.m dist/mexopencv
# cp -r mexopencv/doc dist/mexopencv

