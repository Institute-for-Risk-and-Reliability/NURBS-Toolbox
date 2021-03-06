classdef nurbsTest < matlab.unittest.TestCase
    %TESTCLASS for folder bspline
    methods (Test)
        
        function constructRuledSurface(testCase)
            crv1 = nrbtestcrv;
            crv2 = nrbtform(nrbcirc(4,[4.5;0],pi,0.0),vectrans([0.0 4.0 -4.0]));
            srf = nrbruled(crv1,crv2);
            act = nrbeval(srf,[0 0.5 1;0 1 1]);
            exp = [0.5 4.5  8.5;
                3     0    4;
                0    -4   -4];
            testCase.verifyEqual(act,exp,'AbsTol',1e-14)
            nrbctrlplot(srf)
            nrbkntplot(srf)
            nrbparaplot(srf)
            nrbindexplot(srf)
            nrbctrlnumplot(srf)
            close all
            u = nrbinverse(srf,[0.5 3 0]);
            testCase.verifyEqual(u,[0 0]');

        end
        
        function constructRevolvedVolume(testCase)
            vol = nrbrevolve(nrbcirc(1,[],0.0,pi),[0.0 0.0 0.0],[1.0 0.0 0.0]);
            [P, w] = nrbeval(vol, {0.5 0.1 0.5 });
            expP = [0.866274169979695 -0.266274169979695 0]';
            expw = 0.906274169979695;
            testCase.verifyEqual(P,expP,'AbsTol',1e-14)
            testCase.verifyEqual(w,expw,'AbsTol',1e-14)
            
        end
        
        function nrbmeshgrid(testCase)
           n = 10;
           p11 = [0 0 0];
           p12 = [5 0 0];
           p21 = [0 5 0];
           p22 = [5 5 0];
           nrb = nrb4surf(p11,p12,p21,p22);
           [X, Y, Z] = nrbmeshgrid(nrb,n);
           testCase.verifyEqual(X(1,1),p11(1),'AbsTol',1e-14);
           testCase.verifyEqual(Y(1,1),p11(2),'AbsTol',1e-14);
           testCase.verifyEqual(X(1,end),p12(1),'AbsTol',1e-14);
           testCase.verifyEqual(Y(1,end),p12(2),'AbsTol',1e-14);
           testCase.verifyEqual(X(end,1),p21(1),'AbsTol',1e-14);
           testCase.verifyEqual(Y(end,1),p21(2),'AbsTol',1e-14);
           testCase.verifyEqual(X(end,end),p22(1),'AbsTol',1e-14);
           testCase.verifyEqual(Y(end,end),p22(2),'AbsTol',1e-14);
           
        end
        
        function nrbcrvtrihedron(testCase)
            R = 1;
            L = 4;
            p1 = 2;
            p2 = 2;
            href1 = 2;
            href2 = 2;
            nrb = geom_plate_with_hole_quarter(L,R,p1,p2,href1,href2);
            crvs = nrbextract(nrb, [1 4 2 3]);
            crv1 = crvs(1);
            crv2 = crvs(2);
            crv3 = crvs(3);
            crv4 = crvs(4);
            [t,n,b] = nrbcrvtriheadron(crv1,0);
            testCase.verifyEqual(t,[0;1;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv1,1);
            testCase.verifyEqual(t,[0;1;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv2,0);
            testCase.verifyEqual(t,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv2,0.5-eps);
            testCase.verifyEqual(t,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv2,0.5);
            testCase.verifyEqual(t,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv2,1);
            testCase.verifyEqual(t,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv3,0);
            testCase.verifyEqual(t,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv3,1);
            testCase.verifyEqual(t,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv4,0);
            testCase.verifyEqual(t,[-1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv4,0.5);
            testCase.verifyEqual(t,[-1/sqrt(2);-1/sqrt(2);0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[1/sqrt(2);-1/sqrt(2);0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
            [t,n,b] = nrbcrvtriheadron(crv4,1);
            testCase.verifyEqual(t,[0;-1;0],'AbsTol',1e-14);
            testCase.verifyEqual(n,[1;0;0],'AbsTol',1e-14);
            testCase.verifyEqual(b,[0;0;1],'AbsTol',1e-14);
        end
        
    end
end

