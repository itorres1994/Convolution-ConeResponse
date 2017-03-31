function [ L, C ] = grayworld(I)

% Take in image I and calculate L and C

    im = imread(I);
    
    length = size(im); % Give the size range of the image
    
    red_channel = im(:,:,1);
    green_channel = im(:,:,2);
    blue_channel = im(:,:,3);
    
    % Take the averages of the pixel values
    r_avg = sum(sum(red_channel))/(length(1)*length(2));
    g_avg = sum(sum(green_channel))/(length(1)*length(2));
    b_avg = sum(sum(blue_channel))/(length(1)*length(2));
    
    % Get the true color channels using gray world assumption
    true_color_red = red_channel * (128/r_avg);
    true_color_green = green_channel * (128/g_avg);
    true_color_blue = blue_channel * (128/b_avg);
    
    % Set the value of L based off of the average values calculated
    L = [r_avg/128 g_avg/128 b_avg/128];
    
    % Concatenate the real color channel values back into a 3D matrix
    C = cat(3,true_color_red, true_color_green, true_color_blue);
    
    imagesc(C); axis image off;

end