function iPossibleMoves = findPossibleMovesFromCurrentState(currentState, feasibleStates, nDim)

currentStateMat = repmat(currentState, size(feasibleStates, 1), 1);
iPossibleMoves = sum((feasibleStates == currentStateMat), 2) == (nDim^2 - 1); % States where each element is the same apart from one
iPossibleMoves = iPossibleMoves & ((sum(currentStateMat == 0, 2) - sum(feasibleStates == 0, 2)) == 1);