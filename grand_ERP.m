% Grand average function -----------------------------------------------
% input datamust be in thid struvture :
% samples x channel x subject x stimulus x group
% Channel x Sample x Stim x Subject x Group



function [inDaGA]=grand_ERP(Data,G) % N=number of subjects


% S= Number of stimuli, SA= number of samples

for g=1:G
    
    inGA(:,:,:,g)=squeeze(mean(Data(:,:,:,:,g),4)); % Chan x Sa x St x Subj x G
    
    
    % samples x channels x groups
end

if G<2
    inDaGA=squeeze(inGA(:,:,:,g));
else
    inDaGA=inGA;
end

disp('The grand average data size is = ')
size(inDaGA)

end






