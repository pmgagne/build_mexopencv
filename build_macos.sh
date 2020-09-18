source venv/bin/activate
rm -rf dist/*
rm -rf build/*
cd build
cmake -D CMAKE_BUILD_TYPE=Release \
   -DOPENCV_EXTRA_MODULES_PATH=../contrib/modules \
   -D BUILD_TESTS=OFF \
   -D BUILD_PERF_TESTS=OFF \
   -DCMAKE_INSTALL_PREFIX=../dist \
   -D BUILD_opencv_world=OFF \
   -D BUILD_opencv_python2=OFF \
   -D BUILD_opencv_python3=ON \
   -D PYTHON3_EXECUTABLE=/usr/local/bin/python3 \
   -D OPENCV_GENERATE_PKGCONFIG=ON \
   -D OPENCV_ENABLE_NONFREE=ON \
   -D INSTALL_C_EXAMPLES=OFF \
   -D WITH_PROTOBUF=ON \
   -D BUILD_opencv_stereo=OFF \
   -D BUILD_opencv_img_hash=ON \
   ../opencv
make -j2
make install

# -DWITH_MATLAB=0
#-DPYTHON3_EXECUTABLE=${SRC_DIR}/py3/bin/python                          \
#    -DPYTHON3_INCLUDE_DIR=${SRC_DIR}/py3/include/python3.7m                 \
#    -DPYTHON3_NUMPY_INCLUDE_DIRS=${SRC_DIR}/py3/lib/python3.7/site-packages/numpy/core/include   \
#    -DPYTHON3_LIBRARY=${SRC_DIR}/py3/lib/libpython3.7m.${DYNAMIC_EXT}       \
#    -DPYTHON3_PACKAGES_PATH=${SRC_DIR}/py3/lib/python3.7/site-packages   
#-D CMAKE_INSTALL_PREFIX=$(python -c "import sys; print(sys.prefix)") \
#-D BUILD_opencv_caffe=OFF \
# -D BUILD_NEW_PYTHON_SUPPORT=ON \
# -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
#  -D PYTHON3_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
