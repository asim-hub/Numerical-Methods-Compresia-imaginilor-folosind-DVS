function [A_k S] = task4(image, k)
   Matrix=double(imread(image));
  [m n]=size(Matrix);
  M=zeros(m,1);
  
  %1:am calculat media fiecarui vector a_i in M_i
  for i=1:m
    for j=1:n
    M(i)=M(i)+Matrix(i,j);
    endfor
    M(i)=M(i)/n;
  endfor
  %2:ectualizez vectorii a_i
  for i=1:m
    for j=1:n
      Matrix(i,j)=Matrix(i,j)-M(i);
    endfor
   endfor
  %3:construiesc Z
  aux=Matrix';
  Z=(Matrix*aux)/(n-1);
  %4:extrag vectorii si valorile proprii
  [V S]=eig(Z);
  %5:extrag primele k coloane din vectorul v
  W=V(:,1:k);
  %6 
  Y=(W')*Matrix;
  %7
  A_k=W*Y;
  [m n]=size(A_k);
  for i=1:m
    for j=1:n
      A_k(i,j)=A_k(i,j) + M(i);
    endfor
  endfor
  
  
endfunction