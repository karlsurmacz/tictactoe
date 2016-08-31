function createFeasibleStateMatrix()

nDim = 3;
pRandomChoice = 0.05;

possibleStates = generateStates(nDim^2, 3);

feasibleStates = filterInfeasibleStates(possibleStates);

valueArray = initializeValueArray(feasibleStates, false);

% Run game while still alive (either someone hasn't won or stalemate)
bGameRunning = true;
currentState = zeros(1, nDim^2);
while bGameRunning
    
    % Ask human player for a data point
    bValidMove = false;
    while ~bValidMove
        playerMove = input('Please input the coordinates (3 = top right) of where you want your cross: ');
        bValidMove = currentState(1, playerMove) == 0;
    end
    
    % Update current state of game
    currentState(1, playerMove) = 2;
    
    % Check whether human player has won
    if findWinningStates(currentState, 2)
        break
    end
    
    % Now let agent choose. First find possible moves
    bPossibleMoves = findPossibleMovesFromCurrentState(currentState, feasibleStates, nDim);
    iPossibleMoves = find(bPossibleMoves);
    
    % Then choose move from this list
    iMoveChoice = agentChooseMove(pRandomChoice, bPossibleMoves, iPossibleMoves, valueArray);
    
    % Make the game state equal to the one chosen
    currentState = feasibleStates(iMoveChoice,:);
    
    % Is this an end state
    bGameRunning = ~checkWhetherEndState(currentState);
    currentState
end

if findWinningStates(currentState, 2)
     disp('Human wins')
elseif findWinningStates(currentState, 1)
    disp('Computer wins')
else
    disp('Stalemate!')
end

    
    
    
    
    
    
