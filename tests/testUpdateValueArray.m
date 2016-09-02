function tests = testUpdateValueArray
tests = functiontests(localfunctions);
end

function testBasicCase(testCase)

valueArrayIn = [0.6; 0.2; 0.5; 0];
iPreviousMove = 2;
iMoveChoice = 3;
learningRate = 0.1

expectedOutput = [0.6; 0.23; 0.5; 0];

actualOutput = updateValueArray(valueArrayIn, iPreviousMove, iMoveChoice, learningRate);
verifyEqual(testCase, expectedOutput, actualOutput);

end