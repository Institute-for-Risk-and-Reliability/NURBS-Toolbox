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
        
    end
end

