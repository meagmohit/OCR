function r = distinguishLine2(r)

n = size(r, 2);
for i = 1 : n
    if r(i).label == 38
        h = r(i).bounding(3) - r(i).bounding(1);
        w = r(i).bounding(4) - r(i).bounding(2);
        if h <= 1.5 * w && w <= 1.5 * h  % ·
            r(i).label = 75;
        else
            left = r(i).bounding(2);
            right = r(i).bounding(4);
            up = [];
            down = [];
            for j = 1 : n
                if j ~= i
                    b = r(j).bounding;  % bounding of the char over/bottom
                    if (b(2) < left && b(4) > right) || (b(4) > left && b(4) < right) ...
                            || (b(2) > left && b(2) < right)
                        if b(3) < r(i).bounding(1)
                            up = [up; [j, b(3)]];
                        elseif b(1) > r(i).bounding(3)
                            down = [down; [j, b(1)]];
                        end
                    end
                end
            end
            if isempty(up) || isempty(down)
                r(i).label = 76;
            else
                up = sortrows(up, -2);
                down = sortrows(down, 2);
%                 w1 = right - left;
%                 w2 = r(up(1)).bounding(4) - r(up(1)).bounding(2);
%                 w3 = r(down(1)).bounding(4) - r(down(1)).bounding(2);
%                 if (w2 < 1.5 * w1 || r(up(1)).label == 47) &&... 
%                     (w3 < 1.5 * w1 || r(down(1)).label == 47)
                if (r(up(1)).label ~= 38 && r(up(1)).label ~= 77) &&...
                        (r(down(1)).label ~= 38 && r(down(1)).label ~= 77)
                    r(i).label = 77;
                else
                    r(i).label = 76;
                end
            end
        end
    end
end