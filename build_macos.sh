source ../venv/bin/activate
cd build
cmake -D CMAKE_BUILD_TYPE=Release \
   -DOPENCV_EXTRA_MODULES_PATH=../contrib/modules \
   -DCMAKE_INSTALL_PREFIX=../lib \
   -DBUILD_NEW_PYTHON_SUPPORT=ON \
   -D BUILD_opencv_python3=ON \
   -D HAVE_opencv_python3=ON \
   -DOPENCV_GENERATE_PKGCONFIG=ON \
   ../opencv
make
make install

