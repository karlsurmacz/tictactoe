function tests = testFilterInfeasibleStates
tests = functiontests(localfunctions);
end

function testTrivialSingleCase(testCase)

possibleStates = [0 0 0 0 0 0 0 0 0];

expectedOutput = possibleStates;
actualOutput = filterInfeasibleStates(possibleStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testSingleTrueCase(testCase)

possibleStates = [0 1 0 2 0 2 1 2 0];

expectedOutput = possibleStates;
actualOutput = filterInfeasibleStates(possibleStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testSingleFalseCase(testCase)

possibleStates = [0 2 0 2 0 2 1 2 0];

expectedOutput = [];
actualOutput = filterInfeasibleStates(possibleStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end

function testMultipleCases(testCase)

possibleStates = [1 1 1 2 2 2 1 2 2; ...
                    2 0 1 1 1 0 0 0 0; ...
                    2 0 0 0 1 0 0 0 0;
                    0 0 1 2 1 1 0 0 2];

expectedOutput = [1 1 1 2 2 2 1 2 2; ...
                    2 0 0 0 1 0 0 0 0];
actualOutput = filterInfeasibleStates(possibleStates);
verifyEqual(testCase, expectedOutput, actualOutput);

end