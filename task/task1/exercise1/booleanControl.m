function flow = booleanControl( waterLevel , q1, q2 , q3)
 heighTank= 1;
 aLevel = waterLevel > 0;
 bLevel = waterLevel >= heighTank/3;
 cLevel = waterLevel >= 6*heighTank/7;
 dLevel = waterLevel >= heighTank/0.965;
 F1 = or( neg(cLevel) , and( neg(dLevel), aLevel));
 F2 = neg( cLevel ) ;
 F3 = neg( bLevel );

 flow =  q1*F1 + q2*F2 + q3*F3
end 

function res = neg( a)
  res = 1 - a;
end

function res = or( a, b)
  res = max( a, b);
end

function res = and(a,b)
 res = min( a,b );
end