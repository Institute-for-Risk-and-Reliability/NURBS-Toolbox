function [X,Y,Z] = nrbmeshgrid(nrb,n)
%NRBMESHGRID build an meshgrid in the physical space as two matrices for the plot3 command]
% 
% Calling Sequence:
% 
%  [X,Y] = nrbmeshgrid(nrb,n)
% 
% INPUT:
% 
%   nrb	: a NURBS surface.
%   n  : number of evaluation points in one direction
% 
% OUTPUT:
% 
%   X : matrix of x physical coordinates
%   Y : matrix of y physical coordinates
%
% Examples:
%
%
% Copyright (C) 2021 Christoph Eckert
% 
%   This program is free software; you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation; either version 3 of the License, or
%   (at your option) any later version.
   
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%   
%   You should have received a copy of the GNU General Public License
%   along with Octave; see the file COPYING.  If not, see
%   <http://www.gnu.org/licenses/>.  
U = zeros(2,n*n);
du = linspace(0,1,n);
X = zeros(n,n);
Y = zeros(n,n);
Z = zeros(n,n);
for i = 1 : n 
   U(1,n*(i-1)+(1:n)) = du(i);
   U(2,n*(i-1)+(1:n)) = du;
end

pnts = nrbeval(nrb,U);

X = reshape(pnts(1,:),[n,n]);
Y = reshape(pnts(2,:),[n,n]);
Z = reshape(pnts(3,:),[n,n]);
end

