%MEX_BUILD compile opencv bindings for Matlab or octave.

base_path = pwd
cd ('mexopencv')
addpath('.')
addpath('opencv_contrib')

mexopencv.make('clean', true, 'opencv_path', fullfile(base_path, 'dist'),'opencv_contrib', true);
mexopencv.make('opencv_path', fullfile(base_path, 'dist'),'opencv_contrib', true);

dst_path = fullfile(base_path, 'dist', 'mexopencv');
copyfile('Contents.m', dst_path);
copyfile('samples', fullfile(dst_path, 'samples'));
copyfile('+mexopencv', fullfile(dst_path, '+mexopencv'));
copyfile('test', fullfile(dst_path, 'test'));
copyfile('+cv', fullfile(dst_path, '+cv'));
copyfile(fullfile('opencv_contrib', '+cv'), fullfile(dst_path, '+cv'));
copyfile(fullfile('opencv_contrib', 'samples'), fullfile(dst_path, 'samples'));
copyfile('doc', fullfile(dst_path, 'doc'));
