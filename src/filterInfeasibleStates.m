function feasibleStates = filterInfeasibleStates(possibleStates)

% Only feasible states in tic tac toe are states where
% 0 <= (nCrosses - nNoughts) <= 1
% Assumption is that crosses always goes first

iCrosses = (possibleStates == 2);
nCrossesInRow = sum(iCrosses, 2);

iNoughts = (possibleStates == 1);
nNoughtsInRow = sum(iNoughts, 2);

iFeasibleStates = ((nCrossesInRow - nNoughtsInRow) == 0) | ...
                ((nCrossesInRow - nNoughtsInRow) == 1);
            
feasibleStates = possibleStates(iFeasibleStates, :);

% this prevents the function passing out a 0 x n empty array.
if isempty(feasibleStates)
    feasibleStates = [];
end

