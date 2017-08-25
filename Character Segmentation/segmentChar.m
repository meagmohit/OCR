function result = segmentChar(src0,map)

% input: original image matrix
% output: a struct result, which has 2 areas
%         (1) result.bounding - row # of leftupper point, col # of leftupper
%         point, row # of rightbottom point, col # of rightbottom point
%         (2) result.data - a 20x20 0-1 matrix of the separated character

src = ~im2bw(src0,map,0.2);
[h, w] = size(src);

l = bwlabel(src);
N = max(max(l));

% 1-area, 2-top(row), 3-left(col), 4-bottom(row), 5-right(col),
% 6-height(row), 7-width(col), 8-ratio, 9-label,
% 10-center(row), 11-center(col)
stat = zeros(N, 9);
for i = 1 : N
    [r, c] = find(l == i);
    stat(i, 1) = length(r);
    stat(i, 3) = min(c);
    stat(i, 2) = min(r);
    stat(i, 5) = max(c);
    stat(i, 4) = max(r);
    stat(i, 6) = stat(i, 4) - stat(i, 2) + 1;
    stat(i, 7) = stat(i, 5) - stat(i, 3) + 1;
    stat(i, 8) = round(stat(i, 1) / (stat(i, 6) * stat(i, 7)) * 100);
    stat(i, 9) = i;
    stat(i, 10) = 0.5 * stat(i, 6) + stat(i, 2);
    stat(i, 11) = 0.5 * stat(i, 7) + stat(i, 3);
end

li = 1;
di = 1;
lines = [];
dots = [];
for i = 1 : N
    if stat(i, 7) > 5 * stat(i, 6) && stat(i, 8) > 50
        lines(li) = stat(i, 9);
        li = li + 1;
    elseif stat(i, 8) > 70
        if stat(i, 6) < 1.25 * stat(i, 7) && stat(i, 7) < 1.25 * stat(i, 6)
            dots(di) = stat(i, 9);
            di = di + 1;
        end
    end
end

if ~isempty(lines)
    i = 1;
    while i <= length(lines)
        init_j = stat(lines(i), 2) - 1;
        col = round(stat(lines(i), 11));
        for j = init_j : -1 : 1
            if l(j, col) ~= 0
                idx = l(j, col);
                idx2 = find(lines == idx);
                if size(idx2, 2) == 0
                    break;
                else
                    w1 = stat(lines(i), 7);
                    w2 = stat(lines(idx2), 7);
                    if (w1 < w2 * 1.1) || (w2 < w1 * 1.1)
                        l(l == lines(i)) = idx;
%                         lines(i) = [];
                    end
                end
                break;
            end
        end
        i = i + 1;
    end
end

if ~isempty(dots)
    char_width = sort(stat(:, 7));
    char_width = char_width(round(0.75 * N));
    i = 1;
    while i <= length(dots)
        init_j = stat(dots(i), 4) + 1;
        col = round((stat(dots(i), 11) + stat(dots(i), 3)) / 2);
        for j = init_j : h
            if l(j, col) ~= 0
                labl = l(j, col);
                if ~isempty(dots(dots == labl))  % :
                    idx = find(dots == labl);
                    l(l == labl) = dots(i);
%                     dots(idx) = [];
                elseif ~isempty(lines) && ~isempty(lines(lines == labl))  % /
                    idx = find(lines == labl);
                    wid = stat(lines(idx), 7);
                    if wid < 2 * char_width
                        init_t = stat(lines(idx), 4) + 1;
                        for t = init_t : h
                            if l(t, col) ~= 0
                                labl2 = l(t, col);
                                if ~isempty(dots(dots == labl2))
                                    l(l == labl2) = dots(i);
                                    l(l == labl) = dots(i);
%                                     dots(dots == labl2) = [];
                                    lines(idx) = [];
%                                     dots(i) = [];
%                                     i = i + 1;
                                end
                                break;
                            end
                        end
                    end
                else  % i, j
                    labl = l(j, col);
                    l(l == labl) = dots(i);
%                     dots(i) = [];
                end
                break;
            end
        end
        i = i + 1;
    end
end

t = 1;
for i = 1 : N
    if ~isempty(l(l == i))
        l(l == i) = t;
        t = t + 1;
    end
end

N = max(max(l));
% figure
% imshow(src0)
result = [];
for i = 1 : N
    b = zeros(1, 4);  % top(row), left(col), bottom(row), right(col)
    [r, c] = find(l == i);
    b(2) = min(c);
    b(1) = min(r);
    b(4) = max(c);
    b(3) = max(r);
    result(i).bounding = b;
    m = l(b(1):b(3), b(2):b(4));
    m(m ~= i) = 0;
    m(m == i) = 1;
    m = imresize(~m, [20, 20]);
    result(i).data = m;
    
%     plotRect(result(i).bounding);
end