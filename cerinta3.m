function [A_k S] = cerinta3(image, k)
	% Scopul acestei cerinte a fost de a analiza componentele principale
	% de a transforma dintr-un spatiu dimensional R^m intr-un spatiu dimensional
	% R^k, unde k este numarul de componente principale.
	% Algoritmul utilizat se bazeaza pe metoda DVS pentru a-l calcula pe Z.
	A = imread(image);
	A = double(A);
	[m, n] = size(A);
	miu = zeros(m, 1);
	for i = 1 : m
		for j = 1 : n
			miu(i, 1) = miu(i, 1) + A(i, j);
		endfor
		miu(i) = miu(i) / n;
		A(i, :) = A(i, :) .- miu(i);
	endfor
	Z = A'./ sqrt(n - 1);
	[U S V] = svd(Z);
	W = V(:, 1 : k);
	Y = W' * A;
	A_k = W * Y .+ miu;
endfunction
