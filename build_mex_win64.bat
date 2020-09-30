if exist dist\mexopencv (
   rmdir /s /q dist\mexopencv
)

mkdir dist\mexopencv

cd mexopencv
git checkout 3.4.11
cd ..

copy mexopencv_setup.m mexopencv
copy dist\x64\vc16\bin\*dll mexopencv\lib
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "cd mexopencv;mexopencv_setup;addpath('utils');MDoc('-clean'); MDoc; quit"


mkdir dist\mexopencv\bin
copy dist\x64\vc16\bin\*.exe dist\mexopencv\bin
copy mexopencv\*.m  mexopencv\README.markdown mexopencv\info.xml  dist\mexopencv
copy mexopencv\+cv dist\mexopencv
copy mexopencv\+mexopencv dist\mexopencv
copy mexopencv\doc dist\mexopencv
copy mexopencv\samples dist\mexopencv
copy mexopencv\test dist\mexopencv