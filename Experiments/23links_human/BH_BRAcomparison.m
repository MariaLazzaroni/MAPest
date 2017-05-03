% Create folder for plots
figFolder = fullfile(pwd,'/plots');
if(exist(figFolder,'dir')==0)
   mkdir(figFolder);
end

torqueRH_BRA = mu_dgivenyBRA(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightHip_roty'),:);
angleRH_BRA = human_stateBRA.q(valueFromName(selectedJoints, 'jRightHip_roty'),:)*180/pi;
torqueRH = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightHip_roty'),:);
angleRH = human_state.q(valueFromName(selectedJoints, 'jRightHip_roty'),:)*180/pi;
t = 1:1:1200;
tInterp = 1:1:1201;

torqueRH = torqueRH(1,startBH:endBH);
angleRH = angleRH(1,startBH:endBH);
NP = size(torqueRH,2);
tP = 1:1:NP;
% Hip interpolated
tPNorm = (tP/NP)*1201;
torqueHip = interp1(tPNorm,torqueRH,tInterp,'linear');
torqueRH = torqueHip(1,2:end);
angleHip = interp1(tPNorm,angleRH,tInterp,'linear');
angleRH = angleHip(1,2:end);

torqueRH_BRA = torqueRH_BRA(1,startBRA:endBRA);
angleRH_BRA = angleRH_BRA(1,startBRA:endBRA);
NP_BRA = size(torqueRH_BRA,2);
tP_BRA = 1:1:NP_BRA;
% Hip interpolated
tP_BRANorm = (tP_BRA/NP_BRA)*1201;
torqueBRAHip = interp1(tP_BRANorm,torqueRH_BRA,tInterp,'linear');
torqueRH_BRA = torqueBRAHip(1,2:end);
angleBRAHip = interp1(tP_BRANorm,angleRH_BRA,tInterp,'linear');
angleRH_BRA = angleBRAHip(1,2:end);

minRH = min(torqueRH);
minRH_BRA = min(torqueRH_BRA);
maxRH = max(torqueRH);
maxRH_BRA = max(torqueRH_BRA);
fig1 = figure();
torqueRHnorm= (torqueRH-minRH)/(maxRH-minRH);
torqueRH_BRAnorm= (torqueRH_BRA-minRH_BRA)/(maxRH_BRA-minRH_BRA);
plot(t, torqueRHnorm)              
hold on
plot(t, torqueRH_BRAnorm)
xlabel('Frames', 'FontSize',12)
ylabel('Torques Normalised ${\tau}_{hip}$ [Nm/Nm]', 'FontSize',12,'Interpreter','latex')
leg = legend('${\tau}_{hip}Human$','${\tau}_{hip}pHRI$','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',12);                   
axis tight;
grid on;

save2pdf(fullfile(figFolder,('BH_BRAcomparison')),fig1,600); 

