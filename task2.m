function task2(image)
   Matrix=double(imread(image));
   %1
   %împart figura curentă într-o rețea mxn și creeaz axe în poziția specificată de p
   subplot(2,2,1);
   [U S V] = svd(Matrix);
   [m n]=size(S);
   %extrag valorile proprii ale lui a
   a=zeros(1,max(m,n));
   for i=1:m
     for j=1:n
       if(i==j)
       a(i)=S(i,j);
       endif
     endfor
   endfor   
   plot(a);
   title('Grafic valori singulare');
   
   %2
   subplot(2,2,2);
   [m n]=size(Matrix);
   k=[1:19 20:20:99 100:30:min(m,n)];
   s1=0;
   for i=1:min(m,n)
     s1=s1 + S(i,i);
   endfor
   l=length(k);
   s2=0;
   val=zeros(1,l);
   
   for j=1:l 
    s2=0;
    for i=1:k(j)
      s2=s2+S(i,i);
    endfor
    val(j)=s2/s1;
  endfor
  plot(k,val);
  title('Grafic k si informatia data de primele k valori singulare');

%3
  subplot(2,2,3);
  %nr de elemnete de pe Ox
  nr=length(k);
  M = randn(1, nr);
  for i=1:nr:1
    M(1,i)=0;
  endfor

  %cele doua sume
  Sn=0;Sm=0;
  
  for x = 1 : nr
    Sm= 0;
    %descompunerea redusa a valorilor singulare
    Matrixk = task1(image,k(x));
    for i = 1 : m
      Sn = 0;
      for j = 1 : n
      d=(Matrix(i,j)-Matrixk(i,j))*(Matrix(i,j)-Matrixk(i,j));
      Sn=Sn+d;
      endfor
      Sm=Sm+Sn;
     endfor
    M(x)=Sm*(1/(m*n));
  endfor
  plot(k,M);
  title('Eroarea de aproximare');
  
  %4
  subplot(2,2,4);
  nr=length(k);
  Rc = randn(1, nr);
  for i=1:nr:1
    Rc(1,i)=0;
  endfor
  
  S=0;
  for i = 1 : nr
  Rc(i)=(k(i) * m + k(i) * n + k(i))/(m*n);
  endfor
  plot(k,Rc);
  title('Rata de compresie');
  end