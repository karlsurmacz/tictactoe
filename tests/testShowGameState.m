function tests = testShowGameState
tests = functiontests(localfunctions);
end

function testBlankBoard(testCase)

currentState = [0 0 0 0 0 0 0 0 0];
nDim = 3;

expectedOutput = ' | | |\n | | |\n | | |\n';

actualOutput = showGameState(currentState, nDim)
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testPartialBoard(testCase)

currentState = [0 1 2 2 1 2 0 0 1];
nDim = 3;

expectedOutput = ' |o|x|\nx|o|x|\n | |o|\n';

actualOutput = showGameState(currentState, nDim)
verifyEqual(testCase, expectedOutput, actualOutput);

end