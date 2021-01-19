function [ h ] = nrbparaplot(nrb)
%% NRBPARAPLOT - Plot the parameter space of the given NURBS

%
% Inputs:
%    nrb - NURBS surface, see nrbmak.
%
% Outputs:
%   h - figure object
%
% Example:
%       srf = nrbtestsrf;
%       [ h ] = nrbparaplot( nrb)
%
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: nrbparaplot

% Author: Christoph Eckert
% Institute of Risk and Reliability
% email: eckert@irz.uni-hannover.de
% Website: http://www.irz.uni-hannover.de/eckert
% July 2017; Last revision: 13-July-2017

%------------- BEGIN CODE --------------

%%
h = mesh(nrb.knots{1},nrb.knots{2},zeros(length(nrb.knots{1}),length(nrb.knots{2}))');
set(h, 'edgecolor','black')
view(2)
xlabel('\xi')
ylabel('\eta')
title('Parameter space')
end

