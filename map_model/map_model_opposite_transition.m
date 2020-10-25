function s = map_model_opposite_transition(state, action, model)
%MAP_MODEL_OPPOSITE_TRANSITION Custom transition model where there is a
%greater chance that the actual action is the opposite of the desired one.
    x = state(1);
    y = state(2);
    % "actual" action
    p = rand;
    s = state;
    
    Actions_prob = [0,0.9,0,0,0.1;  %UP
                    0.9,0,0.1,0,0;  %DOWN
                    0,0,0,0.9,0.1;  %LEFT
                    0,0,0.9,0,0.1]; %RIGHT

    actions = ['U','D','L','R','N'];

    cumulative_prob = Actions_prob(action, 1);
    i=1;
    while cumulative_prob<p
        i= i+1;
        cumulative_prob = cumulative_prob+pick_from(action, i);
    end

    
    true_action = actions(i);
    if true_action=='U' && is_walkable([x,y-1],model)
        s(2) = y-1;
    elseif true_action=='D' && is_walkable([x,y+1],model)
        s(2) = y+1;
    elseif true_action=='L' && is_walkable([x-1,y],model)
        s(1) = x-1;
    elseif true_action=='R' && is_walkable([x+1,y],model)
        s(1) = x+1;
    end
end