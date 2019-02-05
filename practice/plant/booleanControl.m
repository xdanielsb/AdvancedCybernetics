function flow = booleanControl( levelWater, f1, f2)
  lowSensor = levelWater >= 1;
  midSensor = levelWater >= 3;
  highSensor = levelWater >= 5;
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