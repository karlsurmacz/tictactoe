function feasibleStates = createFeasibleStateMatrix()

possibleStates = generateStates(9, 2);

feasibleStates = filterInfeasibleStates(possibleStates);