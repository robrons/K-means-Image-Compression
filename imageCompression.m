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

%K-means implementation
max_iterations = 1; 

for iter = 1:max_iterations

  new_centers = zeros(size(centers)); 
  
  pixel_around = zeros(k, 1); 
  
  for i = 1
    for j = 1
      r = A(i, j, 1);
      g = A(i, j, 2); 
      b = A(i, j, 3); 
      
      diff = ones(k, 1) * ['r', 'g', 'n'] - centers; 
      %sum of squred error
      euclid_distance = sum(diff.^2, 2); 
      %helps find the index of the centeroid with the minimum distance
      [val ind] = min(euclid_distance);
      end
   end
   
end