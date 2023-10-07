function r_topplotM1(ERP,selected_TW,chanlocs,St,innSim)

figure('Renderer','painters','Position', [20 20 700 450])

[p,q]=size(ERP);

if p>q
    Sa=p/St;
    ERP=ERP';
else 
    Sa=q/St;
end

tiledlayout(2,2)
for st=1:St
    ERPplt=ERP(:,Sa*st-(Sa-1):Sa*st);
    top=mean(ERPplt(:,selected_TW(st,2):selected_TW(st,3)),2)';
    nexttile
    topoplot(top,chanlocs)
    colorbar;
    caxis([-8 8])
    title(['Top-map',num2str(selected_TW(st,1))])
    set(gca,'fontsize',11)

    nexttile
    imagesc(corr(ERPplt(:,selected_TW(st,2):selected_TW(st,3))))
    title(['Map ',num2str(selected_TW(st,1)), ', Inner-similarity= ', num2str(innSim(st))])
    colorbar
    caxis([0 1])
    set(gca,'fontsize',11)

end
end
