
title('Torus construction by revolution');
hold on;
vol = nrbrevolve(nrbcirc(0.2,[0.9 1.0]),[0.0 0.0 0.0],[1.0 0.0 0.0]);
nrbkntplot(vol);
nrbctrlplot(vol);
hold off;