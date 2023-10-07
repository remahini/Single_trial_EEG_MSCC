% random selection with replacement

function [slSet,selidx]= randSmplRep(inpDataset, selSize)

[~, q]=size(inpDataset);

% Create the random number stream for reproducibility.

% s = RandStream('mlfg6331_64');

if nargin==1
    %     selSize=q;
    % else
    if q>= 40
        selSize=q;
    else
        disp('insufficient number of trials(<40)')
        selSize=50;
%         selSize=q; % if you need just to keep exist trials
    end
end

selidx = randi([1,q],1,selSize);

% selidx = datasample(s,1:q,selSize,'Replace',true);

for i=1:selSize
    slSet(:,i)=inpDataset(:,selidx(i));
end
end


