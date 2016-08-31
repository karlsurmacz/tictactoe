function tests = testFindPossibleMovesFromCurrentState
tests = functiontests(localfunctions);
end

function testFromInitialState(testCase)

state = [0 0 0 0 0 0 0 0 0];
feasibleStates = [0 0 0 0 1 0 0 0 0; ...
                    0 2 0 0 0 0 0 0 0; ...
                    0 0 2 0 1 0 0 0 1];
nDim = 3;

expectedOutput = [true; true; false];

actualOutput = findPossibleMovesFromCurrentState(state, feasibleStates, nDim);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testFromMidState(testCase)

state = [1 0 0 2 0 0 0 1 0];
feasibleStates = [0 0 0 0 1 0 2 2 0; ...
                   1 2 0 2 0 0 0 1 0; ...
                   1 0 2 2 1 0 0 1 0];
nDim = 3;

expectedOutput = [false; true; false];

actualOutput = findPossibleMovesFromCurrentState(state, feasibleStates, nDim);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testEdgeCaseChangeExisting(testCase)

state = [2 1 2 0 1 0 1 2 0];
feasibleStates = [2 2 2 0 1 0 1 2 0; ...
                    2 1 2 0 1 0 1 1 0; ...
                    2 1 2 1 1 0 1 2 0];
nDim = 3;

expectedOutput = [false; false; true];

actualOutput = findPossibleMovesFromCurrentState(state, feasibleStates, nDim);
verifyEqual(testCase, expectedOutput, actualOutput);

end