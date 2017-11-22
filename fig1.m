

% by Wei Xu, 10/28/2017
%
% plot monte carlo simulation results for Figure 1.
% comparison with [Fang et al., 2010] for direct impact ionization
% comparison with [Frahm et al., 1997] for both direct impact ionziation
% and bremsstrahlung-induced ionization
%
% simulation results: "fig1_results.mat"
% fig1b.alt:  altitude range: 0:300 km
% fig1b.ionRate100keV: present results of ionization profile produced by the
%                      beam of 100 keV electrons, direct impact ionization
% fig1b.ionRate1MeV:   present results of ionization profile produced by the
%                      beam of 1 MeV electrons, direct impact ionization
% fig1b.fang100keV:    altitude profile of ionization produced by the
%                      beam of 100 keV electrons, [Fang et al., 2010, Figure 2]
% fig1b.fang1MeV:      altitude profile of ionization produced by the
%                      beam of 1 MeV electrons, [Fang et al., 2010, Figure 2]
%
% fig1c.ionFrahm: present results of ionization rate profile calculated
%                 using the precipitation source documented in [Frahm et al., 1997]
% fig1c.frahm:    altitude profile of ionization production documented in [Frahm et al., 1997]



clear; clc; 

fontS = 16;
load('fig1_results.mat');

%fig1b
figure; semilogx(fig1b.ionRate100keV, fig1b.alt, 'k', fig1b.ionRate1MeV, fig1b.alt, 'k', fig1b.fang100keV(:,2), fig1b.fang100keV(:,1), 'b', fig1b.fang1MeV(:,2), fig1b.fang1MeV(:,1), 'b')
set(gca,'FontSize',fontS);
set(gca,'XLim',[1e1 1e5]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[1e1 1e2 1e3 1e4 1e5], 'fontsize',16);
set(gca,'YLim',[30 150]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[30 50 70 90 110 130 150], 'fontsize',16);
xlabel('Ionization rate (cm^{-3}s^{-1})');
ylabel('Altitude (km)');  

%fig1c
figure; semilogx(fig1c.ionFrahm(:,2), fig1c.ionFrahm(:,1), 'k', fig1c.frahm(:,1), fig1c.frahm(:,2), 'r');
set(gca,'FontSize',fontS);
set(gca,'XLim',[1e-2 1e6]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[1e-2 1e0 1e2 1e4 1e6], 'fontsize',16);
set(gca,'YLim',[0 150]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[0 50 100 150], 'fontsize',16);
xlabel('Ionization rate (cm^{-3}s^{-1})');
ylabel('Altitude (km)');  
