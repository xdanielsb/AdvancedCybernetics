f = @(x,m,n) reshape(randperm(x),m,n);

x = 3;y = 5; z = 4;maxVal = 10;

A = f(20, x,y)
B = f(20, y,z)

