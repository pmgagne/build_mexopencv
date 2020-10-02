base = pwd;
%%
publish_files = dir(fullfile('samples', '*.m'));

cd('samples');
for f_idx = 1:length(publish_files)
    fprintf('%s\n',publish_files(f_idx).name);
    try
        publish(publish_files(f_idx).name, 'evalCode', false);
    catch me
        warning('Error\n');
    end
end
%%
cd(base)
publish_files = dir(fullfile('opencv_contrib', 'samples', '*.m'));

cd(fullfile('opencv_contrib', 'samples'));
for f_idx = 1:length(publish_files)
    fprintf('%s\n',publish_files(f_idx).name);
    try
        publish(publish_files(f_idx).name, 'evalCode', false);
    catch me
        warning('Error\n');
    end
end

cd(base);
