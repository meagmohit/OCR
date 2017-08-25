function [ calc_result ] = Calculation( input_string )
    %calcSolve Calculate the result or solve the equation, if could.
    %       
    string = processString( input_string );
    
    if ~isempty(regexp(string, '[a-z]','once'))
        calc_result = char(solve(string));
    else
        calc_result = eval(string);
    end
    
    
end

function output_string = processString( input_string )
    newString = regexprep(input_string, '\\times{}|\\times |\times', '\*');
    str = regexprep(newString, '\\div{}|\\div ','/');
    
    index = regexp(str, '[0-9][a-z]');
    for i = 1:length(index)
        str = [str(1:index(i)) '*' str(index(i)+1 : end)];
        index = index+1;
    end
    
    output_string = str;
    
    % extract subscript
    bracketStart = regexp(str,  '{');
    bracketEnd = regexp(str, '}');
    
    if length(bracketStart) ~= length(bracketEnd)
        error(' bracket not in pairs');
    end
    
    N = length(bracketStart);
    for i = 1:N/2
        subscript{i} = str(bracketStart(2*i-1)+1:bracketEnd(2*i-1)-1);
        superscirpt{i} = str(bracketStart(2*i)+1:bracketEnd(2*i)-1);
    end
    
    for i = 1:N/2
        substr = str(bracketEnd(2*i) +1:end);
        idx = regexp(substr,'[+-*/]');
        if isempty(idx)
            contentEnd(i) = length(str);
        else
            contentEnd(i) = idx(1) + bracketEnd(2*i) - 1;   
        end 
        content{i} = str( bracketEnd(2*i)+1:contentEnd(i) );
    end
    
    sumIndex = regexp(str, '\\sum');
    prodIndex = regexp(str, '\\prod');
    
    index = [sumIndex prodIndex];
    operatorIdx = [ones(size(sumIndex)) -1*ones(size(prodIndex))];
    [index, idx] = sort(index);
    operatorIdx = operatorIdx(idx);
    
    for ii = 1:N/2
        if operatorIdx(ii) == 1
            operator = 'symsum';
        else
            operator = 'symprod';
        end
        
        letter = subscript{ii}(1);
        eval(['syms ' letter]);
        sub = subscript{ii}(3:end);
        command = [operator '(' content{ii} ',' sub ',' superscirpt{ii} ')'];
        result = eval(command);
        str = [str(1:index(ii)-1) char(result) str(contentEnd(ii)+1:end)];
        
        diff = contentEnd(ii) - index(ii)+1 - length(char(result));
        index = index - diff;
        contentEnd = contentEnd - diff;

    end

    output_string = str;
end

