function flow = difuseControl( levelWater, f1, f2)
  lowSensor = trapmf(levelWater ,[0 1.5 100 100]);
  midSensor = smf(levelWater,[1.5 3.0]);
  highSensor = trapmf(levelWater,[3.0 7.0 100 100]);
  F1 = or( neg(lowSensor) , and( neg( highSensor), midSensor) );
  F2 = neg( midSensor );
  flow  = F1*f1 +F2*f2;
end

function res = neg(a)
 res = 1 - a;
end

function res = or(a,b)
 res = max(a,b);
end

function res = and(a,b)
 res = min(a,b);
end