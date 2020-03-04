function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %1extrag media similar pasilor 1 si 3.
  image = double( rgb2gray ( imread ( image_path ) ) );
  T[];
  [nrl nrc]=size(image);
  l=1;
  for i=1:nrl
    for j=1:nrc
      T(l,1)=image(i,j);
      l++;
    endfor
  endfor
  
  %se calculeaza proiectia imaginii de test in spatiul fetelor 
  prtestimage = ( eigenfaces' ) * (T-m);
  % Se determina cea mai mica distanta intre proiectia imaginii de test
  % obtinuta la pasul 7 si proiectiile obtinute la pasul 5
  min_dist=norm(prtestimage(:,1) - pr_img(:,1));
  output_img_index=1;
  for i = 2:size(pr_img,2)
     if ( norm(prtestimage(:i) - pr_img(:,i)) < min_dist )
       min_dist= norm(prtestimage(:i) - pr_img(:,i));
       output_img_index=i;
       endif
   endfor
  
  
end