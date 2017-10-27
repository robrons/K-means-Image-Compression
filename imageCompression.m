% Read the image as a 3 dimensional matrix

clc; 
 

A = double(imread('bird_small.tiff'));

% create 16 random centeroids


dim = size(A, 1); 

k = 16; 

centers = zeros(k, 3);  

x_rand = ceil(dim*rand(dim,1))

y_rand = ceil(dim*rand(dim,1))

for i = 1:k
  centers(i,:) = A(x_rand(i), y_rand(i),:); 
end
