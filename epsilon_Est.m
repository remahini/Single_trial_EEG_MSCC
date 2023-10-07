% estimate the value of the epsilon
function [epsilon L]=epsilon_Est(x, kernel,samples,fig)
% Number of measurements
n = size(x,1);

% Take only 200 random samples from the whole dataset.
if n > samples
        ind = randperm(n);
        ind = ind(1:samples);
        x = x(ind,:);
end

ep = [ 10^-8:10^-8:10^-7 2*10^-7:10^-7:10^-6 2*10^-6:10^-6:10^-5 2*10^-5:10^-5:10^-4 0.0002:0.0001:0.001 0.002:0.001:0.01 0.02:0.01:0.1 0.2:0.1:1 2:1:10 20:10:100 200:100:1000 2000:1000:10000 20000:10000:100000 2*10^5:10^5:10^6 2*10^6:10^6:10^7 2*10^7:10^7:10^8 2*10^9:10^9:10^10];
L = zeros(1,length(ep));

for ks=1:length(ep)
	% Create the kernel.
	W = squareform(pdist(x, kernel));
	W = exp( - W.^2 ./ ep(ks) );

	L(ks) = sum(sum(W));
end

% With euclidean distance kernel, use this.
if strcmp(kernel, 'euclidean')
	threshold = (samples) + ( ((samples^2)-(samples))./2 );
	%threshold = (min(L) + max(L))./2;
end

% With Hamming distance kernel the lower bound depends on the categories.
if strcmp(kernel, 'hamming')
	threshold = (min(L)) + ( ((samples^2)-(min(L)))./2 );
end

%[v, idx] = max(diff(log(L)));
%epsilon = ep(idx);

% Look where the threshold is crossed and take the epsilon at that point.
idx = find(threshold < L, 1);
epsilon = ep(idx);

% % if nargin > 3 && strcmp(fig, 'figures')
% % 	figure
% % 	loglog(ep, L)
% % 	hold on
% % 	grid on
% % 	loglog([epsilon epsilon], [min(L) max(L)], 'r')
% % 	title('The weight matrix sum as a function of epsilon')
% % 	xlabel('\epsilon')
% % 	ylabel('L')
% % end
end