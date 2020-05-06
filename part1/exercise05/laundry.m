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
types = ["zmf", "gaussmf", "smf"];
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
types = ["zmf", "smf"];
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
types = ["trimf", "trimf", "trimf"];
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
types = ["gaussmf", "gaussmf"];
[~, snames] = size(names);
init = minQuality; interval = ( maxQuality / snames );
for i  = 1:snames
  ent = interval * i;
  sys = addmf( sys , 'output', 2, names(i),  types(i), [interval/4, (init+ent)/2]);
  init = ent;
end 


%figure(4)
%plotmf(sys,'output',2)


% INPUTS 
% Amount of Soup
keySetInput1 = {'little', 'medium', 'much'};
valueSetInput1 =[1, 2, 3];
I1 = containers.Map(keySetInput1,valueSetInput1);

% Temperature
keySetInput2 = {'cold', 'warm'};
valueSetInput2 =[1, 2];
I2 = containers.Map(keySetInput2,valueSetInput2);

% OUTPUTS

%Time Washing
keySetOutput1 = {'fast', 'avg', 'slow'};
valueSetOutput1 = [1, 2 , 3];
O1 = containers.Map(keySetOutput1, valueSetOutput1);

%Quality Washing 
keySetOutput2 = {'bad', 'good'};
valueSetOutput2 = [1, 2 ];
O2 = containers.Map(keySetOutput2, valueSetOutput2);

wr = 1 ; oro = 1;

 % Amount of Soup, Temperature Water -> Time Washing , Quality Washing
 % The quantity of clothes is constant
ruleList  = [
  I1('little'), I2('cold'),  O1('slow'), O2('bad'), wr, oro
  I1('little'), I2('warm'),  O1('avg'), O2('bad'), wr, oro
  I1('medium'), I2('cold'),  O1('avg'), O2('good'), wr, oro
  I1('medium'), I2('warm'),  O1('fast'), O2('good'), wr, oro
  I1('much'), I2('cold'),  O1('slow'), O2('good'), wr, oro
  I1('much'), I2('warm'),  O1('avg'), O2('bad'), wr, oro
];

sys = addrule(sys,ruleList);
fuzzy( sys)
