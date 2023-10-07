function r_topplot(GA_ERP,selected_TW,chanlocs,St,innSim)

figure('Renderer','painters','Position', [20 20 700 450])
tiledlayout(2,2)
for st=1:St
    top=mean(GA_ERP(:,selected_TW(st,2):selected_TW(st,3),st),2)';
    nexttile
    topoplot(top,chanlocs)
    colorbar;
    caxis([-8 8])
    title(['Top-map',num2str(selected_TW(st,1))])
    set(gca,'fontsize',11)

    nexttile
    imagesc(corr(GA_ERP(:,selected_TW(st,2):selected_TW(st,3),st)))
    title(['Map ',num2str(selected_TW(st,1)), ', Inner-similarity= ', num2str(innSim(st))])
    colorbar
    caxis([0 1])
    set(gca,'fontsize',11)

end
end
