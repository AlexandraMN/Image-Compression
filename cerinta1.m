function A_k = cerinta1(image, k)
	% La aceasta cerinta am folosit functia svd din Matlab pentru a 
	% obtine matricele de descompunere ale lui A pe care le-am redimensionat
	% pentru a obtine o modelare matematica pentru o imagine alb-negru 
	% aproximativa a imaginii clare
	A = imread(image);
	[U S V] = svd(A);
	U = U(:, 1 : k);
	S = S(1 : k, 1 : k);
	V = V';
	V = V(1 : k, :);
	A_k = U * S * V;
endfunction