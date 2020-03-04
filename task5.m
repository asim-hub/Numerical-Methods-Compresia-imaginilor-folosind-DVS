function task5(image)
  Matrix=double(imread(image));
  [m n]  = size (Matrix);
  k=[1:19 20:20:99 100:30:min(m,n)];
  [Ak S] = task3(image, k);
  
  %1
  subplot(2,2,1);
  a=zeros(1,max(m,n));
  %extrag diagonala
  for i=1:m
     for j=1:n
       if(i==j)
       a(i)=S(i,j);
       endif
     endfor
   endfor
  plot(a);
  title('Diag(S)'); 
  
  %2
  subplot(2,2,2);
   [m n]=size(Matrix);
   k=[1:19 20:20:99 100:30:min(m,n)];
   s1=0;
   for i=1:min(m,n)
     s1=s1 + S(i,i);
   endfor
   
   s2=0;
   l=length(k);
   val=zeros(1,l);
   
   for j=1:l 
    s2=0;
    for i=1:k(j)
      s2=s2+S(i,i);
    endfor
    val(j)=s2/s1;
  endfor
  plot(k,val);
  title('Informatie k-Z');  
  
  %3
  subplot(2,2,3);
  %nr de elemnete de pe Ox
  nr=length(k);
  M = randn(1, nr);
  i=nr;
  while i>=1
    M(1,i)=0;
    i--;
  endwhile

  %cele doua sume
  Sn=0;Sm=0;
  x=1;
 while x <= nr
    Sm= 0;
    %descompunerea redusa a valorilor singulare
   [Matrixk S] = task3(image, k(x));
    for i = 1 : m
      Sn = 0;
      for j = 1 : n
      d=(Matrix(i,j)-Matrixk(i,j))*(Matrix(i,j)-Matrixk(i,j));
      Sn=Sn+d;
      endfor
      Sm=Sm+Sn;
     endfor
    M(x)=Sm*(1/(m*n));
  x++;
  endwhile
  plot(k,M);
  title('Eroare de aproximare');
  
  %4
  subplot(2,2,4);
  nr=length(k);
  Rc = randn(1, nr);
  for i=1:nr:1
    Rc(1,i)=0;
  endfor
  
  S=0;
  for i = 1 : nr
  Rc(i)=(k(i) * 2 + 1)/(n);
  endfor
  plot(k,Rc);
  title('Rata de compresie');
  
  
  
end