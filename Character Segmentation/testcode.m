
ClassA = replace(ClassA,indi);
ClassA = remove(ClassA,indi);
ClassA = ClassA(1:100,:);

figure;
hold on;
for i=1:size(ClassA,3)
    subplot(15,10,i)
    imshow(ClassA(:,:,i));
end



ClassA1=ClassA;