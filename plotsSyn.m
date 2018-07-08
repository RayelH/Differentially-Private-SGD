function plotsSyn()
rng(1)
batch_sizes = [50 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000];
objectives = zeros(size(batch_sizes));
stdevs = zeros(size(batch_sizes));
sgd_obj = zeros(size(batch_sizes));


for i = 1:length(batch_sizes)
    
    [temp1, temp2, temp3] = plotObj(5,batch_sizes(i));
    objectives(i) = temp1;
    stdevs(i) = temp2; 
    sgd_obj(i) = temp3;
    
end
x = [50 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000];
plot(x,sgd_obj,'r',x,objectives,'b')
hold on;
errorbar(x,objectives,stdevs,'-s','MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor','b')
axis([1 2050 0 10])
legend('non-private 1/sqrt(t)','private 1/sqrt(t)','standard deviation')
title('learning rate = 1/sqrt(t)')
xlabel('number of data points') % x-axis label
ylabel('Value of objective') % y-axis label

end