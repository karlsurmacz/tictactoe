function createFeasibleStateMatrix()

nDim = 3;
pRandomChoice = 0.05;
learningRate = 0.1;

possibleStates = generateStates(nDim^2, 3);

feasibleStates = filterInfeasibleStates(possibleStates);

if exist('savedValueArray.mat') == 2
    load('savedValueArray.mat');
else
    valueArray = initializeValueArray(feasibleStates, false);
end

% Run game while still alive (either someone hasn't won or stalemate)
bGameRunning = true;
currentState = zeros(1, nDim^2);
iPreviousMove = find(all(feasibleStates==0,2));

while bGameRunning
    
    % Ask human player for a data point
    bValidMove = false;
    while ~bValidMove
        playerMove = input('Please input the coordinates (3 = top right) of where you want your cross: ');
        bValidMove = currentState(1, playerMove) == 0;
    end
    
    % Update current state of game
    currentState(1, playerMove) = 2;
    iCurrentState = find(all(feasibleStates == repmat(currentState, size(feasibleStates,1), 1), 2));
    
    % Update the value array after computer move
    valueArray = updateValueArray(valueArray, iPreviousMove, iCurrentState, learningRate);
    iPreviousMove = iCurrentState;
    
    % Check whether human player has won
    bGameRunning = ~checkWhetherEndState(currentState);
    if findWinningStates(currentState, 2) || ~bGameRunning
        break
    end
    
    % Now let agent choose. First find possible moves
    bPossibleMoves = findPossibleMovesFromCurrentState(currentState, feasibleStates, nDim);
    iPossibleMoves = find(bPossibleMoves);
    
    % Then choose move from this list
    iMoveChoice = agentChooseMove(pRandomChoice, bPossibleMoves, iPossibleMoves, valueArray);
    
    % Make the game state equal to the one chosen
    currentState = feasibleStates(iMoveChoice,:);
    
    % Update the value array after computer move
    valueArray = updateValueArray(valueArray, iPreviousMove, iMoveChoice, learningRate);
    % Is this an end state
    bGameRunning = ~checkWhetherEndState(currentState);
    
    % Show game state in the command window
    strOut = showGameState(currentState, nDim);
    sprintf(strOut)
    
    % Update 'previous' state and value
    iPreviousMove = iMoveChoice;
end

if findWinningStates(currentState, 2)
     disp('Human wins')
elseif findWinningStates(currentState, 1)
    disp('Computer wins')
else
    disp('Stalemate!')
end

% Save value array
save('savedValueArray.mat', 'valueArray');
    
    
    
    
    
