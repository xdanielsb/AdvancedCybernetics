function ans = booleanControl( u, una, unb, unc, und, uz )

 
 A = u >= 0.0 &&  u < 0.25;
 B = u >= 0.25; % &&  u <= 4;
 C = u >-0.25 &&  u < 0;
 D = u <=-0.25;% u>=-4 &&  u <= -2;
 
 ans =  A*una + B*unb + C*unc + D*und +uz ;
 if( u == 0) 
   ans = u
 end
 %disp(u);
 %fprintf("A = %f, B =%f, C=%f, D=%f, ans =%f\n", A, B, C, D, ans);
    % una*F1 + unb*F2 + unc*F3
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