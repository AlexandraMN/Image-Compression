function cerinta5()
	% Am ales imaginile pe care urmeaza sa fac graficele
	image1 = 'in/images/image1.gif';
	image2 = 'in/images/image2.gif';

	% Am facut mai intai pentru imaginea 1 graficele
	A1 = imread(image1);
	A1 = double(A1);

	% Pentru cerinta 5.1 am aflat cu ajutorul cerintei 3 matricea S 
	% care contine valorile singulare si le-am pus intr-un vector
	% Am realizat graficul valorilor in functie de un vector care are 
	% aceeasi lungime cu numarul de linii
	[m1, n1] = size(A1);
	min1 = min(m1, n1);
	[A_K1 S1] = cerinta3(image1, min1);
	v = diag(S1);
	subplot(2, 4, 1);
	plot(1 : m1, v);
	title('Imaginea1, cerinta5.1')

	% Cerinta 5.2
	% Am afalt informatia data de primele k valori singulare, alegandu-l pe
	% k = minimul dintre numarul de linii si coloane
	k1 = zeros(min1, 1);
	for i = 1 : min1
		k1(i, 1) = sum(diag(S1(1 : i, 1 : i))) / sum(diag(S1(1 : min1, 1 : min1)));
	endfor
	subplot(2, 4 ,2);
	plot(1 : min1, k1);
	title('Imaginea1, cerinta5.2')

	% Cerinta 5.3
	% Pentru mai multe valori ale lui k am aflat eroarea aproximarii
	% obtinute de algoritmul implementat la cerinta 1
	k2 = zeros(min1, 1);
	for i = 1 : min1
		A_k1 = cerinta1(image1, i);
		k2(i, 1) = sum(sum((A1 - A_k1).^2));
		k2(i, 1) = k2(i, 1) / (m1 * n1);
	endfor
	subplot(2, 4, 3);
	plot(1 : min1, k2);
	title('Imaginea1, cerinta5.3')

	% Cerinta 5.4
	% Am allat rata de compresie a datelor 	
	k3 = zeros(min1, 1);
	for i = 1 : min1
		k3(i, 1) = (2 * i + 1) / n1;
	endfor
	subplot(2, 4, 4);
	plot(1 : min1, k3);
	title('Imaginea1, cerinta5.4')

	% Analog am facut si pentru imaginea 2
	A2 = imread(image2);
	A2 = double(A2);
	[m2 n2] = size(A2);
	min2 = min(m2, n2);
	[A_k2 S2] = cerinta3(image2, min2);
	u = diag(S2);
	subplot(2, 4, 5);
	plot(1:m2, u);
	title('Imaginea2, cerinta5.1')
	
	w1 = zeros(min2, 1);
	for i = 1 : min2
		w1(i, 1) = sum(diag(S2(1 : i, 1 : i))) / sum(diag(S2(1 : min2, 1 : min2)));
	endfor
	subplot(2, 4, 6);
	plot(1 : min2, w1);
	title('Imaginea2, cerinta5.2')

	w2 = zeros(min2, 1);
	for i = 1 : min2
		A_k2 = cerinta1(image2, i);
		w2(i, 1) = sum(sum((A2 - A_k2).^2));
		w2(i, 1) = k2(i, 1) / (m2 * n2);
	endfor
	subplot(2, 4, 7);
	plot(1 : min2, w2);
	title('Imaginea2, cerinta5.3')

	w3 = zeros(min2, 1);
	for i = 1 : min2
		w3(i, 1) = (2 * i + 1) / n2;
	endfor
	subplot(2, 4, 8);
	plot(1 : min2, w3);
	title('Imaginea2, cerinta5.4')


endfunction