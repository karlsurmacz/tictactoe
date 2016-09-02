function strOut = showGameState(currentState, nDim)
strOut = [];
for iDim=1:nDim
    for jDim=1:nDim
        if currentState((iDim-1)*nDim + jDim) == 2
            strOut = [strOut, 'x|'];
        elseif currentState((iDim-1)*nDim + jDim) == 1
            strOut = [strOut, 'o|'];
        else
            strOut = [strOut, ' |'];
        end
    end
    strOut = [strOut, '\n'];
end
    