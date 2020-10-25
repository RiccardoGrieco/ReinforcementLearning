function new_Q = map_model_Q_set(Q, state, action, value, model)
%MAP_MODEL_Q_SET Sets the Q-value of the action in a given state
    new_Q = Q;
    new_Q(state(1),state(2),action) = value;
end

