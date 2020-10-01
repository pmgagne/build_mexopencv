if exist dist\mexopencv (
   rmdir /s /q dist\mexopencv
)

mkdir dist\mexopencv

cd mexopencv
git checkout 3.4.11
git pull
cd ..

copy /y mexopencv_setup.m mexopencv
copy /y mexopencv_win64.prj mexopencv
xcopy /s dist mexopencv\opencv\

"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"

mkdir  dist\mexopencv\bin

xcopy dist\x64\vc16\bin\*.exe dist\mexopencv\bin\
xcopy mexopencv\*.m  mexopencv\README.markdown mexopencv\info.xml  dist\mexopencv\
xcopy /s mexopencv\+cv dist\mexopencv\+cv\
xcopy /s mexopencv\+mexopencv dist\mexopencv\+mexopencv\
xcopy /s mexopencv\doc dist\mexopencv\doc\
xcopy /s mexopencv\samples dist\mexopencv\samples\
xcopy /s mexopencv\test dist\mexopencv\test\
xcopy /s mexopencv\lib dist\mexopencv\lib\
