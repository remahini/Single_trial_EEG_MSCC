function timePlt(start_ms,end_ms,Sa,fntsize)

if nargin<4
    fntsize=11;
end
fac=(end_ms-start_ms)/Sa;
deff_div=200;
par=Sa*deff_div/(end_ms-start_ms);
xticks(0:par:end_ms-start_ms);
xticklabels(start_ms:ceil(fac*par):end_ms);
xlabel('Time (ms)')
set(gca,'FontSize',fntsize)

end
