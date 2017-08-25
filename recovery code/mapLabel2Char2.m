function char = mapLabel2Char(label)

switch label
    case 1
        char = '1';
    case 2
        char = '2';
    case 3
        char = '3';
    case 4
        char = '4';
    case 5
        char = '5';
    case 6
        char = '6';
    case 7
        char = '7';
    case 8
        char = '8';
    case 9
        char = '9';
    case 10
        char = '0';
        
    case 11
        char = 'a';
    case 12
        char = 'b';
    case 13
        char = 'c';
    case 14
        char = 'd';
    case 15
        char = 'e';
    case 16
        char = 'f';
    case 17
        char = 'g';
    case 18
        char = 'h';
    case 19
        char = 'i';
    case 20
        char = 'j';        
    case 21
        char = 'k';
    case 22
        char = 'l';
    case 23
        char = 'm';
    case 24
        char = 'n';
    case 25
        char = 'o';
    case 26
        char = 'p';
    case 27
        char = 'q';
    case 28
        char = 'r';
    case 29
        char = 's';
    case 30
        char = 't';        
    case 31
        char = 'u';
    case 32
        char = 'v';
    case 33
        char = 'w';
    case 34
        char = 'x';
    case 35
        char = 'y';
    case 36
        char = 'z';
        
    case 37
        char = '+';
    case 38  % need further process
        char = '-';
    case 39  % ×
        char = '\times ';
    case 40  % ÷
        char = '\[';       
    case 41
        char = '\]';
    case 42  % ·
        char = '(';
    case 43
        char = ')';
    case 44
        char = '\sum';
    case 45  % ?
        char = '\int';
    case 46  % ?
        char = '\sqrt';
    case 47  % ??
        char = '/';
    case 48
        char = '*';
    case 49
        char = '\pi';
    case 50  % ?
        char = '\prod ';
        
    case 51
        char = '\div ';
    case 52
        char = '= ';
    case 53
        char = ' <';
    case 54
        char = '> ';
    case 55
        char = '\lambda';
    case 56
        char = '\alpha';
    case 57
        char = '\beta';
    case 58
        char = '\gamma';
    case 59
        char = '\delta';
    case 60
        char = '\epsilon';
        
    % label 'line'(38) as ·, - and ??
    % need not to generate this 3 labels in the recognition part
    case 75
        char = '\cdot ';
    case 76
        char = '-';
    case 77
        char = '\frac';
                
    otherwise
        char = '';
end