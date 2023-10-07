% Generation from various clustering methods

function MethLabs_M1=Labeling_AllCls_smth(inDaGA_M1,k,rep,stb,M_list,Stb_list)

% uiwait(msgbox('Please set the "K_lg_eig_M2" in "DSC_ERP_fast" before anything !!! " ',...
%     'Warning', 'warn'));

x= inDaGA_M1;

for ii=1:length(M_list)

   if ~ismember(M_list(ii),Stb_list)||stb==0

      m1=M_list(ii);

      switch m1

         case (1)
            ['KMN']
            [K_ERP]=k_means_GAERP(x,k);
            K_ERP=ccsmooth(x,K_ERP);
            M_label(1).data=K_ERP;

         case (2)
            ['HC']
            [H_ERP]=Hierarchical_GAERP(x,k);
            H_ERP=ccsmooth(x,H_ERP);
            M_label(2).data=H_ERP;

         case(3)
            ['FCM']
            [F_ERP]=FCM_GAERP(x,k);
            F_ERP=ccsmooth(x,F_ERP);
            M_label(3).data=F_ERP;

         case(4)
            ['SOM']
            [S_ERP]=SOM_GAERP(x,k);
            S_ERP=ccsmooth(x,S_ERP);
            M_label(4).data=S_ERP;

         case(5)
            ['DFS_Fast']
            [D_ERP]=DSC_GAERP(x,k);
            D_ERP=ccsmooth(x,D_ERP);
            M_label(5).data=D_ERP;

         case(6)
            ['MKMS']
            [MK_ERP]=MKMS_GAERP(x,k);
            MK_ERP=ccsmooth(x,MK_ERP);
            M_label(6).data=MK_ERP;

         case(7)
            ['AAHC']
            [AHC_ERP]=AAHC_GAERP(x,k);
            AHC_ERP=ccsmooth(x,AHC_ERP);
            M_label(7).data=AHC_ERP;

         case(8)
            ['SPC']
            [SPC_ERP]=SPEC_GAERP(x,k);
            SPC_ERP=ccsmooth(x,SPC_ERP);
            M_label(8).data=SPC_ERP;

         case(9)
            ['KMD']
            [KMD_ERP]=k_medoid_GAERP(x,k);
            KMD_ERP=ccsmooth(x,KMD_ERP);
            M_label(9).data=KMD_ERP;
         case(10)
            ['GMM']
            [GM_ERP]=GMM_GAERP(x,k);
            GM_ERP=ccsmooth(x,GM_ERP);
            M_label(10).data=GM_ERP;
      end

   end
end


% % %     ['KMN']
% % %     K_ERP=k_means_ERP(ERP_Subj,Subj,k,G);
% % %     ['HC']
% % %     H_ERP=Hierarchical_ERP(ERP_Subj,Subj,k,G);
% % %     ['FCM']
% % %     F_ERP=FCM_ERP(ERP_Subj,Subj,k,G);
% % %     ['SOM']
% % %     S_ERP=SOM_ERP(ERP_Subj,Subj,k,G);
% % %     ['DFS_Fast']
% % %     D_ERP=DSC_ERP_Fast(ERP_Subj,Subj,k,G,Sa); % suggest first calculate this "K_lg_eig'...


% parameters for making faster execution time

% ------------------------------------------------------------------------
% *********************   Stabilization step if needed   ******************



% %     stb=input('Do you need stablilization (1=yes, 0=No)? ');

% %     m=input ('Enter the method for stabilization (kmens=1, FCM=2, SOM=3, DFS=4) : ');


% %     while ~isempty(m)

if stb==1

   ['STB']

   for i=1:length(Stb_list)

      m=Stb_list(i);

      switch m

         case(1)  % kmeans--------------------------------------------
            ['S_KMN']
            for r=1:rep(i) % 3 times running
               K_ERP_S(:,r)=k_means_GAERP(x,k);
            end
            M_label(1).data=Stable_CC_M1(K_ERP_S,k);


         case(2)  % HC -----------------------------------------------
            ['S_HC']
            for r=1:rep(i) % 3 times running
               H_ERP_S(:,r)=Hierarchical_GAERP(x,k);
            end
            M_label(2).data=Stable_CC_M1(H_ERP_S,k);


         case(3) % FCM  -----------------------------------------------
            ['S_FCM']

            for r=1:rep(i) % 3 times running
               F_ERP_S(:,r)=FCM_GAERP(x,k);
            end
            M_label(3).data=Stable_CC_M1(F_ERP_S,k);


         case(4) % SOM  ---------------------------------------------------

            ['S_SOM']
            for r=1:rep(i) % 3 times running
               S_ERP_S(:,r)=SOM_GAERP(x,k);
            end
            M_label(4).data=Stable_CC_M1(S_ERP_S,k);

            %------------------------------------------------------------------

         case(5) % DFS
            ['S_DFS_Fast']
            for r=1:rep(i) % 3 times running
               D_ERP_S(:,r)=DSC_GAERP(x,k);
            end
            M_label(5).data=Stable_CC_M1(D_ERP_S,k);

            %------------------------------------------------------------------
         case(6) % MKMS
            ['S_MKMS']
            for r=1:rep(i) % 3 times running
               MK_ERP_S(:,r)=MKMS_GAERP(x,k);
            end
            M_label(6).data=Stable_CC_M1(MK_ERP_S,k);

            %------------------------------------------------------------------
         case(7) % AAHC
            ['S_AAHC']
            for r=1:rep(i) % 3 times running
               AHC_ERP_S(:,r)=AAHC_GAERP(x,k);
            end
            M_label(7).data=Stable_CC_M1(AHC_ERP_S,k);

            %------------------------------------------------------------------
         case(8) % SPC
            ['S_SPC']
            for r=1:rep(i) % 3 times running
               SPC_ERP_S(:,r)=SPEC_GAERP(x,k);
            end
            M_label(8).data=Stable_CC_M1(SPC_ERP_S,k);

            %------------------------------------------------------------------
         case(9) % SPC
            ['S_KMD']
            for r=1:rep(i) % 3 times running
               KMD_ERP_S(:,r)=k_medoid_GAERP(x,k);
            end
            M_label(9).data=Stable_CC_M1(KMD_ERP_S,k);

            %------------------------------------------------------------------
         case(10) % SPC
            ['S_GMM']
            for r=1:rep(i) % 3 times running
               GMM_ERP_S(:,r)=GMM_GAERP(x,k);
            end
            M_label(10).data=Stable_CC_M1(GMM_ERP_S,k);

            %------------------------------------------------------------------

      end


      % %             m=input ('Any other method for stabilization (kmens=1, FCM=2, SOM=3, DFS=4)');

   end

   [inLabel]=Label_comb(M_label,M_list);

else

   [inLabel]=Label_comb(M_label,M_list);

end

MethLabs_M1.data=inLabel;


%% Label_comb function

   function [inLabel]=Label_comb(M_label,M_list)


      for mm=1:length(M_list)

         inLabel(:,mm)=M_label(M_list(mm)).data;
         % % %     inLabel(2,:,:,:)=H_ERP;
         % % %     inLabel(3,:,:,:)=F_ERP;
         % % %     inLabel(4,:,:,:)=S_ERP;
         % % %     inLabel(5,:,:,:)=D_ERP;

      end

   end
end
