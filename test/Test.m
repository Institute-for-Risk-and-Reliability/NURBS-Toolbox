classdef Test < matlab.unittest.TestCase
    %TESTCLASS for general folder 

    

    methods (Test)
        function crvkntremove(testCase)
            crv  = nrbdegelev (nrbline (), 3);       
            acrv = nrbkntins (crv, [.11 .11 .11]);
            [rcrv, t] = crvkntremove (acrv, .11, 8, 3, 3, 1e-10);
            testCase.verifyEqual(crv.knots, rcrv.knots,'AbsTol',1e-10);
            testCase.verifyEqual(t,3);
        end
    end
end

