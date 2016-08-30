function stateMatrix = generateStates(nNodes, nStates)

% State is defined as: row by row, left-to-right and top-to-bottom
% 0 means no play, 1 means nought, 2 means cross

g = dec2base(0:nStates^nNodes-1, nStates);
stateMatrix = zeros(nStates^nNodes-1, nNodes);
for i=1:size(g,1)
    for j=1:size(g,2)
        stateMatrix(i,j) = str2double(g(i,j));
    end
end
