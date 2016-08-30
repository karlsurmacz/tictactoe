function tests = testGenerateStates
tests = functiontests(localfunctions);
end

function testBinaryWithTwoNodes(testCase)

nNodes = 2;
nStates = 2;

expectedOutput = [0 0; 0 1; 1 0; 1 1];
actualOutput = generateStates(nNodes, nStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testBinaryWithThreeNodes(testCase)

nNodes = 3;
nStates = 2;

expectedOutput = [0 0 0; 0 0 1; 0 1 0; 0 1 1; ...
                  1 0 0; 1 0 1; 1 1 0; 1 1 1];
actualOutput = generateStates(nNodes, nStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testTertiaryWithTwoNodes(testCase)

nNodes = 2;
nStates = 3;

expectedOutput = [0 0; 0 1; 0 2; 1 0; 1 1; 1 2; 2 0; 2 1; 2 2];
actualOutput = generateStates(nNodes, nStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testTertiaryWithThreeNodes(testCase)

nNodes = 3;
nStates = 3;

expectedOutput = [0 0 0; 0 0 1; 0 0 2; 0 1 0; 0 1 1; 0 1 2; ...
                    0 2 0; 0 2 1; 0 2 2; 1 0 0; 1 0 1; 1 0 2; 1 1 0; 1 1 1; 1 1 2; ...
                    1 2 0; 1 2 1; 1 2 2; 2 0 0; 2 0 1; 2 0 2; ...
                    2 1 0; 2 1 1; 2 1 2; 2 2 0; 2 2 1; 2 2 2];
actualOutput = generateStates(nNodes, nStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end