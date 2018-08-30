%{
 author: Daniel Santos
 date: 30 August

 Difuse Control for a washin machine
 input variables = { Amount of soup, Amount of clothes, Temperature Water}
 output variables = { time of washing, quality of washing}
%} 
format compact; clc ; clear all; close all;

sys = newfis('cwashing');

% Input Variable: Amount of soup in grams [0 130] 
maxAmountSoup = 130;
sys = addvar ( sys, 'input', 'amount_soup', [0, maxAmountSoup] );

% pertenency functions
names = ["little", "medium", "much"];
types = ["zmf", "gaussmf", "smf"]
[~, snames] = size(names);
init = 0; interval = ( maxAmountSoup / snames );
for i  = 1:snames
  ent =  interval * i;
  if types(i) == "gaussmf"
    sys = addmf( sys , 'input', 1, names(i),  types(i), [interval/4, (init+ent)/2]);
  else 
    sys = addmf( sys , 'input', 1, names(i),  types(i), [init, ent]);
  end
  init = ent;
end 


% plotmf(sys,'input',1)

% Input Variable:  Temperature of water [10 60] Celius
maxTemperature = 40; minTemperature = 10;
sys = addvar ( sys, 'input', 'temperature', [minTemperature, maxTemperature] );

% Pertenency functions
names = ["cold", "warm"];
types = ["zmf", "smf"]
[~, snames] = size(names);
init = 0; interval = ( maxTemperature / snames );
for i  = 1:snames
  ent =  interval * i;
   sys = addmf( sys , 'input', 2, names(i),  types(i), [init, ent]);
  init = ent;
end 

%figure(2)
%plotmf(sys,'input',2)


% Output Variables
% Output Variable : Time Washing  : minutes
minTime = 10; maxTime = 60;
sys =addvar(sys,'output','time_washing',[minTime, maxTime]);
%Funciones de pertenencia

names = ["fast", "avg", "slow"];
types = ["trimf", "trimf", "trimf"]
[~, snames] = size(names);
init = minTime; interval = ( maxTime / snames );
for i  = 1:snames
  ent =  interval * i;
   sys = addmf( sys , 'output', 1, names(i),  types(i), [init,(init+ent)/2, ent]);
  init = ent;
end 

%figure(3)
%plotmf(sys,'output',1)


% Output Variable : Quality of Washing  
minQuality = 0; maxQuality = 10;
sys =addvar(sys,'output','quality_washing',[minQuality, maxQuality]);
%Funciones de pertenencia

names = ["bad", "good"];
types = ["gaussmf", "gaussmf"]
[~, snames] = size(names);
init = minQuality; interval = ( maxQuality / snames );
for i  = 1:snames
  ent = interval * i;
  sys = addmf( sys , 'output', 2, names(i),  types(i), [interval/4, (init+ent)/2]);
  init = ent;
end 

%figure(4)
%plotmf(sys,'output',2)


