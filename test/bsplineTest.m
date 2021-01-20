classdef bsplineTest < matlab.unittest.TestCase
    %TESTCLASS for folder bspline
    methods (Test)
        
        function basisfun(testCase)
            n = 3; 
            U = [0 0 0 1/2 1 1 1];
            p = 2;
            u = linspace (0, 1, 10);
            s = findspan (n, p, u, U);
            expSolution = [1.00000   0.00000   0.00000
                    0.60494   0.37037   0.02469
                    0.30864   0.59259   0.09877
                    0.11111   0.66667   0.22222
                    0.01235   0.59259   0.39506
                    0.39506   0.59259   0.01235
                    0.22222   0.66667   0.11111
                    0.09877   0.59259   0.30864
                    0.02469   0.37037   0.60494
                    0.00000   0.00000   1.00000];
            actSolution = basisfun (s, u, p, U);
            testCase.verifyEqual(actSolution,expSolution,'AbsTol',1e-5)
        end
        function basisfunExact(testCase)
            n = 3; 
            U = [0 0 0 1 2 3 4 4 5 5 5];
            p = 2;
            n = length(U) - p - 1;
            u = 5/2;
            s = findspan (n, p, u, U);
            expSolution = [1/8 6/8 1/8];
            actSolution = basisfun (s, u, p, U);
            testCase.verifyEqual(actSolution,expSolution)
        end
        function basisfunder(testCase)
             k    = [0 0 0 0 1/3 2/3 1 1 1 1];
             p    = 3;
             u    = rand (100, 1);
             i    = findspan (numel(k)-p-2, p, u, k);
             ders = basisfunder (i, p, u, k, 7);
             for ii=1:10
               sumders = sum (squeeze(ders(ii,:,:)), 2);
               testCase.verifyEqual(sumders(1),1,'AbsTol',1e-15)
               testCase.verifyEqual(sumders(2:end),zeros(length(sumders)-1, 1),'AbsTol',1e-13)
             end
             testCase.verifyEqual(ders(:, (p+2):end, :),zeros(numel(u), 8-p-1, p+1),'AbsTol',1e-13)
             testCase.verifyTrue(all(all(ders(:, 1, :) <= 1)))
%              assert (all(all(ders(:, 1, :) <= 1)), true)
        end
    end
end

