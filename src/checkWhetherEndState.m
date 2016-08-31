function bEndState = checkWhetherEndState(state)

bEndState = findWinningStates(state, 1) | findWinningStates(state, 2) | ...
    ~any(state == 0, 2);