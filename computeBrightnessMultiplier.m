function [ b ] = computeBrightnessMultiplier( R, C)

% Using the two Matrices R and C we can compute weight b

    b = R^-1 * C;

end