function [A_k S] = task3(image, k)
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
  Z=Matrix'/sqrt(n-1);
  %4:construies DVS pentru matricea Z
  [U S V]=svd(Z);
  %5:extrag din matricea V primele k coloane
  W=V(:,1:k);
  %6:proiectia lui Matrix
  Y=W'*Matrix;
  %7:Aproximam matricea A_k
  A_k=W*Y;
  [m n]=size(A_k);
  for i=1:m
    for j=1:n
      A_k(i,j)=A_k(i,j) + M(i);
    endfor
  endfor
   
endfunction