s = [1,1,2,3,2,4];
t = [2,3,3,4,5,5];
w = [3,3,1,3,3,2];
names={'o','a','b','c','d'};
G = graph(s,t,w,names);

% plot(G);

V = [1;2;3;4;5];
create_cut_r(V);