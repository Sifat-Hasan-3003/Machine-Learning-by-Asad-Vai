clc;
clear all;
close all;

load fisheriris   %50 entities were taken for per 3species of flowers with 4 features
PL=meas(:,3); %measurement of petal length of 3rd column of all entities
PW=meas(:,4); %measurement of petal width of 4th column of all entities
h1=gscatter(PL,PW,species,'krb','ov^',[],'off')%scatter was plotted for Petal length and width 
                                                                            %and species where k,r,b indicates black, red and blue 
                                                                            %color respectively and ov^ represents circle , reverse 
                                                                             %triangle and triangle respectively also [] indicates default 
                                                                             %size and off indicates legend is off
h1(1).LineWidth=2;         %h1(1) indicates the 1st entity of h1 and linewidth is the subvariable of h1
h1(2).LinewIDTH=2;        %h1(2) indicates the 2nd entity of h1 and linewidth is the subvariable of h1
h1(3).LineWidth=2;           %h1(3) indicates the 3rd entity of h1 and linewidth is the subvariable of h1
% h1(3),LineStyle='-';
legend('Iris Setosa','Iris Versicolor','Iris Virginica');       %legend
hold on                                           %holds the current plot
X=[PL,PW];                               %X is taken as matrix 
MdlLinear=fitcdiscr(X,species);          % Fit X with the help of species using LDA classifier.
MdlLinear.ClassNames([2,3])           %Drawing a model linear line between 2 species  (2nd and 3rd)
K=MdlLinear.Coeffs(2,3).Const;         % The coefficient of 2nd and 3rd species are kept constant
L=MdlLinear.Coeffs(2,3).Linear; %The coefficient of 2nd and 3rd species are kept linear

f=@(x1,x2)K+L(1)*x1+L(2)*x2;% f is a function of x1 and x2 which maintains
                                                   % the pattern of K+L(1)*x1+L(2)*x2
h2=ezplot(f,[.9 7.1 0 2.5]);%Cuve plotter

h2.Color='r';% The plotted line color is red
h2.LineWidth=2;%The plotted line's width is declared