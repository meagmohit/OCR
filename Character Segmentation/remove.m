function answers = remove(data,indi)

data(:,:,indi)=[];

answers=data;

figure;
hold on;
for i=1:size(data,3)
    subplot(15,10,i)
    imshow(data(:,:,i));
end

