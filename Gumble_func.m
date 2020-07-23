function [Recurrence_period_value] = Gumble_func(data,N,len)
% data应为一列数据
% N为多少年一遇
% len为所用数据年数
% Recurrence_period_value为N年一遇值
datasort = sort(data,'descend');
data_select_sort = datasort(1:len);

mu = mean(data_select_sort);
sum = 0;
for i = 1:length(data_select_sort)
    sum = sum + (data_select_sort(i) - mu)^2;
end
sigma = sqrt(sum/(length(data_select_sort)-1)); %标准差
alpha = pi/(sqrt(6)*sigma);
u = mu - 0.57721/alpha;
for i = 1 : 0.1 : 500 %降水量设置为1~500mm
    if 1/N >= 1 - exp(-exp(-alpha*(i - u)))  % N年一遇
        Recurrence_period_value = i;  %  Recurrence_period_value即为N年一遇降水值
        break;
    end
end
end