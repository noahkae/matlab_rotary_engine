% Standard clearing
clc; clear; close all;

R = 4;
theta = linspace(0,2*pi,100);
xylims = [-2*R, 2*R];

r = 0.5*R;
d= 0.5*r;
x_rotor = (R+r)*cos(theta) - d*cos((R+r)/r.*theta);
y_rotor = (R+r)*sin(theta) - d*sin((R+r)/r.*theta);
plot(x_rotor, y_rotor);
xlim(xylims);
ylim(xylims);
rotor_area = polyarea(x_rotor, y_rotor);
axis square

figure;
R = (4/3)*R;
r_housing = (1/3)*R;
d_housing = 0.5*r_housing;
x_housing = (R+r_housing)*cos(theta) - d_housing*cos((R+r_housing)/r_housing.*theta);
y_housing = (R+r_housing)*sin(theta) - d_housing*sin((R+r_housing)/r_housing.*theta);
plot(x_housing, y_housing);
xlim(xylims);
ylim(xylims);
housing_area = polyarea(x_housing, y_housing);
axis square

syms w
goal_disp = 70;
displacement = (((housing_area - rotor_area)/2)*w) - goal_disp;
height = solve(displacement, w);
fprintf('The depth of the motor must be %.10fcm for the displacement to be %.icc\n', height, goal_disp*3)