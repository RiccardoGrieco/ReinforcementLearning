function walkable = is_walkable(position,model)
%IS_WALKABLE Determines if the agent can occupy the position in the model
    x = position(1);
    y = position(2);
    walkable = (x>=1 && x<=model.width) && ...
               (y>=1 && y<=model.height) && ...
               model.M(x,y)~=model.WALL;
end

