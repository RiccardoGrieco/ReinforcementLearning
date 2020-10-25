function s = map_model_transition(state, action, model)
%MAP_MODEL_TRANSITION Transition model with custom probability for actual
%actions.
    x = state(1);
    y = state(2);
    p = rand;
    s = state;
    
    % custom probability of actual action
    Actions_prob = [0.825,0.05,0.05,0.05,0.025;  %UP    = 1
                    0.05,0.825,0.05,0.05,0.025;  %DOWN  = 2
                    0.05,0.05,0.825,0.05,0.025;  %LEFT  = 3
                    0.05,0.05,0.05,0.825,0.025]; %RIGHT = 4
    
    actions = ['U','D','L','R','N'];

    cumulative_prob = Actions_prob(action,1);
    i=1;
    while cumulative_prob<p
        i= i+1;
        cumulative_prob = cumulative_prob+Actions_prob(action,i);
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