close all
clear
clc
%
vol = nrbrevolve(nrbcirc(1,[],0.0,pi),[0.0 0.0 0.0],[1.0 0.0 0.0]);
nrbkntplot(vol);
nrbctrlplot(vol);
title('Sphere construction by revolution');
hold on;
torus = nrbrevolve(nrbcirc(0.2,[0.9 1.0]),[0.0 0.0 0.0],[1.0 0.0 0.0]);
nrbkntplot(torus);
nrbctrlplot(torus);
nrbkntplot(nrbtform(torus,vectrans([-1.8])));
hold off;