%MEX_BUILD compile opencv bindings for Matlab or octave.

base_path = pwd
cd ('mexopencv');
addpath(pwd);
addpath(fullfile(pwd,'opencv_contrib'));
addpath(fullfile(pwd,'utils'));

mexopencv.make('clean', true, 'opencv_path', fullfile(base_path, 'dist'),'opencv_contrib', true);
mexopencv.make('opencv_path', fullfile(base_path, 'dist'),'opencv_contrib', true);

copyfile(fullfile(pwd, 'opencv_contrib', '+cv'), fullfile(pwd, '+cv'));
copyfile(fullfile(pwd, 'opencv_contrib', '+cv', 'private'), fullfile(pwd, '+cv', 'private'));
copyfile(fullfile(pwd, 'opencv_contrib', 'samples'), fullfile(pwd, 'samples'));
copyfile(fullfile(pwd, 'opencv_contrib', 'test'), fullfile(pwd, 'test'));
