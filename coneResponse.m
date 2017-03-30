function [ R ] = coneResponse( F1, F2, F3, Sr, Sg, Sb )
% This function will calculate the cone responses of S
% based on the values of the F matrices
 
    % First we must calculate the Responses of R_F,c -> R_F_c
 
    R_F1 = [sum(F1.*Sr); sum(F1.*Sg); sum(F1.*Sb)];
    R_F2 = [sum(F2.*Sr); sum(F2.*Sg); sum(F2.*Sb)];
    R_F3 = [sum(F3.*Sr); sum(F3.*Sg); sum(F3.*Sb)];
    
    % Organize the Responses of R_F,c into a matrix R
    R = [R_F1 R_F2 R_F3];
 
 
end