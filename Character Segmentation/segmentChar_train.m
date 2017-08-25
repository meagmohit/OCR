
close all; clear all; clc
N1=10;   % No of Total Images
N2=10;      % Total no of character is each image
ClassA = zeros(20,20,N1*N2);
k=0;
for ind=1:N1
ind
[src0,map] = imread(strcat('testsample/ND/',num2str(ind),'.jpg'));

result = segmentChar(src0,map);

% figure
% imshow(src0,map);
% hold on
% for i = 1 : size(result, 2)
%     pos = result(i).bounding;
%     rectangle('Position', [pos(2), pos(1), pos(4) - pos(2),...
%         pos(3) - pos(1)], 'EdgeColor', 'r');
% end

% figure
% hold on
for i = 1 : min(80, size(result, 2))
    if(sum(sum(result(i).data))>20)
        k=k+1;
           ClassA(:,:,k) = result(i).data;
%         subplot(8, 10, k);
%        imshow(result(i).data);
    end
end
end
figure;
hold on;
for i=1:size(ClassA,3)
    subplot(15,10,i)
    imshow((ClassA(:,:,i)));
end

