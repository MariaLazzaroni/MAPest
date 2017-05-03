torqueLK = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jLeftKnee_roty'),:);
torqueLH = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jLeftHip_roty'),:);
torqueRK = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightKnee_roty'),:);
torqueRH = mu_dgiveny(rangeOfDynamicVariable( berdy, iDynTree.DOF_TORQUE, 'jRightHip_roty'),:);

angleLK = human_state.q(valueFromName(selectedJoints, 'jLeftKnee_roty'),:)*180/pi;
angleLH = human_state.q(valueFromName(selectedJoints, 'jLeftHip_roty'),:)*180/pi;
angleRK = human_state.q(valueFromName(selectedJoints, 'jRightKnee_roty'),:)*180/pi;
angleRH = human_state.q(valueFromName(selectedJoints, 'jRightHip_roty'),:)*180/pi;

t = 1:1:size(torqueRA,2); 

%% RIGHT 
minRK = min(torqueRK);
minRH = min(torqueRH);
minRight = min([minRK minRH]);
maxRK = max(torqueRK);
maxRH = max(torqueRH);
maxRight = max([maxRK maxRH]);
figure
subplot (211)
torqueRKnorm= ((torqueRK-minRight)/(maxRight-minRight));
torqueRHnorm= ((torqueRH-minRight)/(maxRight-minRight));
plot(t, torqueRKnorm) 
hold on
plot(t, torqueRHnorm) 
hold on
leg = legend('jRightKnee','jRightHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);
axis tight;
subplot (212)
plot(t, angleRK) 
hold on
plot(t, angleRH) 
hold on
leg = legend('jRightKnee','jRightHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);
axis tight;

%% LEFT
minLK = min(torqueLK);
minLH = min(torqueLH);
minLeft = min([minLK minLH]);
maxLK = max(torqueLK);
maxLH = max(torqueLH);
maxLeft = max([maxLK maxLH]);
figure
subplot (211)
torqueLKnorm= ((torqueLK-minLeft)/(maxLeft-minLeft));
torqueLHnorm= ((torqueLH-minLeft)/(maxLeft-minLeft));
plot(t, torqueLKnorm) 
hold on
plot(t, torqueLHnorm) 
hold on
leg = legend('jLeftKnee','jLeftHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);  
axis tight;
subplot (212)
plot(t, angleLK) 
hold on
plot(t, angleLH)
hold on
leg = legend('jLeftKnee','jLeftHip','Location','southeast');
                    set(leg,'Interpreter','latex');
                    set(leg,'FontSize',13);  
axis tight;

