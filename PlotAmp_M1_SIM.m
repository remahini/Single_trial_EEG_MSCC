%% Power of Amplitude  ---------------------------------------------------
% The code written by : Reza Mahini March 2019, r.mahini@gmail.com
% Updated
% ____ Update 20220718 "xline"

function PlotAmp_M1_SIM(x1,index,Sa,start_ms,end_ms,St,ch_loc,selChan,com,compSet,stimSet)


% Initializing ------------------------------------------------------------

% St=1;

linTyp={'-','--','-.',':','--.','.-.','-','-','-'};

% _____ Update 20220921
% fac=(end_ms-start_ms)/(Sa-1); for new version
fac=(end_ms-start_ms)/Sa;
deff_div=100;
par=Sa*deff_div/(end_ms-start_ms);
zer=Sa*(-start_ms)/(end_ms-start_ms);
% erp_time=start_ms:fac:end_ms % we may need in other version of plots
% _______

% plot parameter initializing ----
for st=1:St
   rngmax(st,:)=max(x1(st*Sa-(Sa-1):st*Sa,ch_loc));
   rngmin(st,:)=min(x1(st*Sa-(Sa-1):st*Sa,ch_loc));
end

rngl=abs(min(min(rngmin)))+1; % Plot range for the partitions lines
rngh=abs(max(max(rngmax)))+1;
txps=-(rngl)+0.5; % plotting the text

for st=1:St

   figure('Renderer', 'painters', 'Position', [10 10 700 400])

   %subplot(3,2,t,'align')
   for ch_num=1:length(ch_loc)
      % %             maxA(ch_num)=max(x1(t*Sa-(Sa-1):t*Sa,ch(ch_num))); % lines
      % plot(erp_time,
      % x1(st*Sa-(Sa-1):st*Sa,ch_loc(ch_num)),linTyp{ch_num},'LineWidth',1.5,'Color','#0072BD');
      % % later we may update on this
      plot(x1(st*Sa-(Sa-1):st*Sa,ch_loc(ch_num)),linTyp{ch_num},'LineWidth',1.5,'Color','#0072BD');

      xlabel('Time(ms)');
      ylabel('Amplitude(\muV)');
      title(['Waveform, ' , compSet{com}, ', ', stimSet{st}]);
      xticks(0:par:end_ms-start_ms);
      xticklabels(start_ms:ceil(fac*par):end_ms);
      set(gca,'FontWeight','b','FontSize',11)
      hold on
      legend(selChan);
      xlim ([0 Sa]) % _____ Update 20210516
      ylim([-rngl,rngh])
      xline(zer,'-','LineWidth',1)
      yline(0,'-','LineWidth',1)
      grid on
      %       ax=gca;  % ________Updated 20220920  (canceled)
      %       ax.XAxisLocation = 'origin';
      %       ax.YAxisLocation = 'origin';
      %       ax.TickDir = 'out'; % ________
      %       neozeroaxes(1,8); % Luck group strong ERP plot function for plotting
      %       box on;
      %       set(gca,'DefaultAxesBox','on')
     

   end
   % %         clear max
   % %         maxAmp=max(maxA)

   switch st    % stimulus
      case 1
         text(mean([index(1,1) index(1+1,1)]),txps,int2str(index(1,2)),'Rotation',90,'FontSize',11);
         l=2;
         while index(l,1)<=st*Sa && l<size(index,1)
%          while index(l,1)<=index(l+1,1) && l<size(index,1) % in new ver

            xline(index(l,1),'LineWidth',.5,'Color','#D95319','LineStyle','--') % ____ Update 20220718
%             plot([index(l,1), index(l,1)],[-rngl,rngh],'LineWidth',.5,'Color','#D95319','LineStyle','--');
            % patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1) index(l+1,1)]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);
            l=l+1;
            legend(selChan);
         end
      case 2
         gr1=find (index()>(st-1)*Sa & index()<st*Sa);
         l=gr1(1);
         for l=gr1(1):gr1(size(gr1))
            xline(index(l,1)-Sa,'LineWidth',.5,'Color','#D95319','LineStyle','--') % ____ Update 20220718
%             plot([index(l,1)-Sa, index(l,1)-Sa],[-rngl,rngh],'LineWidth',.5,'Color','#D95319','LineStyle','--');
            % patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1)-(st-1)*Sa index(l+1,1)-(st-1)*Sa]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);
         end
      case 3

         gr2=find (index()>(st-1)*Sa&index()<st*Sa);
         l=gr2(1);
         for l=gr2(1):gr2(size(gr2))
            xline(index(l,1)-(st-1)*Sa,'LineWidth',.5,'Color','#D95319','LineStyle','--') % ____ Update 20220718
%             plot([index(l,1)-(st-1)*Sa, index(l,1)-(st-1)*Sa],[-rngl,rngh],'LineWidth',.9,'Color','#D95319','LineStyle','--');
            %patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1)-(st-1)*Sa index(l+1,1)-(st-1)*Sa]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);

         end
      case 4

         gr3=find (index()>(st-1)*Sa & index()<st*Sa);
         l=gr3(1);
         for l=gr3(1):gr3(size(gr3))
            plot([index(l,1)-(st-1)*Sa, index(l,1)-(st-1)*Sa],[-rngl,rngh],'LineWidth',.9,'Color','#D95319','LineStyle','--');
            %patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1)-(st-1)*Sa index(l+1,1)-(st-1)*Sa]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);

         end
      case 5

         gr4=find (index()>(st-1)*Sa & index()<st*Sa);
         l=gr4(1);
         for l=gr4(1):gr4(size(gr4))
            plot([index(l,1)-(st-1)*Sa, index(l,1)-(st-1)*Sa],[-rngl,rngh],'LineWidth',.9,'Color','#D95319','LineStyle','--');
            %patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1)-(st-1)*Sa index(l+1,1)-(st-1)*Sa]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);

         end
      case 6
         gr5=find (index()>(st-1)*Sa);
         l=gr5(1);
         for l=gr5(1):gr5(length(gr5)-1)
            plot([index(l,1)-(st-1)*Sa, index(l,1)-(st-1)*Sa],[-rngl,rngh],'LineWidth',.9,'Color','#D95319','LineStyle','--');
            %patch([index(l,1) index(l,1) index(l+1,1) index(l+1,1)],[0 1 1 0],'w');
            text(mean([index(l,1)-(st-1)*Sa index(l+1,1)-(st-1)*Sa]),txps,int2str(index(l,2)),'Rotation',90,'FontSize',11);

         end

   end

   legend(selChan);

   % %     filename = strcat('Amplitude, Stim ', int2str(t),'Group', int2str(g));
   % %     set(gcf,'paperunits','centimeters','paperposition',[0,0,14,9]);
   % %     saveas(figure(fig1),[filepath filename],'png');
   % %     close(figure (fig1));
   % %     fig1=fig1+1;
end

legend(selChan);
end



