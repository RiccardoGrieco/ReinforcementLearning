function [policy, Q_new] = QLearning(Q, functions, model, learning_factor, discount_factor, curiosity)
%QLEARNING Q-Learning with given model and related functions and callbacks.
    Q_new = Q;
    MAX_EPOCHS = 1000; %TODO customize number of learning epochs
    t = 1;
    visits = functions.visit_count_init(model);
    for epoch = 1:MAX_EPOCHS
        step = 1;
        state = functions.random_state(model);
        while functions.terminal_state(state, model)
            state = functions.random_state(model);
        end
        while ~functions.terminal_state(state,model)
            visits = functions.visit_count_increment(state, visits, model);
            %TODO verbosity fprintf("epoch:%d - step:%d - pos [%d,%d]\n", epoch, step, state(1),state(2));
            action = curiosity(Q_new, state, visits, functions, model, epoch);
            next_state = functions.transition(state, action, model);
            r = functions.R_read(next_state, model);
            old_q = functions.Q_read(Q_new, state, action, model);
            alpha = learning_factor(epoch);
            actions = functions.state_actions(state, model);
            [max_q,~] = max(functions.Q_read(Q_new, next_state, actions, model));
            gain = r+discount_factor*max_q;
            new_q = (1-alpha)*old_q+alpha*gain;
            Q_new = functions.Q_set(Q_new, state, action, new_q, model);
            state = next_state;
            t = t+1;
            step = step+1;
        end
    end

    fprintf("\nALPHA = %f\n", alpha);
    policy = 0; %TODO
end