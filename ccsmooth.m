% CC improvement is required if we had noisy clusters cause of noisy data
% Spatial smoothing is applied to the thiny cluster maps that might devide
% one component
% 06042023
% remahini@jyu.fi Apr, 2023

function clust_idx=ccsmooth(idata,clust_idx)

% sensetivity thresholds
mrg=4;
spcrr=0.89;

nSam=length(clust_idx);

chan= 14;

k=length(unique(clust_idx));
index= Indexing(nSam,clust_idx,k);

i=2;
idx=[];
idx=index;
while i<size(idx,1)-1
    corBwTops=[];
    if idx(i-1,1)-idx(i,1)<mrg

%         tiledlayout(1,3)
        top1=mean(idata(idx(i-1):idx(i),:));
%         nexttile
%         topoplot(top1',chanlocs)
        top2=mean(idata(idx(i):idx(i+1),:));
%         nexttile
%         topoplot(top2',chanlocs)
        if (i+2<size(idx,1))
%             nexttile
            top3=mean(idata(idx(i+1):idx(i+2),:));
%             topoplot(top3',chanlocs)

            corBwTops(1)=corr(top1',top2');
            corBwTops(2)=corr(top2',top3');
            corBwTops(3)=corr(top1',top3');

%             title(['Corr = ', num2str(corBwTops)])
%             set(gca,'fontsize',12)
%             hold on
%             pause(2)
            %         close
            % merging and reconstructing
            if all(corBwTops>spcrr) % threshold of merging
                idx(i,:)=[];
                idx(i+1,:)=[];
%                 disp('merging ===========>')
            elseif and(corBwTops(1)>spcrr, corBwTops(1)>corBwTops(2))
                idx(i,:)=[];
%                 disp('merging ===========>')
            elseif and(corBwTops(2)>spcrr, corBwTops(2)>corBwTops(1))
                idx(i+1,:)=[];
%                 disp('merging ===========>')
            end
        else
            % if no next map to triple comparision
            corBwTops(1)=corr(top1',top2');
%             title(['Corr = ', num2str(corBwTops)])
%             set(gca,'fontsize',12)
%             hold on
%             pause(1)
            %         close
            % merging and reconstructing
            if corBwTops(1)>spcrr % threshold of merging
                idx(i,:)=[];
%                 disp('merging ===========>')
            end
        end
        i=i+1;
    end
end

% Label Reconstruction
for i=1:size(idx,1)
    newidx(idx(i,1):idx(i+1),1)=idx(i,2);
end
if idx(i)<256
    newidx(idx(i,1):256,1)=idx(i,2);
end

% % visualization -----
% gfptest=GFP(idata');
% figure('Renderer','painters','Position',[50 50 700 500])
% subplot(411)
% plot(idata(:,chan))
% xlim([1,256])
% ylabel('Amplitude(mv)')
% subplot(412)
% imagesc(clust_idx')
% subplot(413)
% imagesc(newidx')
% subplot(414)
% plot(gfptest)
% xlim([1,256])
% ylabel('GFP')

% Labeling update
clust_idx=newidx;

end


