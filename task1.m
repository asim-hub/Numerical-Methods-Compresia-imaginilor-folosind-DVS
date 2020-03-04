function A_k = task1(image, k)
  %citire imagine
  Matrix=double(imread(image));
  %descompunerea valorilor singulare ale lui Matrix
  [U S V] = svd(Matrix);
  %eliminarea valorilor singulare
  %a liniei si a coloanei corespunzatoare
  %elimin coloanele de la 1 la k
  Uk=U(:,1:k);
  %elimin liniile si coaloanele de la 1 la k
  Sk=S(1:k,1:k);
  %fac transpusa lui V
  V=V';
  %elimin liniile de la 1 la k
  Vk=V(1:k,:);
  %descompunerea redusa a valorilor singulare
  A_k=Uk*Sk*Vk;
end