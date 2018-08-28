function ans = difuseControl( u, una, unb, unc, und, uz )

 A = gauss2mf(u, [0.2 0.1 0.2 0.25 ]);
 B = smf(u, [0.24 0.25]);
 C = gauss2mf(u, [0.2 -0.1 0.2 -0.25 ]);
 D = zmf(u, [-0.25 -0.24]);
  
 ans =  A*una + B*unb + C*unc + D*und +uz ;
 
 if( u == 0) 
   ans = u;
 end
 %disp(u);
 fprintf("A = %f, B =%f, C=%f, D=%f, ans =%f\n", A, B, C, D, ans);
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