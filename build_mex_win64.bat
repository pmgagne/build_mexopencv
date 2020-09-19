if exist dist\mexopencv (
   del /s /q dist\mexopencv
) else (
   mkdir dist\mexopencv
)

"C:\Program Files\MATLAB\R2020a\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"