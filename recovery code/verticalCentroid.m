function [centroid, top] = verticalCentroid(letter)

class1 = [11, 13, 15, 23, 24, 25, 28, 29, 31, 32, 33, 34, 36];  % a
class2 = [0:9, 12, 14, 18, 19, 21, 22, 30];  % 1, b
class3 = [17, 26, 27, 35];  % g
class4 = [16, 20];  % f, j

if ~isempty(class1(class1 == letter.label))
    centroid = (letter.bounding(1) + letter.bounding(3)) / 2;
    top = letter.bounding(1);
elseif ~isempty(class2(class2 == letter.label))
    tmp = (letter.bounding(3) - letter.bounding(1)) * 13.5/44;
    centroid = (letter.bounding(1) + tmp + letter.bounding(3)) / 2;
    top = letter.bounding(1) + tmp;
elseif ~isempty(class3(class3 == letter.label))
    tmp = (letter.bounding(3) - letter.bounding(1)) * 13.5/44;
    centroid = (letter.bounding(1) + letter.bounding(3) - tmp) / 2;
    top = letter.bounding(1);
else
    centroid = (letter.bounding(1) + letter.bounding(3)) / 2;
    top = letter.bounding(1) + 13.5/58 * (letter.bounding(3) - letter.bounding(1));
end

