close all; clear all; clc

[src0,map] = imread('../TestImage/14.png');

result = segmentChar(src0,map);

figure
imshow(src0);
hold on
for i = 1 : size(result, 2)
    pos = result(i).bounding;
    rectangle('Position', [pos(2), pos(1), pos(4) - pos(2),...
        pos(3) - pos(1)], 'EdgeColor', 'r');
end

figure
hold on
for i = 1 : min(60, size(result, 2))
    subplot(6, 10, i);
    imshow(result(i).data);
end