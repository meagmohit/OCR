function g = group(r, excp)

num = size(r, 2);

special = [];
for i = 1 : num
    if ~isempty(excp(excp == i))
        continue;
    end
    if r(i).label == 46 || r(i).label == 77 || r(i).label == 44 || r(i).label == 50
        special = [special; [i, r(i).bounding(4) - r(i).bounding(2)]];
    end
end

g = {};
k = 1;
if ~isempty(special)
    special = sortrows(special, -2);
    for i = 1 : size(special, 1)
        if isempty(excp(excp == special(i, 1)))
            cel = special(i, 1);
        else
            cel = [];
        end
        b = r(special(i, 1)).bounding;
        l = r(special(i, 1)).label;
        excp = [excp cel];
        for j = 1 : num
            if ~isempty(excp(excp == j))
                continue;
            end
            c = (r(j).bounding(4) + r(j).bounding(2)) / 2;
            if c > b(2) && c < b(4)
                cel = [cel, j];
                excp = [excp j];
            end
        end
        if isempty(cel)
            continue;
        end
        g(k, :) = {cel, b(2), l};
        k = k + 1;
    end
end

t = k;
k = k - 1;
if k ~= 0
    g = sortrows(g, 2);
end
for j = 1 : k
    cel = [];
    for i = 1 : num
        if ~isempty(excp(excp == i))
            continue;
        end
        if r(i).bounding(4) < cell2mat(g(j, 2))
            cel = [cel, i];
            excp = [excp i];
        end
    end
    if isempty(cel)
        continue
    end
    g(t, :) = {cel, cell2mat(g(j, 2)) - 1, 61};  % 61 - normal
    t = t + 1;
end
cel = [];
for i = 1 : num
    if isempty(excp(excp == i))
        cel = [cel i];
        excp = [excp i];
    end
end
if ~isempty(cel)
    if k ~= 0
    	g(t, :) = {cel, cell2mat(g(k, 2)) + 1, 61};
    else
        g(t, :) = {cel, 1, 61};
    end
end

if ~isempty(g)
    g = sortrows(g, 2);
end