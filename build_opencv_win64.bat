rem Force l'utilisation de visual studio 2019
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat
set dll_output=vc16

cd opencv
git checkout 3.4.1
cd ..\contrib
git checkout 3.4.1
cd ..

if exist dist (
    del /F /S /Q dist
) else (
    mkdir dist
)

if exist build (
    del /F /S /Q build
) else (
    mkdir build
)

cd build

cmake   ^
   -D CMAKE_BUILD_TYPE=Release ^
   -D OPENCV_EXTRA_MODULES_PATH=..\contrib\modules ^
   -D BUILD_TESTS=OFF ^
   -D BUILD_PERF_TESTS=OFF ^
   -D CMAKE_INSTALL_PREFIX=..\dist ^
   -D BUILD_opencv_world=OFF ^
   -D BUILD_opencv_python2=OFF ^
   -D BUILD_opencv_python3=ON ^
   -D OPENCV_GENERATE_PKGCONFIG=ON ^
   -D OPENCV_ENABLE_NONFREE=ON ^
   -D INSTALL_C_EXAMPLES=OFF ^
   -D WITH_PROTOBUF=ON ^
   -D BUILD_opencv_stereo=OFF ^
   -D WITH_CUDA=0 ^
   ..\opencv

cmake --build . --target install --config Release

cd ..

rem    -D PYTHON3_EXECUTABLE=/usr/local/bin/python3 ^
