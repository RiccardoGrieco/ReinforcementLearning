function q = map_model_Q_read(Q, state, action, model)
%MAP_MODEL_Q_READ Reads the Q-value related to a
    q = Q(state(1),state(2),action);
end