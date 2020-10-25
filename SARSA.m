function [policy, Q_new] = SARSA(Q, functions, model, learning_factor, discount_factor, curiosity)
%SARSA State-Action-Reward-State-Action reinforcement learning algorithm
%with given model, functions and parameters.
    Q_new = Q;
    MAX_EPOCHS = 100; %TODO customize number of learning epochs
    t = 1;
    visits = functions.visit_count_init(model);
    for epoch = 1:MAX_EPOCHS
        step = 1;
        state = functions.random_state(model);
        while functions.terminal_state(state, model)
            state = functions.random_state(model);
        end
        while ~functions.terminal_state(state,model)
            %TODO verbosity fprintf("epoch:%d - step:%d - pos [%d,%d]\n", epoch, step, state(1),state(2));
            visits = functions.visit_count_increment(state, visits, model);
            action = curiosity(Q_new, state, visits, functions, model, t);
            next_state = functions.transition(state, action, model);
            r = functions.R_read(state, model);
            old_q = functions.Q_read(Q_new, state, action, model);
            alpha = learning_factor(epoch);
            next_GLIE_action = curiosity(Q_new, next_state, visits, functions, model, t+1);
            gain = r+discount_factor*functions.Q_read(Q_new, next_state, next_GLIE_action, model);
            new_q = (1-alpha)*old_q+alpha*gain;
            Q_new = functions.Q_set(Q_new, state, action, new_q, model);
            state = next_state;
            t = t+1;
            step = step+1;
        end
    end
    policy = 0; %TODO
end

