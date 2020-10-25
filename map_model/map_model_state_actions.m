function actions = map_model_state_actions(state, model)
%STATE_ACTIONS Returns the set of actions available in the given state.
    actions = 1:size(model.actions,2);
    return;
    x = state(1);
    y = state(2);
    if ~is_walkable([x,y-1], model)
        actions(1) = 0;
    end
    if ~is_walkable([x,y+1], model)
        actions(2) = 0;
    end
    if ~is_walkable([x-1,y], model)
        actions(3) = 0;
    end
    if ~is_walkable([x+1,y], model)
        actions(4)= 0;
    end
    actions = actions(actions~=0);
end

