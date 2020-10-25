function action = map_model_eps_greedy(Q, state, visits, functions, model, step)
%MAP_MODEL_EPS_GREEDY Epsilon-greedy exploration strategy
    c = 0.9;
    x = state(1);
    y = state(2);
    actions = functions.state_actions(state, model);
    epsilon = c/functions.visit_count_read(state, visits, model); %TODO remove for constant epsilon
    p = rand;
    if p<=epsilon
        action = actions(randi(size(model.actions,2)));
    else
        [~,action] = max(Q(x,y,1:4));
    end
end

