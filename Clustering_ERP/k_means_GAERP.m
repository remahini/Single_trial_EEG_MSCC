% ---------K-means Clustering for ERP data different methods--------------

function [K_ERP]=k_means_GAERP(x,k)


% x is grand average data e.g. 4800 (observation )x30 (feature)


% % for g=1:G
% %     for s=1:Subj % subjects

% %         x=squeeze(x(:,:)); % samples x channels x subjects x groups

%         [c_idx,cen]=kmeans(x,k); % normal kmeans toolbox
%         [c_idx,cen]=kmeans(x,k,'distance','cityblock');
%         [c_idx,cen]=kmeans(x,k,'distance','cosine');
          [c_idx,cen]=kmeans(x,k,'distance','correlation');
%         [c_idx,cen]=kmeans(x,k,'distance','Hamming');

K_ERP=c_idx;
% %
% %     end
% % end
end




