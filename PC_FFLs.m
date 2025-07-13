clear 
close all
clc

k3s = 0.56 ; 
v4 = 1.5; 
v1 = 4.6; v1L = 3; v2A = 1.3; v2B = 1.5; v2L = 5; v3 = 1;
k1L = 0.53; k1D = 0.21; k2s = 0.35; k4s = 0.57;
p1 = 0.76; p1L = 0.42; p2 = 1; p3 = 0.64; p4 = 1;
d1 = 0.68; d2D = 0.5; d2L = 0.3; d3D = 0.48; d3L = 0.78; d4D = 1.2; d4L = 0.38;
K1 = 0.16; K2 = 1.2; K3 = 0.24; K4 = 0.23; K5 = 0.3; K6 = 0.46; K7 = 2; K8 = 0.36; K9 = 1.9; K10 = 1.9;
L=1; D = 0;


%%
% C4FFL 1
% Fig-6A (End panel) 

dt = 0.001;
tot = 72000;

 CLp = zeros(1,tot);
 P97m = zeros(1,tot);
 P97p = zeros(1,tot);
 ELm = zeros(1,tot);
 ELp = zeros(1,tot);
 P = zeros(1,tot);

  CLm = [zeros(1,tot/6) ones(1,tot/6) zeros(1,tot/6) ones(1,tot/6) zeros(1,tot/6) ones(1,tot/6)];

 CLp(1) = 0;
 P97m(1) = 0;
 P97p(1) = 0;
 ELm(1) = 0;
 ELp(1) = 0;
 P(1) = 0;


for i = 1:tot-1

 CLp(i+1) = CLp(i) + dt*(((p1+p1L*L)*CLm(i))-(d1*CLp(i)));
 P97m(i+1) = P97m(i) + dt*(((v2L*L*P(i))+ v2A +(v2B*((CLp(i)^2)/(K3^2+CLp(i)^2))))*(1/(1+((ELp(i)/K5)^2)))-(k2s*P97m(i)));
 P97p(i+1) = P97p(i) + dt*((p2*P97m(i))-(((d2L*L))*P97p(i)));
 ELm(i+1) = ELm(i) + dt*((L*v4*(1/(1+(((CLp(i)/K8)^2))))) - (k4s*ELm(i)));
 ELp(i+1) = ELp(i) + dt*((p4*ELm(i))-((d4L*L))*ELp(i));
 P(i+1) = P(i) + dt*(-(P(i)*L));

 end

time = (0:length(ELm)-1)*dt;


%Below is the normalized plot.
figure(1)

plot(time,CLm,'k',time, ELm/max(ELm),'b', time, P97m/max(P97m), 'r', 'Linewidth',3)
grid on
legend('CLm','ELm','P97m')
xlabel('Time','fontweight','bold','fontsize',30)
ylabel('CLm/ELm/P97m','fontweight','bold','fontsize',30);


%%
% C4FFL 2
% Fig-6B (End panel)

dt = 0.001;
tot = 72000;

CLp = zeros(1,tot);
P51m =zeros(1,tot);
P51p =zeros(1,tot);
P97m =zeros(1,tot);
P97p =zeros(1,tot);
P = zeros(1,tot);

  CLm = [zeros(1,tot/6) ones(1,tot/6) zeros(1,tot/6) ones(1,tot/6) zeros(1,tot/6) ones(1,tot/6)];

 CLp(1) = 0;
 P51m(1) = 0;
 P51p(1) = 0;
 P97m(1) = 0;
 P97p(1) = 0;
 P(1) = 0;

for i = 1:tot-1

CLp(i+1) = CLp(i) + dt*(((p1+p1L*L)*CLm(i))-(d1*CLp(i)));
P51m(i+1) = P51m(i) + dt*((v3*(1/(1+((CLp(i)/K6)^2)))) - (k3s*P51m(i)));
P51p(i+1) = P51p(i) + dt*((p3*P51m(i))-(((d3D*D)+(d3L*L))*P51p(i)));
P97m(i+1) = P97m(i) + dt*(((v2L*L*P(i))+ v2A +(v2B*((CLp(i)^2)/(K3^2+CLp(i)^2))))*(1/(1+((P51p(i)/K4)^2)))-(k2s*P97m(i)));
P97p(i+1) = P97p(i) + dt*((p2*P97m(i))-(((d2D*D)+(d2L*L))*P97p(i)));
P(i+1) = P(i) + dt*((0.3*(1-P(i))*D)-(P(i)*L));

 end

time = (0:length(P97m)-1)*dt;


%Below is the normalized plot.
figure(2)

plot(time,CLm,'k',time, P51m/max(P51m),'b', time, P97m/max(P97m), 'r', 'Linewidth',3)
grid on
legend('CLm','P51m','P97m')
xlabel('Time','fontweight','bold','fontsize',30)
ylabel('CLm/P51m/P97m','fontweight','bold','fontsize',30);

%%
% I2FFL 1
% Fig-6C (End panel)

dt = 0.001;
tot = 72000;

P51p = zeros(1,tot);
P97m = zeros(1,tot);
P97p = zeros(1,tot);
CLm = zeros(1,tot);
CLp = zeros(1,tot);
P = zeros(1,tot);


 
 P51m = [zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5];

  P51p(1) = 0;
  P97m(1) = 0;
  P97p(1) = 0;
  CLm(1) = 0;
  CLp(1) = 0;
  P(1) = 0;
 

for i = 1:tot-1

P51p(i+1) = P51p(i) + dt*((p3*P51m(i))-(((d3D*D)+(d3L*L))*P51p(i)));
P97m(i+1) = P97m(i) + dt*(((v2L*L*P(i))+ v2A)*(1/(1+((P51p(i)/K4)^2)))-(k2s*P97m(i)));
P97p(i+1) = P97p(i) + dt*((p2*P97m(i))-(((d2D*D)+(d2L*L))*P97p(i)));
CLm(i+1) = CLm(i) + dt*((v1+(v1L*L*P(i)))*(1/(1+((P97p(i)/K1)^2)+((P51p(i)/K2)^2))) - (((k1L*L)+(k1D*D))*CLm(i)));
CLp(i+1) = CLp(i) + dt*(((p1+p1L*L)*CLm(i))-(d1*CLp(i)));
P(i+1) = P(i) + dt*((0.3*(1-P(i))*D)-(P(i)*L));


 end

time = (0:length(CLm)-1)*dt;

%Below is the normalized plot.
figure(3)

plot(time,P51m/max(P51m),'k',time, P97m/max(P97m),'b', time, CLm/max(CLm), 'r', 'Linewidth',3)
grid on
legend('P51m','P97m','CLm')
xlabel('Time','fontweight','bold','fontsize',30)
ylabel('P51m/P97m/CLm','fontweight','bold','fontsize',30);

%%
% I2FFL 2
% Fig-6D (End panel)

dt = 0.001;
tot = 72000;

P51p = zeros(1,tot);
ELm = zeros(1,tot);
ELp = zeros(1,tot);
P97m = zeros(1,tot);
P97p = zeros(1,tot);
P = zeros(1,tot);

P51m = [zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5];
P51p(1) = 0;
ELm(1) = 0;
ELp(1) = 0;
P97m(1) = 0;
P97p(1) = 0;
P(1) = 0;


for i = 1:tot-1


P51p(i+1) = P51p(i) + dt*((p3*P51m(i))-(((d3D*D)+(d3L*L))*P51p(i)));
ELm(i+1) = ELm(i) + dt*((L*v4*(1/(1+(((P51p(i)/K9)^2))))) - (k4s*ELm(i)));
ELp(i+1) = ELp(i) + dt*((p4*ELm(i))-((d4D*D)+(d4L*L))*ELp(i));
P97m(i+1) = P97m(i) + dt*(((v2L*L*P(i))+ v2A)*(1/(1+((P51p(i)/K4)^2)+((ELp(i)/K5)^2)))-(k2s*P97m(i)));
P97p(i+1) = P97p(i) + dt*((p2*P97m(i))-(((d2D*D)+(d2L*L))*P97p(i)));
P(i+1) = P(i) + dt*((0.3*(1-P(i))*D)-(P(i)*L));
 

 end

time = (0:length(P97m)-1)*dt;

%Below is the normalized plot.
figure(4)

plot(time,P51m/max(P51m),'k',time, ELm/max(ELm),'b', time, P97m/max(P97m), 'r', 'Linewidth',3)
grid on
legend('P51m','ELm','P97m')
xlabel('Time','fontweight','bold','fontsize',30)
ylabel('P51m/ELm/P97m','fontweight','bold','fontsize',30);

%%
% I2FFL 3
% Fig-6E (End panel)

dt = 0.001;
tot = 72000;

CLp = zeros(1,tot);
P51m = zeros(1,tot);
P51p = zeros(1,tot);
ELm = zeros(1,tot);
ELp = zeros(1,tot);
P = zeros(1,tot);


 
   CLm = [zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5 zeros(1,tot/6) ones(1,tot/6)*5];
  CLp(1) = 0;
  P51m(1) = 0;
  P51p(1) = 0;
  ELm(1) = 0;
  ELp(1) = 0;
  P(1) = 0;


for i = 1:tot-1



CLp(i+1) = CLp(i) + dt*(((p1+p1L*L)*CLm(i))-(d1*CLp(i)));
P51m(i+1) =  P51m(i) + dt*((v3*(1/(1+((CLp(i)/K6)^2)))) - (k3s*P51m(i)));
P51p(i+1) = P51p(i) + dt*((p3*P51m(i))-(((d3D*D)+(d3L*L))*P51p(i)));
ELm(i+1) = ELm(i) + dt*((L*v4*(1/(1+(((CLp(i)/K8)^2)+((P51p(i)/K9)^2))))) - (k4s*ELm(i)));
ELp(i+1) = ELp(i) + dt*((p4*ELm(i))-((d4D*D)+(d4L*L))*ELp(i));
P(i+1) = P(i) + dt*((0.3*(1-P(i))*D)-(P(i)*L));
  
 end

time = (0:length(ELm)-1)*dt;


%Below is the normalized plot.
figure(5)

plot(time,CLm/max(CLm),'k',time, P51m/max(P51m),'b', time, ELm/max(ELm), 'r', 'Linewidth',3)
grid on
legend('CLm','P51m','ELm')
xlabel('Time','fontweight','bold','fontsize',30)
ylabel('CLm/P51m/ELm','fontweight','bold','fontsize',30);

%%
for iplot = 1:1:5
figure(iplot)
ax=gca;
ax.XAxis.LineWidth = 4;
ax.XAxis.Color = 'k';
ax.YAxis.LineWidth = 4;
ax.YAxis.Color = 'k';
ax.FontSize = 20;
ax.FontWeight = 'bold';
ax.XLabel.FontSize = 30;
ax.YLabel.FontSize = 30;
ax.GridLineWidth = 2;
ax.Legend.Location = 'Best';
ax.Legend.NumColumns = 3;

grid on
alphabet = ['6',char(iplot+64)];
title(alphabet,'fontsize',15','horizontalAlignment','right')
ax.XLim = [0,72];
ax.YLim = [0,1.5];
ax.XTick = [0 12 24 36 48 60 72];
end

