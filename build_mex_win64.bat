if exist dist\mexopencv (
   rmdir /s /q dist\mexopencv
)

mkdir dist\mexopencv

cd mexopencv
git checkout 3.4.11
cd ..

copy /y mexopencv_setup.m mexopencv
copy /Y dist\x64\vc16\bin\*dll mexopencv\lib
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "cd mexopencv;mexopencv_setup;addpath('utils');MDoc('-clean'); MDoc; quit"


mkdir /y dist\mexopencv\bin
copy /y dist\x64\vc16\bin\*.exe dist\mexopencv\bin
copy /y mexopencv\*.m  mexopencv\README.markdown mexopencv\info.xml  dist\mexopencv
copy /y mexopencv\+cv dist\mexopencv
copy /y mexopencv\+mexopencv dist\mexopencv
copy /y mexopencv\doc dist\mexopencv
copy /y mexopencv\samples dist\mexopencv
copy /y mexopencv\test dist\mexopencv