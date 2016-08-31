function tests = testCheckWhetherEndState
tests = functiontests(localfunctions);
end

function testTrivialState(testCase)

state = [0 0 0 0 0 0 0 0 0];

expectedOutput = false;

actualOutput = checkWhetherEndState(state);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testNonEndStates(testCase)

state = [1 0 2 0 1 0 0 2 0; ...
          2 0 0 0 1 0 0 0 0; ...
          1 1 2 2 2 1 1 0 0];

expectedOutput = [false; false; false];

actualOutput = checkWhetherEndState(state);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testWinningStates(testCase)

state = [1 1 1 2 2 0 0 0 2;
         1 0 2 2 1 0 0 0 1];

expectedOutput = [true; true];

actualOutput = checkWhetherEndState(state);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testStalemateStates(testCase)

state = [1 2 2 2 1 1 1 2 2; ...
         2 2 1 1 1 2 2 2 1];

expectedOutput = [true; true];

actualOutput = checkWhetherEndState(state);
verifyEqual(testCase, expectedOutput, actualOutput);

end

