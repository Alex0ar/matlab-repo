function [fo] = noise_rgb_test(fi, s_max, type)
    photo = imread(fi);
    [m, n, p] = size(photo);
    figure
        imshow(photo);
        title('Initial photo');

    R = double(photo);
    for i = 1 : p
        sigma = unifrnd(0, s_max, m, n);
        noise = normrnd(0, sigma, m, n);
        R(:, :, i) = R(:, :, i) + noise;
    end

    R = uint8(R);
    figure
        imshow(R);
        title('Distorted photo');
    fo = [fi '_noise.' type];
    imwrite(R, fo, type);
end