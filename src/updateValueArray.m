function valueArrayOut = updateValueArray(valueArrayIn, iPreviousMove, iMoveChoice, learningRate)

valueArrayOut = valueArrayIn;
valueArrayOut(iPreviousMove) = valueArrayOut(iPreviousMove) + learningRate* ...
    (valueArrayOut(iMoveChoice) - valueArrayOut(iPreviousMove));