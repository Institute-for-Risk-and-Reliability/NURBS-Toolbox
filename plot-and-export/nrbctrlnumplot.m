function [ h ] = nrbctrlnumplot( nurbs )
%% nrbctrlnumplot - Plot the control point numbering of the given NURBS

%
% Inputs:
%    nrb - NURBS surface, see nrbmak.
%
% Outputs:
%   h - figure object
%
% Example:
%       srf = nrbtestsrf; nrbctrlnumplot(srf)
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
% July 2019; Last revision: 17-July-2019

%% ------------- BEGIN CODE --------------

BB = nurbs.coefs;
Bx = squeeze(BB(1,:,:)./BB(4,:,:)); % Remove high dimension structure
By = squeeze(BB(2,:,:)./BB(4,:,:)); % Remove high dimension structure
Bz = squeeze(BB(3,:,:)./BB(4,:,:)); % Remove high dimension structure

[INC, IEN] = get_INC_IEN(nurbs.knots);

nnp = size(INC,1); % number of global basis functions
for A = 1 : nnp    % A global index
   x(A) = Bx(INC(A,1),INC(A,2));
   y(A) = By(INC(A,1),INC(A,2));
   z(A) = Bz(INC(A,1),INC(A,2));
end
hold on
nrbkntplot(nurbs)
h = plot3(x,y,z,'o');
set(h, 'markerfacecolor','r')
xlim([min(min(Bx))-1 max(max(Bx))+1])
ylim([min(min(By))-1 max(max(By))+1])
labels = cellstr( num2str([1:nnp]'));
text(x, y,z, labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');

hold off
end

