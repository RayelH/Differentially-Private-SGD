function [last_obj, last_stdev, sgd_cost_last] = run(b)


[X, y] = loadMnist();
number_of_perms = 20;
sgd_cost = SGD(X,y,b);
count_perms = 1;

for i = 1:number_of_perms 
    count_perms
    dp_cost = DPSGD(X,y,b);
    
    if i == 1
        avgdp_cost = zeros(size(dp_cost));
        all_dp_costs = zeros(number_of_perms,size(dp_cost, 2));
    end    
    all_dp_costs(i,:) = dp_cost;
    avgdp_cost = avgdp_cost + dp_cost;
    count_perms = count_perms+1;
end


avgdp_cost = avgdp_cost ./ number_of_perms;
s = std(all_dp_costs);


x = 1:length(avgdp_cost);
plot(x,sgd_cost,'r',x,avgdp_cost,'b')
axis([0 length(x) 0 2000])
hold on;
bars = [1:floor(length(s)/20):length(s) length(s)];
s = s(bars);
y = avgdp_cost(bars);
x_2 = x(bars);
errorbar(x_2,y,s,'-s','MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor','b','LineStyle','none')
legend('non-private SGD','private SGD','standard deviation')
title('MNIST, batch size = 1')
xlabel('Number of iterations') % x-axis label
ylabel('Value of objective') % y-axis label


last_obj = avgdp_cost(length(avgdp_cost));
last_stdev = s(length(s));
sgd_cost_last = sgd_cost(length(sgd_cost));

%s = s(numberofbars);
%size(s)




%size(y)

%x = 1:length(y);

%errorbar(x,y,s,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red');
end
