function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %1Se citeste fiecare imagine aflata in directoruldatasetsi se transforma intr-un
  %vector coloana. Toti vectorii obtinuti se pun intr-o matriceT.
  k=1;
  while k=<10
	  image = sprintf ("%s/%d.jpg",database_path,i);
	  newimage = double (rgb2gray(imread(image)));
	  T = [T  newimage(:)];
    k++;
  endwhile
  %2Se calculeaza media pe fiecare linie din matricea T.
  %Rezultatele obtinute se vor salva in vectorul m.
  m[];
  [nrlinii nrcoloane] = size (T);
  for i = 1 : nrlinii
    media=sum(A(:,i))/nrcoloane;
    m(i)=media;    
  endfor
  %3Se calculeaza matriceaA=T-m.
  A = T - (m');
  m = m';
  %4Se calculeaza matricea cu fetele proprii EigFaces=A∗V, unde matricea V contine
  %vectorii proprii corespunzatori valorilor proprii mai mari decat 1 ale matricei AT∗A.
  %EigFaces reprezinta spatiul fetelor.
  %valorile proprii
  [W D] = eig(A' * A);
  % val proprii mai mari decat 1
  i=1;
  while ( i <= 1:size(D,1) )
    if ( D(i,i) > 1 )
      V = [V  W(:,i)];
    endif
    i++;
  endwhile
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
  end