clc;clear
num = 10000;
u = 0;
energy_de = xlsread('M:\总\序贯贝叶斯\实测能谱\Cs137能量沉积.xls',2,'B2:D1025');
energy_save(:,1) = zeros(num,1);
l_save = zeros(10000,1);
miu = 0.662; 
fenbianlv = 0.0312; 
sigema = fenbianlv*miu/2.355;   %正态分布的方差
miu_xia = miu - 3*sigema;
miu_shang = miu + 3*sigema;
for i=1:num
    R = rand*energy_de(length(energy_de(:,3)),3);
    [~,l]=min(abs(R-energy_de(:,3)));    %将区间的能量转化为能谱的道址
    if energy_de(l,1)> miu_xia && energy_de(l,1)< miu_shang
        u = u+1;
        energy_save(u,1) = energy_de(l,1);
        l_save(u) = l;
    end
end