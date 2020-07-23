function [Recurrence_period_value] = Gumble_func(data,N,len)
% dataӦΪһ������
% NΪ������һ��
% lenΪ������������
% Recurrence_period_valueΪN��һ��ֵ
datasort = sort(data,'descend');
data_select_sort = datasort(1:len);

mu = mean(data_select_sort);
sum = 0;
for i = 1:length(data_select_sort)
    sum = sum + (data_select_sort(i) - mu)^2;
end
sigma = sqrt(sum/(length(data_select_sort)-1)); %��׼��
alpha = pi/(sqrt(6)*sigma);
u = mu - 0.57721/alpha;
for i = 1 : 0.1 : 500 %��ˮ������Ϊ1~500mm
    if 1/N >= 1 - exp(-exp(-alpha*(i - u)))  % N��һ��
        Recurrence_period_value = i;  %  Recurrence_period_value��ΪN��һ����ˮֵ
        break;
    end
end
end