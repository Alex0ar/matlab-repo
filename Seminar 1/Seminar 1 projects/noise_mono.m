function [fo] = noise_mono(fi, s_max, tip)
    photo = imread(fi);
    [m, n, p] = size(photo);
    figure 
        imshow(photo);
        title('Initial image');
    if p > 1
        fo = '';
        disp('Image has more them 1 plane, cannot proccess');
    else
        sigma = unifrnd(0, s_max, m, n);
        noise = normrnd(0, sigma, m, n);
        new_photo = uint8(double(photo) + noise);

        figure
            imshow(new_photo);
            title('distorted photo')
        fo = [fi '_noise.' tip];
        imwrite(new_photo, fo, tip);
    end
end


