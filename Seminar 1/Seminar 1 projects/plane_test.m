image = imread(['..' filesep '..' filesep 'Imagini pentru seminar' filesep 'Veverite.png']);
figure
    imshow(image(:, :, 1));
    title("Red plane");
figure
    imshow(image(:, :, 2));
    title('Green plane');
figure
    imshow(image(:, :, 3));
    title("Blue plane");
figure
    imshow(image(:, :, 1:2);
    title("RG plane");
figure
    imshow(image(:, :, 1:3);
    title("RGB plane");

imR = zeros(size(image));
imR(:, :, 1) = image(:, :, 1);
figure
    imshow(imR);

imG=uint8(zeros(size(image)));
imG(:,:,2)=image(:,:,2);
imshow(imG);

imB=uint8(zeros(size(image)));
imB(:,:,3)=imagine(:,:,3);
imshow(imB);

imshow(imR + imG + imB);

image(150:250, 100:240, 1) = 255;
imshow(image);

