res = hello( "hello world " );
disp( res ) 
function res =  hello( txt )
    disp( txt )
    res = computeValue( 10 );
end

function res = computeValue( val )
   res = val * 2;
end




