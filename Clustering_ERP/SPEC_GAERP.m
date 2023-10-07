% Spectral clustering Clustering for ERP data different methods--------------

function [SPC_ERP]=SPEC_GAERP(x,k)


% x is grand average data e.g. 4800 (observation )x30 (feature)


% % for g=1:G
% %     for s=1:Subj % subjects

% %         x=squeeze(x(:,:)); % samples x channels x subjects x groups

  % c_idx=spectralcluster(x,k);
  % c_idx=spectralcluster(x,k,'Distance','cosine');
   c_idx=spectralcluster(x,k,'Distance','correlation');
   %[c_idx,V]=spectralcluster(x,k); V is eigenvalue vectot

SPC_ERP=c_idx;
% %
% %     end
% % end
end




