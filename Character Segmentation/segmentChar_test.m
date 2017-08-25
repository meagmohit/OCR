function [ImgData,result] = segmentChar_test(path,file)

[src0,map] = imread(strcat(path,file));
[w,h] = size(src0);

if w < 400
    src0 = imresize(src0, 400/w);
end

se = strel('disk',4);
src0 = im2bw(src0);
src0 = imopen(src0, se);

result = segmentChar(src0,map);

hfig = figure
imshow(src0,map);
hold on
for i = 1 : size(result, 2)
    pos = result(i).bounding;
    rectangle('Position', [pos(2), pos(1), pos(4) - pos(2),...
        pos(3) - pos(1)], 'EdgeColor', 'r','LineWidth',4);
end
str = strcat(path,'Out');
% set(hfig,'Units','pixels','PaperPositionMode','auto','Position', [0 0 h w],'PaperUnits','points','PaperSize',[h w],'PaperPosition',[-h -w h w]);
tightInset = get(gca, 'TightInset');
position(1) = tightInset(1);
position(2) = tightInset(2);
position(3) = 1 - tightInset(1) - tightInset(3);
position(4) = 1 - tightInset(2) - tightInset(4);
set(gca, 'Position', position);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
%>> saveas(h, 'WithoutMargins.pdf');
drawnow update;
print(hfig,'-dpng','-r0',str);
%drwanow;
close(hfig);
drawnow update;
%figure
%hold on
k=0;
for i = 1 : min(10000, size(result, 2))
    if(1)
        k=k+1;  
        ClassA(k,:) = reshape(result(i).data,1,400);
        %subplot(4, 5, i);
        %imshow(result(i).data);
    end
end

ImgData = ClassA;