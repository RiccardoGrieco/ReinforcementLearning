function action = Q_policy_action(Q, state, functions, model)
%Q_POLICY_ACTION Returns the action according to given state and Q-values
    actions = functions.state_actions(state, model);
    [~,i] = max(functions.Q_read(Q, state, actions, model));
    action = actions(i);
end

