function [ hybrid_image ] = hybridImage(im1, im2, sigma1, sigma2)

% Make a hybrid image with im1 and im2 based on sigma1 and sigma2 for
% Gaussian values
    
    % Get the images
    image1 = imread(im1);
    image2 = imread(im2);
    
    % Get the color channels
    red_channel_im1 = image1(:,:,1);
    green_channel_im1 = image1(:,:,2);
    blue_channel_im1 = image1(:,:,3);
    
    red_channel_im2 = image2(:,:,1);
    green_channel_im2 = image2(:,:,2);
    blue_channel_im2 = image2(:,:,3);

    % Get Gaussian filters
    first_conv = fspecial('gaussian', 6*sigma1 + 1, sigma1);
    second_conv = fspecial('gaussian', 6*sigma2 + 1, sigma2);
    
    % Get the color channel convolutions
    red_conv1 = conv2(double(red_channel_im1), first_conv, 'same');
    green_conv1 = conv2(double(green_channel_im1), first_conv, 'same');
    blue_conv1 = conv2(double(blue_channel_im1), first_conv, 'same');
    
    red_conv2 = conv2(double(red_channel_im2), second_conv, 'same');
    green_conv2 = conv2(double(green_channel_im2), second_conv, 'same');
    blue_conv2 = conv2(double(blue_channel_im2), second_conv, 'same');
    
    % Combine color convolutions both are blurry
    image1_conv = cat(3, uint8(red_conv1), uint8(green_conv1), uint8(blue_conv1));
    image2_conv = cat(3, uint8(red_conv2), uint8(green_conv2), uint8(blue_conv2));
    
    % Hybridize the images
    sharp_image2 = image2 - image2_conv;
    hybrid_image = image1_conv + sharp_image2;
    
end