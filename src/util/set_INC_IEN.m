function [nrb] = set_INC_IEN(nrb)
%% SET_INC_EIN - Construct the INC (NURBS coordinates) and IEN (element nodes) arrays
% 
% Adapted from Algorithm 7 from 
% 'IGA: Toward Integration of CAD and FEA', J.A. Cottrell et. al. 2009, p.
% 317 
%
% Inputs:
%    knots - CellArray of the knots in one, two or three dimension
%
% Outputs:
%    INC - NURBS coordinates
%    IEN - element nodes
%    
%    nel = size(IEN,2) % number of elements (including elements with zero measure)     
%    nnp = size(INC,1) % number of global basis functions
%    nen = size(IEN,1) % number of local basis functions
%    
% Example:
%       srf = nrbtestsrf;[INC, IEN] = get_INC_IEN( srf.knots )
%
% Adapted from Algorithm 7 from 
% 'IGA: Toward Integration of CAD and FEA', J.A. Cottrell et. al. 2009, p.
% 317
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: 

% Author: Christoph Eckert
% Institute of Risk and Reliability
% email: eckert@irz.uni-hannover.de
% Website: http://www.irz.uni-hannover.de/eckert
% July 2017; Last revision: 13-July-2017

%------------- BEGIN CODE --------------
if isnumeric(nrb.knots)
    knots = {nrb.knots};
else
    knots = nrb.knots;
end
%% 1D
if length(knots) == 1
    p = sum(knots{1} == 0)-1;       % degree of first knot vector
    n = length(knots{1})-(p+1);     % number of basis functions of first knot vector
    nel = n-p;                      % number of elements (including zero measure/area)
    nnp = n;                       % number of global basis functions
    nen = p+1;                     % number of local basis functions
    INC = zeros(nnp,1);
    IEN = zeros(nen,nel);
    INCinv = zeros(n,1);
    IB = zeros(1,nel);              % Boundary elements
    A = 0;e = 0;
    for i = 1 : n
       A = A + 1;     
       INC(A,1) = i;
       INCinv(i) = A;
       if i > p 
           e = e + 1;
           if i == p+1 || i == n
               IB(e) = 1;
           end
           for iloc = 0 : p
              B = A - iloc;     % global function number
              b = iloc + 1;     % local function number
              IEN(b,e) = B;
           end
       end    
    end
%% 2D   
elseif length(knots) == 2
    p = sum(knots{1} == 0)-1;       % degree of first knot vector
    q = sum(knots{2} == 0)-1;       % degree of second knot vector
    n = length(knots{1})-(p+1);     % number of basis functions of first knot vector
    m = length(knots{2})-(q+1);     % number of basis functions of second knot vector
    nel = (n-p)*(m-q);              % number of elements
    nnp = n*m;                     % number of global basis functions
    nen = (p+1)*(q+1);             % number of local basis functions
    INC = zeros(nnp,2);             % NURBS coordinates
    IEN = zeros(nen,nel);           % 
    INCinv = zeros(n,m);            % 
    IB = zeros(1,nel);              % Boundary elements
    A = 0;e = 0;
    for j = 1 : m
        for i = 1 : n      
            A = A + 1;              % increment global function number
            INC(A,1) = i;
            INC(A,2) = j;
            INCinv(i,j) = A;
            if i > p && j > q
                e = e + 1;          % increment local function number
                if i == p+1 || j == q+1 || i == n || j == m
                    IB(e) = 1;
                end
                for jloc = 0 :q
                    for iloc = 0 : p
                        B = A - jloc*n - iloc;      % global function number
                        b = jloc*(p+1) + iloc + 1;  % local function number
                        IEN(b,e) = B;
                    end
                end
            end    
       end
    end
%% 3D
elseif length(knots) == 3
    p = sum(knots{1} == 0)-1;       % degree of first knot vector
    q = sum(knots{2} == 0)-1;       % degree of second knot vector
    r = sum(knots{3} == 0)-1;       % degree of third knot vector
    n = length(knots{1})-(p+1);     % number of basis functions of first knot vector
    m = length(knots{2})-(q+1);     % number of basis functions of second knot vector
    l = length(knots{2})-(q+1);     % number of basis functions of third knot vector
    nel = (n-p)*(m-q)*(l-r);        % number of elements
    nnp = n*m*l;                   % number of global basis functions
    nen = (p+1)*(q+1)*(r+1);       % number of local basis functions
    INC = zeros(nnp,3);
    IEN = zeros(nen,nel);
    INCinv = zeros(n,m,l);
    IB = zeros(1,nel);              % Boundary elements
    A = 0;e = 0;
    for k = 1 : l
        for j = 1 : m
            for i = 1 : n      
                A = A + 1;              % increment global function number
                INC(A,1) = i;
                INC(A,2) = j;
                INC(A,3) = k;
                INCinv(i,j,k) = A;
                if i > p && j > q && k > r
                    e = e + 1;          % increment local function number
                    if i == p+1 || j == q+1 || k == r+1 || i == n || j == m || k == l
                        IB(e) = 1;
                    end
                    for kloc = 0 : r
                        for jloc = 0 : q
                            for iloc = 0 : p
                                B = A - kloc*m*n - jloc*n - iloc;              % global function number
                                b = kloc*(q+1)*(p+1) + jloc*(p+1) + iloc + 1;  % local function number
                                IEN(b,e) = B;
                            end
                        end
                    end
                end
            end    
       end
    end
else
    error('knot vector must be a cell array of dimension one, two or three!')
end
nrb.IEN = IEN;
nrb.INC = INC;
nrb.INCinv = INCinv;
nrb.IB = IB;
nrb.nel = nel;
nrb.nnp = nnp;
nrb.nen = nen;


end

