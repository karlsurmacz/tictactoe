function valueArray = initializeValueArray(feasibleStates, bIsNoughts)

if bIsNoughts
    nWin = 2;   % Goal is for computer to win
    nLose = 1;
else
    nWin = 1;
    nLose = 2;
end

bWinningState = findWinningStates(feasibleStates, nWin);
bLosingState = findWinningStates(feasibleStates, nLose);

valueArray = 0.5*ones(size(feasibleStates, 1), 1);
valueArray(bWinningState) = 1;
valueArray(bLosingState) = 0;


            
 


