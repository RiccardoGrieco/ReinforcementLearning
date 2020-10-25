function action = map_model_Boltz_explore(Q, state, visits, functions, model, step)
%MAP_MODEL_BOLTZ_EXPLORE Boltzmann exploration approach
    T = 100.0;
    T = T/log(exp(1)+step-1); %TODO remove for constant temperature
    Q_read = functions.Q_read;
    actions = functions.state_actions(state, model);
    probabilities = exp(Q_read(Q, state, actions, model)/T)/sum(exp(Q_read(Q, state, actions, model)/T));
    [~, index] = max(probabilities);
    action = actions(index);
end

