
%k_medoid Clustering for ERP data different methods--------------

function [KMD_ERP]=k_medoid_GAERP(x,k)


% x is grand average data e.g. 4800 (observation )x30 (feature)


% % for g=1:G
% %     for s=1:Subj % subjects

% %         x=squeeze(x(:,:)); % samples x channels x subjects x groups

[c_idx,cen]=kmedoids(x,k,'distance','correlation','replicates',5);

KMD_ERP=c_idx;
% %
% %     end
% % end
end
