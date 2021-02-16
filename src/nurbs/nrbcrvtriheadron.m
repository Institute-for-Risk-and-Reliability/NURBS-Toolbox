function [t,n,b] = nrbcrvtriheadron(crv,u)
%NRBCRVTRIHEADRON evaluate the local triheadron for a NURBS curve at the
%parameter u.
%
% Calling Sequence:
%
%  [t,n,b] = nrbcrvtriheadron(crv,u)
%
% INPUT:
%
%   crv	: a NURBS curve.
%   u  : value of evaluation
%
% OUTPUT:
%
%   t : tangential vector
%   n : normal vector
%   b : binormal vector
%
% Description:
%
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

p = crv.order-1;
U = crv.knots;
n = crv.number - 1;
i = findspan(n,p,u,U)+1;
P = crv.coefs(1:3,(i-p):i).*crv.coefs(4,(i-p):i);

n1 = (P(:,2)-P(:,1)).*ones(3,p-1);
n2 = P(:,3:p+1)-P(:,1);
A = cross(n1,n2);
if abs(A)<eps
    if P(3,:) == 0
        t = n1(:,1);
        if t == 0
            t = n2(:,end);
            if t == 0
                warning('Control       points are colinear and equal')
            end
        end
        t = t/norm(t);
        n = [-t(2);t(1);0];
        b = cross(t,n);
        
    else
        warning('Control points are colinear -> second derivative is zero.')
    end
else
    
    x = nrbcrvderiveval(crv, u, 2);
    x1 = x(:,2);
    x2 = x(:,3);
    
    k = x1'*x1*x2-x1'*x2*x1;
    k = k/(x1'*x1)^2;
    n = k*norm(x1)^3/norm(cross(x1,x2));
    t = x1/norm(x1);
    
    b = cross(t,n);
end

