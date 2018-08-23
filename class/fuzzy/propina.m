a = newfis('tipper');
a = addvar(a,'input','service',[0 10]);
a = addmf(a,'input',1,'poor','gaussmf',[1.5 0]);
a = addmf(a,'input',1,'good','gaussmf',[1.5 5]);
a = addmf(a,'input',1,'excellent','gaussmf',[1.5 10]);
plotmf(a,'input',1)

a = addvar(a,'input','comida',[0 10]);
a = addmf(a,'input',1,'poor','trapmf',[0 0 2 4]);
a = addmf(a,'input',1,'excellent','trapmf',[6 8 10 10]);
plotmf(a,'input',2)

a = addvar(a,'output','tip',[0 25]);
a = addmf(a,'output',1,'poor','trimf',[0.15 5 7.5]);
a = addmf(a,'output',1,'excellent','trimf',[7.5 12.5 17]);
a = addmf(a,'output',1,'excellent','trimf',[17 20 25]);
plotmf(a,'output',1)

help addrule

