function flow = difuseControl( waterLevel , q1, q2 , q3)
 heighTank= 1;
 disp(waterLevel)
 fprintf(" waterLevel = %f\n", waterLevel)
 P = [[0,1/10],  [1/10, 3/10], [3/10, 8/10], [8/10, 10/10] ].*heighTank;
  
 aLevel = smf(waterLevel, [P(1), P(2)]);

 bLevel = smf(waterLevel, [P(3), P(4)]);

 cLevel = smf(waterLevel, [P(5), P(6)]);

 dLevel = smf(waterLevel, [P(7), P(8)]);
 
 fprintf(" a=%f, b=%f, c=%f, d=%f\n" , aLevel, bLevel, cLevel, dLevel);

 %activation function
 F1 = or( neg(cLevel) , aLevel);
 F2 = neg( cLevel ) ;
 F3 = neg( bLevel );
 
 flow =  q1*F1 + q2*F2 + q3*F3;
 fprintf(" flow = %f \n\n", flow);
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