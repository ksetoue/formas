% p = (1:12);
% 
% r = (1:12);
% 
% p = [1.000000, 0.901664, 0.799325, 0.737568, 0.678935, 0.632206, 0.585000, 0.545884, 0.499621, 0.466300, 0.437025, 0.409900, 0.381894, 0.357637, 0.334892, 0.312506, 0.286944, 0.264450, 0.226374, 0.195878];
% r = [0.050000, 0.100000, 0.150000, 0.200000, 0.250000, 0.300000, 0.350000, 0.400000, 0.450000, 0.500000, 0.550000, 0.600000, 0.650000, 0.700000, 0.750000, 0.800000, 0.850000, 0.900000, 0.950000, 1.000000];
% 
% p = p(:);
% r = r(:);


% val = [1.00000, 1.00000, 0.99921, 0.98338, 0.91612, 0.81379, 0.71069, 0.61115, 0.52789, 0.46037, 0.40034, 0.34869, 0.30284, 0.25966, 0.22156, 0.18696, 0.15818, 0.13428, 0.11269, 0.09374, 0.07731, 0.06335, 0.05117, 0.04226, 0.03409, 0.02755, 0.02177, 0.01687, 0.01295, 0.00970, 0.00748, 0.00586, 0.00465, 0.00366, 0.00288, 0.00254, 0.00208, 0.00183, 0.00150, 0.00136, 0.00134, 0.00133, 0.00126, 0.00118, 0.00116, 0.00106, 0.00091, 0.00083, 0.00056, 0.00035, 0.00000];
% plot(r,p);
% plot(val);
% title('Separability - HTS - KIMIA');
% title('Precision x Recall - - HTS - MPEG7');
% ylabel('precision'); 
% xlabel('recall');

p = (1:12);

r = (1:12);

p = [1.000000, 0.928709, 0.860919, 0.792498, 0.731221, 0.686120, 0.646958, 0.610803, 0.571255, 0.541045, 0.508038, 0.479288, 0.450806, 0.417475, 0.393871, 0.371191, 0.344084, 0.311476, 0.269431, 0.223868];
r = [0.050000, 0.100000, 0.150000, 0.200000, 0.250000, 0.300000, 0.350000, 0.400000, 0.450000, 0.500000, 0.550000, 0.600000, 0.650000, 0.700000, 0.750000, 0.800000, 0.850000, 0.900000, 0.950000, 1.000000];

p = p(:);
r = r(:);
% 
plot(r,p);
title('Precision x Recall - - HTSn - MPEG');
ylabel('precision'); 
xlabel('recall');
% 
% val = [1.00000, 1.00000, 1.00000, 0.99881, 0.99086, 0.96882, 0.92442, 0.86491, 0.80643, 0.74279, 0.67652, 0.61313, 0.55340, 0.49730, 0.44839, 0.40331, 0.36181, 0.32664, 0.29684, 0.27170, 0.24862, 0.22701, 0.20715, 0.18816, 0.17018, 0.15407, 0.13694, 0.12153, 0.10637, 0.09193, 0.07909, 0.06764, 0.05747, 0.04744, 0.03857, 0.03154, 0.02528, 0.02025, 0.01541, 0.01156, 0.00855, 0.00607, 0.00423, 0.00303, 0.00217, 0.00174, 0.00130, 0.00082, 0.00038, 0.00017, 0.00000];
% plot(val);
% title('Separability - HTSn - MPEG');