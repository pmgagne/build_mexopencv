%MEX_BUILD compile opencv bindings for Matlab or octave.


cd ('mexopencv');
base_path = pwd
addpath(pwd);
addpath(fullfile(pwd,'opencv_contrib'));
addpath(fullfile(pwd,'utils'));

mexopencv.make('clean', true, 'opencv_path', 'opencv','opencv_contrib', true);
mexopencv.make('opencv_path', 'opencv','opencv_contrib', true);

MDoc('-clean');
MDoc('-wiki');
MDoc;

copyfile(fullfile(pwd, 'opencv_contrib', '+cv'), fullfile(pwd, '+cv'));
copyfile(fullfile(pwd, 'opencv_contrib', '+cv', 'private'), fullfile(pwd, '+cv', 'private'));
