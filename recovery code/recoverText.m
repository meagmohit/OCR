function str = recoverText(r)

% only one line
% no multi-level super/sub-script allowed
% no operator in super/sub-script allowed

str = '';
if size(r, 2) == 0
    return;
end
[base_line, ~] = verticalCentroid(r(1));  % the first one cannot be sub/super-script
err = 0.07 * (r(1).bounding(3) - r(1).bounding(1));
str = [str, mapLabel2Char(r(1).label)];
ops = [37, 39, 40, 41, 42, 43, 47, 75, 76, 48, 51, 52, 53, 54];

num = size(r, 2);
flag = 'normal';  % 0-normal, 1-abnormal
super_buffer = [];
sub_buffer = [];
for i = 2 : num
    bi = r(i).bounding;
    bottom = bi(3);
    [~, top] = verticalCentroid(r(i));
    if ~isempty(ops(ops == r(i).label))  % operants cannot be sub/super-script
        if ~strcmp(flag, 'normal')
            str = [str, '^{', super_buffer, '}_{', sub_buffer, '}'];
        end
        str = [str, mapLabel2Char(r(i).label)];
        flag = 'normal';
        super_buffer = [];
        sub_buffer = [];
    else        
        if bottom < base_line + err  % superscript
            super_buffer = [super_buffer, mapLabel2Char(r(i).label)];
            flag = 'superscript';
        elseif top > base_line - err  % subscript
            sub_buffer = [sub_buffer, mapLabel2Char(r(i).label)];
            flag = 'subscript';
        else
            if ~strcmp(flag, 'normal')
                str = [str, '^{', super_buffer, '}_{', sub_buffer, '}'];
            end
            str = [str, mapLabel2Char(r(i).label)];
            flag = 'normal';
            super_buffer = [];
            sub_buffer = [];
        end
    end
end
if ~strcmp(flag, 'normal')
    str = [str, '^{', super_buffer, '}_{', sub_buffer, '}'];
end
