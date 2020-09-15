source ./venv/bin/activate
cd build
cmake -D CMAKE_BUILD_TYPE=Release \
   -DOPENCV_EXTRA_MODULES_PATH=../contrib/modules \
   -DCMAKE_INSTALL_PREFIX=../lib \
   -D BUILD_opencv_world=ON \
   -D BUILD_NEW_PYTHON_SUPPORT=ON \
   -D BUILD_opencv_python3=ON \
   -D HAVE_opencv_python3=ON \
   -D PYTHON3_INCLUDE_DIR=../venv/include \
   -D PYTHON3_PACKAGES_PATH=../venv/lib/python3.*/site-packages \
   -D OPENCV_GENERATE_PKGCONFIG=ON \
   -D BUILD_opencv_caffe=OFF \
   -DBUILD_opencv_text=ON \
   -DOPENCV_ENABLE_NONFREE=ON \
   ../opencv
make -j2
make install

# -DWITH_MATLAB=0
#-DPYTHON3_EXECUTABLE=${SRC_DIR}/py3/bin/python                          \
#    -DPYTHON3_INCLUDE_DIR=${SRC_DIR}/py3/include/python3.7m                 \
#    -DPYTHON3_NUMPY_INCLUDE_DIRS=${SRC_DIR}/py3/lib/python3.7/site-packages/numpy/core/include   \
#    -DPYTHON3_LIBRARY=${SRC_DIR}/py3/lib/libpython3.7m.${DYNAMIC_EXT}       \
#    -DPYTHON3_PACKAGES_PATH=${SRC_DIR}/py3/lib/python3.7/site-packages   
