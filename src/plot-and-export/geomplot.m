function geomplot(geom,varargin)
%GEOMPLOT Plots the NURBS geometry in different spaces
%
%
% Calling Sequence:
% 
%       geomplot(geom)
%   
%    INPUT:
%       
%      nurbs - nurbs geometry
%   
%    OUTPUT:
%   
%      -
%
%
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: -
%
% Author: Christoph Eckert
% Institute of Risk and Reliability
% email: eckert@irz.uni-hannover.de
% Website: http://www.irz.uni-hannover.de/eckert
% July 2019; Last revision: 17-Jan-2021
%% Options
  % Default options
  options = struct ('spaces', true, ...
                    'controlGrid', false, ...
                    'numControlPoints', false, ...
                    'knotPlot' , false);

  % Read the acceptable names
  optionNames = fieldnames (options);
  % Count arguments
  nargin = length (varargin);
  if (round (nargin/2) ~= nargin/2)
     error ('NRBINVERSE needs propertyName/propertyValue pairs');
  end
  % Check options passed
  for pair = reshape (varargin, 2, [])
    if any (strcmp (pair{1}, optionNames))
      options.(pair{1}) = pair{2};
    else
      error('%s is not a recognized parameter name', pair{1});
    end
  end
%% Plot
if options.spaces
    figure
    subplot(2,2,1)
    nrbctrlplot(geom)
    view(2)
    nctrl = geom.number(1)*geom.number(2);
    title(sprintf('Physical space: %d control points', nctrl))
    subplot(2,2,2)
    nrbkntplot(geom)
    numel = (length(unique(geom.knots{1}))-1)*(length(unique(geom.knots{2}))-1);
    title(sprintf('Physical space: %d elements', numel))
    view(2)
    subplot(2,2,3)
    nrbparaplot(geom);
    subplot(2,2,4)
    nrbindexplot(geom);
end
if options.knotPlot
    figure
    nrbkntplot(geom);
    view(0,90)
    numel = (length(unique(geom.knots{1}))-1)*(length(unique(geom.knots{2}))-1);
    title(sprintf('NURBS geometry in physical space: %d elements', numel))
end

if options.controlGrid
    figure
    if options.numControlPoints
        nrbctrlnumplot(geom);
    else
        nrbctrlplot(geom);
    end
    nctrl = geom.number(1)*geom.number(2);
    title(sprintf('NURBS geometry in physical space: %d control points', nctrl))
end

end

