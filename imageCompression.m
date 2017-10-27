% Read the image as a 3 dimensional matrix

A = double(imread('bird_small.tiff')); 

X = randsample(A, 1); 

display(X); 
