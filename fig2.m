

% by Wei Xu, 10/28/2017
%
% plot monte carlo simulation results for Figure 2.
% fig2a: altitude distribution for bremsstrahlung photons, photoelectrons,
%        and Compton electrons. normalized to unity.
% fig2b: energy distribution for bremsstrahlung photons produced by
%        different monoenergetic beams: 100 keV, 1 MeV, 10 MeV. normalized
%        to unity. 
% fig2c: energy distribution of photoelectrons, Compton electrons that can
%        be received between 34 and 36 km altitude. 
% fig2d: ionization profile produced by precipitating electrons and their
%        secondary bremsstrahlung photons. 100 keV, 1 MeV, 10 MeV. 0 and 45 pitch
%        angles. 
%
% simulation results: "fig2_results.mat"
% fig2a.alt: altitude range: 0:300 km
% fig2a.bp:  altitude distribution for bremsstrahlung photons [km^{-1}];
% fig2a.e:   altitude distribution for bremsstrahlung-induced electrons [km^{-1}];
% fig2a.pe:  altitude distribution for photoelectrons;
% fig2a.cp:  altitude distribution for Compton electrons;
% 
% fig2b.en:  energy range: 10.^(2.995:0.01:7.995);
% fig2b.dis100keV: energy distribution for the bremsstrahlung photons
%                  produced by the 100 keV beam [eV^{-1}];
% fig2b.dis1MeV:   energy distribution for the bremsstrahlung photons
%                  produced by the 1 MeV beam [eV^{-1}];
% fig2b.dis10MeV:  energy distribution for the bremsstrahlung photons
%                  produced by the 10 MeV beam [eV^{-1}];
% 
% fig2c.en:   energy range: 10.^(4:0.01:8);
% fig2c.eedf: energy distribution function for those electrons produced
%             between 34 and 36 km altitude by the 1 MeV beam
% fig2c.pe:   energy distribution function for photoelectrons produced
%             between 34 and 36 km altitude by the 1 MeV beam
% fig2c.ce:   energy distribution function for Compton electrons produced
%             between 34 and 36 km altitude by the 1 MeV beam
% 
% fig2d.alt:  altitude range: 0:300 km
% fig2d.ionRate100kp0:  altitude profile of ionization production by the
%                       beam of 100 keV electrons (pitch angle 0) and their assocaited bremsstrahlung photons
% fig2d.ionRate100kp45: altitude profile of ionization production by the
%                       beam of 100 keV electrons (pitch angle 45) and their assocaited bremsstrahlung photons
% fig2d.ionRate1Mp0:    altitude profile of ionization production by the
%                       beam of 1 MeV electrons (pitch angle 0) and their assocaited bremsstrahlung photons
% fig2d.ionRate1Mp45:   altitude profile of ionization production by the
%                       beam of 1 MeV electrons (pitch angle 45) and their assocaited bremsstrahlung photons
% fig2d.ionRate10Mp0:   altitude profile of ionization production by the
%                       beam of 10 MeV electrons (pitch angle 0) and their assocaited bremsstrahlung photons
% fig2d.ionRate10Mp45:  altitude profile of ionization production by the
%                       beam of 10 MeV electrons (pitch angle 45) and their assocaited bremsstrahlung photons

clear; clc

fontS = 16;
load('fig2_results.mat');

%fig2a
figure; plot(fig2a.disbp, fig2a.alt, 'r', fig2a.dise, fig2a.alt, 'k', fig2a.dispe, fig2a.alt, 'k--', fig2a.disce, fig2a.alt, 'k--');
set(gca,'FontSize',fontS);
set(gca,'XLim',[0 0.1]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[0 0.02 0.04 0.06 0.08 0.1], 'fontsize',16);
set(gca,'YLim',[0 150]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[0 50 100 150], 'fontsize',16);
xlabel('Distribution (km^{-1})');
ylabel('Altitude (km)'); 

%fig2b
figure; loglog(fig2b.en, fig2b.dis100keV, 'k', fig2b.en, fig2b.dis1MeV, 'b', fig2b.en, fig2b.dis10MeV, 'r')
set(gca,'FontSize',fontS);
set(gca,'XLim',[10^3 10^7]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[10^3 10^4 10^5 10^6 10^7], 'fontsize',16);
set(gca,'YLim',[1e-11 5e-3]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[1e-11 1e-9 1e-7 1e-5 1e-3], 'fontsize',16);
xlabel('Photon energy (eV)');
ylabel('Distribution (eV^{-1})');  

%fig2c
figure; loglog(fig2c.en, fig2c.eedf, 'r', fig2c.en, fig2c.pe, 'k--', fig2c.en, fig2c.ce, 'b--')
set(gca,'FontSize',fontS);
set(gca,'XLim',[10^4 10^6]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[10^4 10^5 10^6], 'fontsize',16);
set(gca,'YLim',[5e-11 2e-4]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[1e-10 1e-8 1e-6 1e-4], 'fontsize',16);
xlabel('Electron energy (eV)');
ylabel('Distribution (eV^{-1})');  

%fig2d
figure; semilogx(fig2d.ionRate100kp0, fig2d.alt, 'k', fig2d.ionRate100kp45, fig2d.alt, 'k--', fig2d.ionRate1Mp0, fig2d.alt, 'b', fig2d.ionRate1Mp45, fig2d.alt, 'b--', fig2d.ionRate10Mp0, fig2d.alt, 'r', fig2d.ionRate10Mp45, fig2d.alt, 'r--');
set(gca,'FontSize',fontS);
set(gca,'XLim',[2e-3 2e6]);
set(gca,'XMinorTick','off');
set(gca,'XTick',[1e-2 1e0 1e2 1e4 1e6], 'fontsize',16);
set(gca,'YLim',[0 150]);
set(gca,'YMinorTick','off');
set(gca,'YTick',[0 50 100 150], 'fontsize',16);
xlabel('Ionization rate (cm^{-3}s^{-1})');
ylabel('Altitude (km)');  
