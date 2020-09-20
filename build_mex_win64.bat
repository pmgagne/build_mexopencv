if exist dist\mexopencv (
   del /s /q dist\mexopencv
) else (
   mkdir dist\mexopencv
)

cd mexopencv
git checkout 3.4.1.1
cd ..

"C:\Program Files\MATLAB\R2020a\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"

mkdir dist\mexopencv\bin
copy dist\x64\vc16\bin dist\mexopencv\bin