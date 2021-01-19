classdef basisfunTest < matlab.unittest.TestCase
    %TESTCLASS for bspline/basisfun.m
    methods (Test)
        
        function testValues(testCase)
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
        function testValuesExact(testCase)
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
    end
end

