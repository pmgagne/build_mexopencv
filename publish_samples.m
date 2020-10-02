%%
publish_files = dir(fullfile('mexopencv', 'samples', '*.m'));

for f_idx = 1:length(publish_files)
    
    fname = fullfile(publish_files(f_idx).folder, publish_files(f_idx).name);
    fprintf('%s\n',fname);
    try
        publish(fname, 'evalCode', false);
    catch me
        warning('Error\n');
    end
end
%%
publish_files = dir(fullfile('mexopencv', 'opencv_contrib', 'samples', '*.m'));

for f_idx = 1:length(publish_files)
    
    fname = fullfile(publish_files(f_idx).folder, publish_files(f_idx).name);
    fprintf('%s\n',fname);
    try
        publish(fname, 'evalCode', false);
    catch me
        warning('Error\n');
    end
end
%%
cd mexopencv
builddocsearchdb(fullfile(pwd, 'doc'));
cd ..
