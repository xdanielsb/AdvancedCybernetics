function flow = booleanControl( waterLevel , q1, q2 , q3)
 heighTank= 1;
 P = [1/3 5/6 0.965]
 aLevel = waterLevel > 0;
 bLevel = waterLevel >= heighTank * P(1);
 cLevel = waterLevel >= heighTank * P(2);
 dLevel = waterLevel >= heighTank / P(3);
 
 if cLevel
     q1 = q1 * 1.8
 end
 
 F1 = or( neg(cLevel) , aLevel);
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