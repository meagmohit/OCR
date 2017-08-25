function str = recover(grp, r)

str = '';
num = size(r, 2);
if size(grp, 1) == 1 && cell2mat(grp(1, 3)) == 61
    idx = cell2mat(grp(1, 1));
    r1 = r(idx);
    str = [str, recoverText(r1)];
    return;
end

for i = 1 : size(grp, 1)
    if cell2mat(grp(i, 3)) == 46  % sqrt
        idx = cell2mat(grp(i, 1));
        idx(1) = [];
        str = [str, '\sqrt{', recover(group(r, setdiff(1:num, idx)), r), '}'];
    elseif cell2mat(grp(i, 3)) == 77 || cell2mat(grp(i, 3)) == 44 || cell2mat(grp(i, 3)) == 50 % fraction
        idx = cell2mat(grp(i, 1));
        frac = r(idx(1));
        idx(1) = [];
        r_up = [];
        r_down = [];
        for j = 1 : length(idx)
            if r(idx(j)).bounding(3) < frac.bounding(1)
                r_up = [r_up, idx(j)];
            else
                r_down = [r_down idx(j)];
            end
        end
        if cell2mat(grp(i, 3)) == 77  % frac
%             gup = group(r, setdiff(1:num, r_up))
%             gdown = group(r, setdiff(1:num, r_down))
            str = [str, '\frac{', recover(group(r, setdiff(1:num, r_up)), r),...
                '}{', recover(group(r, setdiff(1:num, r_down)), r), '}']; 
        elseif cell2mat(grp(i, 3)) == 44  % Sigma
            
            str = [str, '\sum'];
            if ~isempty(r_down)
                str = [str, '_{', recover(group(r, setdiff(1:num, r_down)), r), '}'];
            end
            if ~isempty(r_up)
                str = [str, '^{', recover(group(r, setdiff(1:num, r_up)), r), '}']; 
            end
            
        else
            str = [str, '\prod'];
            
            if ~isempty(r_down)
                str = [str, '_{', recover(group(r, setdiff(1:num, r_down)), r), '}'];
            end
            if ~isempty(r_up)
                str = [str, '^{', recover(group(r, setdiff(1:num, r_up)), r), '}']; 
            end
        end
%         clear r_up r_down;
    else  % normal
        idx = cell2mat(grp(i, 1));
        r1 = r(idx);
        str = [str, recoverText(r1)];
    end
end


