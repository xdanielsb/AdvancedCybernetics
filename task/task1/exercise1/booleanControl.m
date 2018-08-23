function flow = booleanControl( waterLevel , q1, q2 , q3)
 heighTank= 1;
 P = [0 1/3 5/6 193/200].*heighTank
 aLevel = waterLevel >  P(1)
 bLevel = waterLevel >= P(2);
 cLevel = waterLevel >= P(3);
 dLevel = waterLevel >= P(4);
 
 if cLevel
     q1 = q1 %* 1.8  change in the border
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