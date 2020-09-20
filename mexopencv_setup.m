%MEXOPENCV_SETUP prepare mexopencv paths
%
% Note: this file must be in the base directory of mexopencv package.

base_path = fileparts(mfilename('fullpath'));
addpath(base_path);

if ispc
    bin_path = fullfile(base_path, 'bin');
    prev_path = getenv('PATH');
    prev_parts = split(prev_path, ';');
    if ~any(strcmpi(bin_path, prev_parts))
        setenv('PATH', [bin_path, ';', getenv('PATH')]);
    end
end
