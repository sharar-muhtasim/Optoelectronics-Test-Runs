clear all; close all; clc;

n2 = 1:0.01:5;
n1 = 1;
n = n2./n1;

theta_i = 0:1:180;
% theta_r = 0:1:90;
% theta_t = 0:1:90;

sin_theta = sind(theta_i);
cos_theta = cosd(theta_i);

for i=1:length(n)
    r_perp(i,:) = (cos_theta - sqrt(n(i).^2 - (sin_theta).^2))./(cos_theta + sqrt(n(i).^2 - (sin_theta).^2));
    r_mag_perp(i,:) = abs(r_perp(i,:));
    r_arg_perp(i,:) = rad2deg(angle(r_perp(i,:)));
      
    r_par(i,:) = ((sqrt(n(i).^2-(sin_theta).^2))-((n(i).^2).*cos_theta))./((sqrt(n(i).^2-(sin_theta).^2))+((n(i).^2).*cos_theta));
    r_mag_par(i,:) = abs(r_par(i,:));
    r_arg_par(i,:) = rad2deg(angle(r_par(i,:)));
       
end

for k=1:length(n)
    min_mag_par(k)=min(r_mag_par(k,:));
    index(k) = find(r_mag_par(k,:) == min_mag_par(k),1);
    brewster(k) = index(k)./(100);
end

figure;
plot(n, brewster);
grid on;


