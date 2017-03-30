function [ C ] = conv2rgb(A, B)

% Convolving the image A with filter B

    % Get the image
    im = imread(A);
    
    % Get the color channels
    red_channel = im(:,:,1);
    green_channel = im(:,:,2);
    blue_channel = im(:,:,3);
    
    % Time to convolve the individual color channels with respect
    % to the filter B provided
    
    red_conv = conv2(double(red_channel), B, 'same');
    green_conv = conv2(double(green_channel), B, 'same');
    blue_conv = conv2(double(blue_channel), B, 'same');
    
    % Concatenate all of the convolved color channels into one image C
    C = cat(3, uint8(red_conv), uint8(green_conv), uint8(blue_conv));

end