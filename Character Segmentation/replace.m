function answers = replace(data,indi)

for i=1:size(indi,1)
    ind1 = indi(i,1);
    ind2 = indi(i,2);
    data(:,:,ind1)=data(:,:,ind2);
end

answers=data;

figure;
hold on;
for i=1:size(data,3)
    subplot(15,10,i)
    imshow(data(:,:,i));
end

