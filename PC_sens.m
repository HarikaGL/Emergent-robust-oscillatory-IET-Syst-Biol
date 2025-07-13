clear
close all
clc



pname = ["k3" "v4" "v1" "v1L" "v2A" "v2B" "v2L" "v3" "k1L" "k1D" "k2" "k4" "p1" "p1L" "p2" "p3" "p4" "d1" "d2D" "d2L" "d3D" "d3L" "d4D" "d4L" "K1" "K2" "K3" "K4" "K5" "K6" "K7" "K8" "K9" "K10" "L" "D"];
varname = ["CLm" "CLp" "ELm" "ELp" "P97m" "P97p" "P51m" "P51p" "P"];
tab.Parameter = ["original", pname(1:end-2)+" (+ 10%)", pname(1:end-2)+" (- 10%)" ]';
% Original parameters
p1 = [0.56 1.5 4.6 3 1.3 1.5 5 1 0.53 0.21 0.35 0.57 0.76 0.42 1 0.64 1 0.68 0.5 0.3 0.48 0.78 1.2 0.38 0.16 1.2 0.24 0.23 0.3 0.46 2 0.36 1.9 1.9 1 0];
%SNIPER
%  p1(8) = 30;
%  p1(12) = 0.05;

npar = (length(pname)-2); %number of changing parameters 
ic = [0 0 0 0 0 0 0 0 0];

per = 24;
dt=0.05;tot=per*100;
t1=0:dt:tot;

[tim,sol]   = ode15s(@(t,y)funpc(t,y,p1),t1,ic);
tot1 = floor(length(tim)/2);
solx=sol(tot1:end,1);
timx=tim(tot1:end);
    
[pksmin, locs] = findpeaks(-solx);  
pksminm = -mean(pksmin);
    
[pksmax, locs] = findpeaks(solx); 
pksmaxm = mean(pksmax);
amp_orig = pksmaxm-pksminm;
period = mean(diff(locs))*dt;
fre_orig = 1/period;
tab.frequency(1) = fre_orig;
tab.amplitude(1) = amp_orig;
tab.Percent_change(1) = 0;
tab.Percent_change_amp(1) = 0;


for i = 1:npar
    ptemp = p1;
    ptemp(i) = ptemp(i)+((ptemp(i)*10)/100);
    [tim,sol]   = ode15s(@(t,y)funpc(t,y,ptemp),t1,ic);
    tot1 = floor(length(tim)/2);
    solx=sol(tot1:end,1);
    timx=tim(tot1:end);
    
    [pksmin, locs] = findpeaks(-solx);  
    pksminm = -mean(pksmin);
    
    [pksmax, locs] = findpeaks(solx); 
    pksmaxm = mean(pksmax);
    amp = pksmaxm-pksminm;
    period = mean(diff(locs))*dt;
    fre = 1/period;
    tab.frequency(i+1) = fre;
    tab.amplitude(i+1) = amp;
    tab.Percent_change(i+1) = ((fre-fre_orig)/fre_orig)*100;
    tab.Percent_change_amp(i+1) = ((amp-amp_orig)/amp_orig)*100;    
end

for i = 1:npar
    ptemp = p1;
    ptemp(i) = ptemp(i)-((ptemp(i)*10)/100);
    [tim,sol]   = ode15s(@(t,y)funpc(t,y,ptemp),t1,ic);
    tot1 = floor(length(tim)/2);
    solx=sol(tot1:end,1);
    timx=tim(tot1:end);
    
    [pksmin, locs] = findpeaks(-solx);  
    pksminm = -mean(pksmin);
    
    [pksmax, locs2] = findpeaks(solx); 
    pksmaxm = mean(pksmax);
    amp = pksmaxm-pksminm;
    period = mean(diff(locs))*dt;
    fre = 1/period;
    tab.frequency(npar+1+i) = fre;
    tab.amplitude(npar+1+i) = amp;
    tab.Percent_change(npar+1+i) = ((fre-fre_orig)/fre_orig)*100;    
    tab.Percent_change_amp(npar+1+i) = ((amp-amp_orig)/amp_orig)*100;    
end
%%

scatter(tab.frequency(2:(npar+1)),tab.amplitude(2:(npar+1)),'black',LineWidth=2)
hold on
scatter(tab.frequency((npar+2):end),tab.amplitude((npar+2):end),'black','s',LineWidth=2)
scatter(tab.frequency(1),tab.amplitude(1),'red','filled')
% xlim([0 0.06])
% ylim([0 1.5])
% xlim([0.04 0.045])
% ylim([0.6 1])
xlabel('Frequency')
ylabel('Amplitude')
legend('10% increase', '10% decrease', 'Original' ,Location='southwest')
box on
grid on
ax=gca;
ax.XAxis.LineWidth = 4;
ax.XAxis.Color = 'k';
ax.YAxis.LineWidth = 4;
ax.YAxis.Color = 'k';
ax.FontSize = 15;
ax.FontWeight = 'bold';
ax.XLabel.FontSize = 20;
ax.YLabel.FontSize = 20;
ax.GridLineWidth = 2;

%%
tab_pos = tab;
tab.frequency = tab.frequency';
tab.amplitude = tab.amplitude';
tab.Percent_change = tab.Percent_change';
tab.Percent_change_amp = tab.Percent_change_amp';
table = struct2table(tab);
% % To Save in excel 
% writetable(struct2table(tab), 'Table.csv')
tab_fre = table(:,[1 2 4]);
tab_amp = table(:,[1 3 5]);

%order the frquency bar plot
tab_fre_sort = sortrows(tab_fre,'Percent_change');

 Percent_change_pos = round(sort(tab_pos.Percent_change),2);
 pos1 = (abs(Percent_change_pos)+0.5).*(Percent_change_pos./abs(Percent_change_pos));
 pos1(isnan(pos1))=0;

figure(2)
bfre = bar(tab_fre_sort.Parameter,tab_fre_sort.Percent_change);
text(1:length(Percent_change_pos),pos1,num2str(Percent_change_pos'),'vert','middle','horiz','center','rotation',90); 
ylabel('Percentage change of Frequency')
xlabel('Parameters')
% bfre.Labels=bfre.(tab_fre_sort.Percent_change);
box on
grid on
ax=gca;
ax.XAxis.LineWidth = 4;
ax.XAxis.Color = 'k';
ax.YAxis.LineWidth = 4;
ax.YAxis.Color = 'k';
ax.FontSize = 15;
ax.FontWeight = 'bold';
ax.XLabel.FontSize = 20;
ax.YLabel.FontSize = 20;
ax.GridLineWidth = 2;

%%
%order the amplitude bar plot
tab_amp_sort = sortrows(tab_amp,'Percent_change_amp');

 Percent_change_amp_pos = round(sort(tab_pos.Percent_change_amp),2);
 pos2 = (abs(Percent_change_amp_pos)+3).*(Percent_change_amp_pos./abs(Percent_change_amp_pos));
 pos2(isnan(pos2))=0;

figure(3)
bamp=bar(tab_amp_sort.Parameter,tab_amp_sort.Percent_change_amp);
text(1:length(Percent_change_amp_pos),pos2,num2str(Percent_change_amp_pos'),'vert','middle','horiz','center','rotation',90); 
ylabel('Percentage change of Amplitude')
xlabel('Parameters')
% bamp.Labels=bamp.tab_fre_sort.Percent_change_amp;
box on
grid on
ax=gca;
ax.XAxis.LineWidth = 4;
ax.XAxis.Color = 'k';
ax.YAxis.LineWidth = 4;
ax.YAxis.Color = 'k';
ax.FontSize = 15;
ax.FontWeight = 'bold';
ax.XLabel.FontSize = 20;
ax.YLabel.FontSize = 20;
ax.GridLineWidth = 2;