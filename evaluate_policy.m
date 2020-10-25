function success_freq = evaluate_policy(Q, functions, model, executions)
%EVALUATE_POLICY Evaluates the frequency of success for a given number of
%execution, using given Q-values.
    successes = 0;
    for e = 1:executions
        state = functions.random_state(model);
        while functions.terminal_state(state, model)
            state = functions.random_state(model);
        end
        
        while ~functions.terminal_state(state, model)
            action = Q_policy_action(Q, state, functions, model);
            state = functions.transition(state, action, model);
        end
        
        if functions.R_read(state, model)>0
            successes = successes+1;
            %fprintf("Execution: %d - SUCCESS\n", e);
        %else
            %fprintf("Execution: %d - FAILED\n", e);
        end
        
        
    end
    success_freq = successes/executions;
end

