function displayTestData(testoutput, testingTargets, time, testData)
figure;
ax(1) = subplot(6,1,1:4);
title('Testing Data')
hold on
col = lines(10);
col = col*0.9;
for m = 1:5
    [~,I] = sort(mean(abs(testData{m}),2),'descend');
    channelNums(m,:) = sort(I(1:10));
    for n = 1:10
        sig = testData{m}(channelNums(m,n),:);
        sig = sig - min(sig);
        sig = sig/max(sig);
        plot(time{m},sig+n-1.5,'Color',col(m,:))
    end
end
ylabel('EEG Channels')
ax(1).XTickLabel = '';
ax(1).YTickLabel = '';
ylim([-0.5 9.5])
ax(2) = subplot(6,1,5);
hold on
area(testoutput(1,:),'FaceColor','b','FaceAlpha',0.5)
area(testoutput(2,:),'FaceColor','r','FaceAlpha',0.5)
if(size(testoutput,1)>2)
    area(testoutput(3,:),'FaceColor','g','FaceAlpha',0.5)
end
ax(2).XTickLabel = '';
ax(2).YTick = [0 1];
% ax(2).YTickLabel = {'Interictal','Ictal'};
% ax(2).YAxisLocation = 'left';
ylabel({'ANN','output'})
ax(3) = subplot(6,1,6);
hold on
area(testingTargets(1,:),'FaceColor','b','FaceAlpha',0.5)
area(testingTargets(2,:),'FaceColor','r','FaceAlpha',0.5)
if(size(testingTargets,1)>2)
    area(testingTargets(3,:),'FaceColor','g','FaceAlpha',0.5)
end
ax(3).YTick = [0 1];
% ax(3).YTickLabel = {'Interictal','Ictal'};
% ax(3).YAxisLocation = 'left';
ylabel({'Data','Labels'})
ax(1).FontSize = 14;
ax(2).FontSize = 14;
ax(3).FontSize = 14;
xlim([0 inf])
linkaxes(ax,'x')
end