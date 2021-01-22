function [h] = nrbindexplot( nrb )
%% NRBINDEXPLOT - Plot the index space of the given NURBS
%
% Inputs:
%    nrb - NURBS surface, see nrbmak.
%
% Outputs:
%   h - figure object
%
% Example:
%       srf = nrbtestsrf;
%       nrbindexplot( srf )
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
if length(nrb.order) ~= 2
    error('nrbparaplot is only available for surfaces.')
end
m1 = length(nrb.knots{1});
m2 = length(nrb.knots{2});
h = mesh(1:m1,1:m2,zeros(m1,m2)');
set(h, 'edgecolor','black')
view(2)
xlim([1 m1])
ylim([1 m2])
xlabel('\xi_i')
ylabel('\eta_i')
title('Index space')
end

