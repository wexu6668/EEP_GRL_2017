

% by Wei Xu, 03/27/2017
%
% plot chemical simulatio nreuslts, including NOx production, HOx production, and Ox depletion.
%
% source ionization file: "PrecipIonRatesForSIC.mat". 
% chemical simulation results: "results.mat".
% 1e-3 erg/cm^2/s: columns 16,17 (10 keV), 7,8   (100 keV), 1,2 (1 MeV), 22,23 (10 MeV)
% 1e-1 erg/cm^2/s: columns 18,19 (10 keV), 9,10  (100 keV), 3,4 (1 MeV), 24,25 (10 MeV)
% 1e1  erg/cm^2/s: columns 20,21 (10 keV), 11,12 (100 keV), 5,6 (1 MeV), 26,27 (10 MeV)
% column 13, modeling reuslts of [frahm et al., 1997], with bremsstrahlung
% column 14, modeling reuslts of [frahm et al., 1997], without bremsstrahlung
% column 15, reuslts of [frahm et al., 1997, Figure 1]

clear; clc

load('fig34_results.mat');

fontS = 16;
scrsz = get(0,'ScreenSize');

ef = [5,  6;
      26, 27;];  
varNames = fieldnames(res);

for i = 1:length(ef(:,1))
    
    %plot Ne in log scale
    cbar = -2:0.1:6;
    for k = 1:length(ef(1, :)) 
        figure('Position',[1 scrsz(4)*3/4 scrsz(3)/4 scrsz(4)*1.9/8]);
        resNe = res(ef(i, k)).(varNames{1}); 
        resNe(resNe<=0) = 0;
        log10Ne = log10(resNe); 
        log10Ne(isinf(log10Ne) == 1) = 0;
        log10Ne(isnan(log10Ne) == 1) = 0;
        log10Ne(log10Ne<min(cbar)) = min(cbar);
        contour(t,h,log10Ne, cbar, 'Fill', 'on'); 
        caxis([min(cbar) max(cbar)]); 
        colorbar;
        set(gca,'FontSize',fontS);
        set(gca,'XLim',[t(1) t(end)]);
        set(gca,'XMinorTick','off');
        set(gca,'XTick',[t(1) t(end/2) t(end)], 'fontsize',16);
        set(gca,'XTickLabels',[17 18 19], 'fontsize',16);    
        set(gca,'YLim',[20 100]);
        set(gca,'YMinorTick','off');
        set(gca,'YTick',[20 40 60 80 100], 'fontsize',16); 
        if 1
            xlabel('UT');
            ylabel('Altitude (km)');
            titleName = strcat('Electron density log10 [cm^{-3}]');
            title(titleName, 'fontsize', 16, 'FontWeight','Normal');
        end%k==1
        shading flat;
        colormap('jet');
    end%k 
    
    for j = 2:2
        if i == 1
            cbar = 0:0.1:2;
            for k = 1:length(ef(1, :))
                figure('Position',[1 scrsz(4)*3/4 scrsz(3)/4 scrsz(4)*1.9/8]);
                resnox = res(ef(i, k)).(varNames{j})./res(end).(varNames{j});
                resnox(resnox<min(cbar)) = min(cbar);
                resnox(resnox<=0) = 0;
                log10nox = log10(resnox);
                log10nox(isinf(log10nox) == 1) = 0;
                log10nox(isnan(log10nox) == 1) = 0;
                log10nox(log10nox<min(cbar)) = min(cbar);
                contour(t,h,log10nox, cbar, 'Fill', 'on');
                set(gca,'FontSize',fontS);
                set(gca,'XLim',[t(1) t(end)]);
                set(gca,'XMinorTick','off');
                set(gca,'XTick',[t(1) t(end/2) t(end)], 'fontsize',16);
                set(gca,'XTickLabels',[17 18 19], 'fontsize',16);
                set(gca,'YLim',[20 100]);
                set(gca,'YMinorTick','off');
                set(gca,'YTick',[20 40 60 80 100], 'fontsize',16);
                if 1
                    xlabel('UT');
                    ylabel('Altitude (km)');
                    titleName = strcat(varNames(j), ' relative change');
                    title(titleName, 'fontsize', 16, 'FontWeight','Normal');
                end%if k
                shading flat;
                caxis([min(cbar) max(cbar)]);
                colorbar;
                colormap('jet');
            end%for k
        elseif i==2
            cbar = 1:0.1:10;
            for k = 1:length(ef(1, :))
                figure('Position',[1 scrsz(4)*3/4 scrsz(3)/4 scrsz(4)*1.9/8]);
                resnox = res(ef(i, k)).(varNames{j})./res(end).(varNames{j});
                resnox(resnox<min(cbar)) = min(cbar);
                resnox(resnox<=0) = 0;
                log10nox = log10(resnox);
                log10nox(isinf(log10nox) == 1) = 0;
                log10nox(isnan(log10nox) == 1) = 0;
                log10nox(log10nox<min(cbar)) = min(cbar);
                contour(t,h,resnox, cbar, 'Fill', 'on');
                set(gca,'FontSize',fontS);
                set(gca,'XLim',[t(1) t(end)]);
                set(gca,'XMinorTick','off');
                set(gca,'XTick',[t(1) t(end/2) t(end)], 'fontsize',16);
                set(gca,'XTickLabels',[17 18 19], 'fontsize',16);
                set(gca,'YLim',[20 100]);
                set(gca,'YMinorTick','off');
                set(gca,'YTick',[20 40 60 80 100], 'fontsize',16);
                if 1
                    xlabel('UT');
                    ylabel('Altitude (km)');
                    titleName = strcat(varNames(j), ' relative change');
                    title(titleName, 'fontsize', 16, 'FontWeight','Normal');
                end%if k
                shading flat;
                caxis([min(cbar) max(cbar)]);
                colorbar;
                colormap('jet');
            end%for k
        end%if i; elseif i 
    end%for j
    
    for j = 3:3
        if i == 1
            cbar = 0:0.1:3;
        elseif i==2
            cbar = 0:0.1:2.5;
        end%if i
        for k = 1:length(ef(1, :))
                figure('Position',[1 scrsz(4)*3/4 scrsz(3)/4 scrsz(4)*1.9/8]);
                reshox = res(ef(i, k)).(varNames{j})./res(end).(varNames{j}); 
                reshox(reshox<=0) = 0;
                log10hox = log10(reshox); 
                log10hox(isinf(log10hox) == 1) = 0;
                log10hox(isnan(log10hox) == 1) = 0;
                log10hox(log10hox<min(cbar)) = min(cbar);
                contour(t,h,log10hox, cbar, 'Fill', 'on'); 
                caxis([min(cbar) max(cbar)]);             
                set(gca,'FontSize',fontS);
                set(gca,'XLim',[t(1) t(end)]);
                set(gca,'XMinorTick','off');
                set(gca,'XTick',[t(1) t(end/2) t(end)], 'fontsize',16);
                set(gca,'XTickLabels',[17 18 19], 'fontsize',16);
                set(gca,'YLim',[20 100]);
                set(gca,'YMinorTick','off');
                set(gca,'YTick',[20 40 60 80 100], 'fontsize',16);
                if 1
                    xlabel('UT');
                    ylabel('Altitude (km)');
                    titleName = strcat(varNames(j), ' relative change');
                    title(titleName, 'fontsize', 16, 'FontWeight','Normal');
                end%if k
                shading flat; 
                caxis([min(cbar) max(cbar)]); 
                colorbar;            
                colormap('jet');
        end%for k  
    end%for j
    
    for j = 4:4
    cbar = 0.2:0.01:1;
        for k = 1:length(ef(1, :))
                h1 = figure('Position',[1 scrsz(4)*3/4 scrsz(3)/4 scrsz(4)*1.9/8]);
                contour(t,h,res(ef(i, k)).(varNames{j})./res(end).(varNames{j}), cbar, 'Fill', 'on'); 
                set(gca,'FontSize',fontS);
                set(gca,'XLim',[t(1) t(end)]);
                set(gca,'XMinorTick','off');
                set(gca,'XTick',[t(1) t(end/2) t(end)], 'fontsize',16);
                set(gca,'XTickLabels',[17 18 19], 'fontsize',16);
                set(gca,'YLim',[20 100]);
                set(gca,'YMinorTick','off');
                set(gca,'YTick',[20 40 60 80 100], 'fontsize',16);
                if 1
                    xlabel('UT');
                    ylabel('Altitude (km)');
                    titleName = strcat(varNames(j), ' relative change');
                    title(titleName, 'fontsize', 16, 'FontWeight','Normal');
                end%if k
                shading flat; 
                caxis([min(cbar) max(cbar)]); 
                colorbar;            
                colormap(h1, 'jet');
                colormap(h1, flipud(colormap));
        end%for k 
    end%for j
    
end%for i



