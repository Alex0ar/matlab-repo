function fo = blur_net(inputFile)
    fileId = fopen(inputFile, 'r');
    line = fgetl(fileId);
    position = strfind(line, ".png");
    photoPath = line(1:position + 3);
    numbersString = line(position + 4:end);
    editsNb = sscanf(numbersString, "%d", 1);
    photo = imread(photoPath);

    numbers = sscanf(numbersString, "%f");
    numbers = numbers(2:end);

    for i = 1:editsNb
        coordinates = numbers(4 * (i - 1) + 1 : 4 * (i - 1) + 4);
        startX = coordinates(1);
        stopX = coordinates(2);
        startY = coordinates(3);
        stopY = coordinates(4);
        centerX = (startX + stopX) / 2;
        centerY = (startY + stopY) / 2;
        radius = min(stopX - startX, stopY - startY) / 2;
        x = startX:stopX;
        y = startY:stopY;
        [X, Y] = meshgrid(x, y);
        mask = (X - centerX).^2 + (Y - centerY).^2 <= radius ^ 2;
        rectangle = photo(startY:stopY, startX:stopX, :);
        photo(startY:stopY, startX:stopX, :) = blurr_area(rectangle, mask);
    end
    figure
        imshow(photo);
    fo = [fi '_blurred.png'];
    imwrite(photo, fo);
end

function area = blurr_area(area, mask)
    [m, n, p] = size(area);
    sigma = unifrnd(0, 2000, m, n);
    noise = normrnd(0, sigma, m, n);
    for k = 1:p
        currentPlane = area(:, :, k);
        currentPlane(mask) = uint8(double(currentPlane(mask)) + noise(mask));
        area(:, :, k) = currentPlane;
    end
end

