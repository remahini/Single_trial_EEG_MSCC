% GMM for EEG/ERP

function idx=GMM_GAERP(x,k)

% The x for mshould be  samples x features(channels)
% all "fitgmdist" and "gmdistribution" , and "cluster" are Matlab functions


GMModel = fitgmdist(x,k,'RegularizationValue',0.01); %  Fit Gaussian mixture model to data, by default
% k-means++ used for initialzation of components
% Set RegularizationValue to a small positive scalar to ensure that the 
% estimated covariance matrices are positive definite.
gm = gmdistribution(GMModel.mu,GMModel.Sigma); % model extraction
idx = cluster(gm,x); % clustering 

end
