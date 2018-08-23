function ans = booleanControl( u )
    if u > 1 &&  u <= 2
        error = 1
    elseif u >2 && u <= 4
        error = 1
    elseif u >=-2 && u <=0
        error = 1
    elseif u >=-4 && u <= -2
        error = 1
    else 
        error = 0
    end
    ans = u - error
end