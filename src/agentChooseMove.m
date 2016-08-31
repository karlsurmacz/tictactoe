function iMoveChoice = agentChooseMove(pRandomChoice, bPossibleMoves, iPossibleMoves, valueArray)

if rand < pRandomChoice
    iMoveChoice = iPossibleMoves(randperm(sum(bPossibleMoves), 1));
else
    maxValue = max(valueArray(bPossibleMoves));
    bNextStatesWithMaxValue = (valueArray(bPossibleMoves) == maxValue);
    iNextStatesWithMaxValue = find(bNextStatesWithMaxValue);
    iMoveChoice = iPossibleMoves(iNextStatesWithMaxValue(randperm(sum(bNextStatesWithMaxValue), 1)));
end