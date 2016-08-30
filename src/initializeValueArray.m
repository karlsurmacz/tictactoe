function valueArray = initializeValueArray(feasibleStates, bIsNoughts)

if bIsNoughts
    nWin = 1;
    nLose = 2;
else
    nWin = 2;
    nLose = 1;
end

bWinningState = findWinningStates(feasibleStates, nWin);
bLosingState = findWinningStates(feasibleStates, nLose);

valueArray = 0.5*ones(size(feasibleStates, 1), 1);
valueArray(bWinningState) = 1;
valueArray(bLosingState) = 0;


            
 


