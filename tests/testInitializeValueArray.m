function tests = testInitializeValueArray
tests = functiontests(localfunctions);
end

function testTrivialSingleCaseCrosses(testCase)

state = [0 0 0 0 0 0 0 0 0];

expectedOutput = 0.5;
actualOutput = initializeValueArray(state, 0);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testTrivialSingleCaseNoughts(testCase)

state = [0 0 0 0 0 0 0 0 0];

expectedOutput = 0.5;
actualOutput = initializeValueArray(state, 1);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testWinningSingleCaseCrosses(testCase)

state = [2 2 2 1 1 2 0 0 0];

expectedOutput = 1;
actualOutput = initializeValueArray(state, 0);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testLosingSingleCaseCrosses(testCase)

state = [2 1 2 1 1 2 0 1 0];

expectedOutput = 0;
actualOutput = initializeValueArray(state, 0);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testWinningNoughts(testCase)

state = [1 2 2 1 1 2 0 0 1; ...
         2 0 1 1 0 2 0 2 0];

expectedOutput = [1; 0.5];
actualOutput = initializeValueArray(state, 1);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testWinningAndLosingNoughts(testCase)

state = [2 1 2 1 1 1 2 0 2; ...
         0 0 2 0 1 2 1 0 2];

expectedOutput = [1; 0];
actualOutput = initializeValueArray(state, 1);
verifyEqual(testCase, expectedOutput, actualOutput);

end



