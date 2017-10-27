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

nearest_mean = zeros(dim)

%K-means implementation
max_iterations = 100; 

for iter = 1:max_iterations

  new_centers = zeros(size(centers)); 
  
  pixel_around = zeros(k, 1); 
  
  for i = 1:dim
    for j = 1:dim
      r = A(i, j, 1);
      g = A(i, j, 2); 
      b = A(i, j, 3); 
      
      diff = ones(k, 1) * ['r', 'g', 'n'] - centers; 
      
      %sum of squred error
      euclid_distance = sum(diff.^2, 2); 
      
      %helps find the index of the centeroid with the minimum distance
      [val ind] = min(euclid_distance);
      
      nearest_mean(i, j) = ind;
      
      %Calculation for the new centeroid
      
      new_centers(ind, 1) = new_centers(ind, 1) + r;
      new_centers(ind, 2) = new_centers(ind, 2) + g;
      new_centers(ind, 2) = new_centers(ind, 2) + b;
      
      %adding the pixels that are near to the centeroid
      pixel_around(ind) = pixel_around + 1; 
      
      end
   end
   
   for i = 1:k
    if(pixel_around(i) > 0)
      new_centers(i, :) = new_centers(i, :)./pixel_around(i); 
    end 
   end 
   
   %test for convergence
   d = sum(sqrt(sum((new_centers - center).^2), 2))
   if(d < 1e-5)
    break
   end
   
   centers = new_centers;  
   
end
disp(itr)

centers = round(centers)


%calculation for the larger image
larger_img = double(imread('bird_large.tiff'));
larger_dim = size(larger_img, 1); 

for i = 1:larger_dim
    for j = 1:larger_dim
      r = larger_img(i, j, 1);
      g = larger_img(i, j, 2); 
      b = larger_img(i, j, 3); 
      
      diff = ones(k, 1) * ['r', 'g', 'n'] - centers; 
      
      euclid_distance = sum(diff.^2, 2); 
      
      [val ind] = min(euclid_distance);
      
      larger_img(i, j, :) = centers(ind, :); 
      
     end
 end
 

imshow(uint8(round(large_image))); hold off

% Save image
imwrite(uint8(round(large_image)), 'bird_kmeans.jpg');

