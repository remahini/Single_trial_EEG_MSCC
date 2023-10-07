% M-N plot for clustering method selection
% Apr 2023, University of Jyvaskyla
% Design by Reza Mahini, remahini@jyu.fi


%% function [propList]=r_MN_plotEv_CC(indata,twStart,twEnd,startEph,endEph,chanlocs)

close all
St=2;
com=1;
stimSet={'C1','C2'};
compSet={'P3'};


twStart=300;
twEnd=560;
Sa=256;
startEph=-200;
endEph=800;
clmethod={'KM','HC','FCM','SOM ','DFS', 'MKMS', 'AAHC', 'SPC', 'KMD', 'GMM'};
% 1=K-means', 2= 'Hierachial', 3= 'FCM',4 ='SOM ','5 = DFS', 6= 'MKMS',...
% 7= 'AAHC', 8= 'SPC', 9= 'KMD', 10='GMM'

InSim_Thr=0.90;
minSamThr=15;
plt=0; % Plot  
R=3; % repeat of test
vote=3; % voting from


tic

subjMList=[];

for s=1:Subj
    for vt=1:vote

    M_list=[];
    % initial set as much algorithm 
    M_list=[1 2 4 5 6 8 9 10]; %[1 4 6 9 10]; % main [1 3 8 9 10]; %[2 3 6 8];

    for rp=1:R % repeat of test

        cl=[];
        ClustAll=[];

        %         if rp==R
        %             M_list=subjMList(s).selMlist;
        %         else

        Stb_list=[]; %[1 9];
        rep=[4 3]; %
        stb=0;

        for m=1:length(M_list)
            cl{m}=clmethod{M_list(m)};
        end
        cl{m+1}='CC';

        [v,w]=time_conv_ts(Sa,twStart,twEnd,startEph,endEph);
        indata=ERP_Subj(:,:,s);

        ClustAll=Labeling_AllCls_smth(indata,k,rep,stb,M_list,Stb_list);
        % CC for subject from clusterings of ERP
        ClustAll.data(:,size(ClustAll.data,2)+1)=CSPA(ClustAll.data,k);

        for m=1:length(M_list+1)

            index=[];
            clidx=ClustAll.data(:,m);
            index=Indexing_M1(nSam,clidx,k,St,1);


            % _____ Update v1, w1 used
            [Comp_inf,comp_pow,innerCorr,winnID,InnSimWcl]=...
                Comp_detect_ERP_CC_Upd(clidx,indata,chanlocs,k,Sa,St,v,w,com,stimSet,compSet,InSim_Thr,minSamThr);

            % _____ Update v1, w1 used
            [selected_TW,TWs_ms,selTWs_ms,sel_innerCorr,innsim,selPower_amp,selcorBWsbj]=...
                Sel_TW_Trial(Comp_inf,innerCorr,v,w,St,1,Sa,startEph,endEph,winnID,InnSimWcl,comp_pow, compGroup_CC_GT.meantop);

            % Plotting results
            if plt==1
                if m==length(M_list+1)
                    PlotAmp_M1_SIM(indata,index,Sa,startEph,endEph,St,ch_loc,selChan,1,compSet,stimSet);
                    r_topplotM1(indata',selected_TW,chanlocs,St,innsim) % Topography plot
                end

                %                             exportgraphics(gcf,['TopSubj',num2str(s),'.png'],'Resolution',300)
                %                             close
            end

            InsimTWms(s).method(m).innsim=innsim;
            InsimTWms(s).method(m).dur=selTWs_ms(:,4);
        end

        clrmrks={'b','r','y','g','c','m','k','#77AC30','#A2142F','#7E2F8E','#D95319'};
        marklist={'*','+','^','x','s','d','v','<','>','p','-'};


% %         figure('Renderer','painters','Position',[20 20 700 550])

        for st=1:St

            cnt=1;
            for m=1:length(M_list+1)
                tmp(m,2)=InsimTWms(s).method(m).dur(st);
                tmp(m,1)=InsimTWms(s).method(m).innsim(st);
                if (tmp(m,2)>=50 && tmp(m,2)<=400 && tmp(m,1)>0.8)
                    subjMList(s).cond(st).Mlist(cnt)=M_list(m);
                    cnt=cnt+1;
                end

%                 scatter(tmp(m,1),tmp(m,2),Marker=marklist{m},Color=clrmrks{m})
%                 xlim([0.50 1])
%                 ylim([0 1000])
%                 xlabel('Inner-similarity')
%                 ylabel('Map duration(ms)')
%                 set(gca,'fontsize',14)
%                 hold on

            end

            % updateing the Mlist for each cond.
            temp=[];
            temp=unique(subjMList(s).cond(st).Mlist);
            subjMList(s).cond(st).Mlist=[];
            subjMList(s).cond(st).Mlist=temp;
        end

        % %         yline(400,LineStyle="--",Color='#0072BD',LineWidth=1)
        % %         xline(0.8,LineStyle="--",Color='#0072BD',LineWidth=1)
        % %         yline(50,LineStyle="--",Color='#0072BD',LineWidth=1)
        % %         legend(cl,'Location','northwest');
        
        % Strict selection of suitable methods for both conditions
        subjMList(s).selMlist=intersect(subjMList(s).cond(1).Mlist,subjMList(s).cond(2).Mlist);

        % candidate list for this repeat
        Mlist=subjMList(s).selMlist;

    end
    subjMList(s).vote(vt).Mlist=Mlist;
    
    end
    c=1;
    vMlist=[];
    for vt=1:vote
        for i=1:length(subjMList(s).vote(vt).Mlist)
            vMlist(1,c)=subjMList(s).vote(vt).Mlist(i);
            c=c+1;
        end
    end
    
    c=1;
    for i=1:10
        A=[];
        A=find(vMlist==i);
        if length(A)>=2
        subjMList(s).voteMlist(c)=i;
        c=c+1;
        end
    end

end

toc