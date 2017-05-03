torqueLA = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jLeftAnkle_roty'),:);
torqueLH = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jLeftHip_roty'),:);
torqueRA = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightAnkle_roty'),:);
torqueRH = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightHip_roty'),:);

angleLA = human_state.q(valueFromName(selectedJoints, 'jLeftAnkle_roty'),:)*180/pi;
angleLH = human_state.q(valueFromName(selectedJoints, 'jLeftHip_roty'),:)*180/pi;
angleRA = human_state.q(valueFromName(selectedJoints, 'jRightAnkle_roty'),:)*180/pi;
angleRH = human_state.q(valueFromName(selectedJoints, 'jRightHip_roty'),:)*180/pi;

t = 1:1:size(torqueRA,2); 

%% RIGHT 
minRA = min(torqueRA);
minRH = min(torqueRH);
minRight = min([minRA minRH]);
maxRA = max(torqueRA);
maxRH = max(torqueRH);
maxRight = max([maxRA maxRH]);
figure
subplot (211)
torqueRAnorm= (torqueRA-minRight)/(maxRight-minRight);
torqueRHnorm= ((torqueRH-minRight)/(maxRight-minRight));
plot(t, torqueRAnorm)             
hold on
plot(t, torqueRHnorm) 
hold on
leg = legend('jRightAnkle','jRightHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);
axis tight;
subplot (212)
plot(t, angleRA)             
hold on
plot(t, angleRH) 
hold on
leg = legend('jRightAnkle','jRightHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);
axis tight;

%% LEFT
minLA = min(torqueLA);
minLH = min(torqueLH);
minLeft = min([minLA minLH]);
maxLA = max(torqueLA);
maxLH = max(torqueLH);
maxLeft = max([maxLA maxLH]);
figure
subplot (211)
torqueLAnorm= (torqueLA-minLeft)/(maxLeft-minLeft);
torqueLHnorm= ((torqueLH-minLeft)/(maxLeft-minLeft));
plot(t, torqueLAnorm)             
hold on
plot(t, torqueLKnorm) 
hold on
leg = legend('jLeftAnkle','jLeftHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);  
axis tight;
subplot (212)
plot(t, angleLA)             
hold on
plot(t, angleLK) 
hold on
leg = legend('jLeftAnkle','jLeftHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);  
axis tight;

