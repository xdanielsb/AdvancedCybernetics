function ans = booleanControl( u, una, unb, unc, und )

 A = u > 1 &&  u <= 2
 B = u > 2 && u <= 4
 C = u >=-2 && u <=0
 D = u >=-4 && u <= -2
  
 F1 = or( neg(C) , A);
 F2 = neg( C ) ;
 F3 = neg( D );

 ans =  una*F1 + unb*F2 + unc*F3
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