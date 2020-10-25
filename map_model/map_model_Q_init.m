function Q = map_model_Q_init(model)
%MAP_MODEL_Q_INIT Initializes the Q-values

    Q = zeros(model.width, model.height, size(model.actions,2));
    
    goal = model.goal;
    for x = 1:model.width
        for y = 1:model.height
            if map_model_terminal_state([x,y],model)
               Q(x,y,1:4) = map_model_R_read([x,y], model);
            else
                state_actions = map_model_state_actions([x,y], model);                
                for i = 1:size(state_actions,2)
                    a_i = state_actions(i);
                    a = model.actions(a_i);
                    x_next = x;
                    y_next = y;
                    if a_i==1
                        y_next = y-1;
                    elseif a_i==2
                        y_next = y+1;
                    elseif a_i==3
                        x_next = x-1;
                    elseif a_i==4
                        x_next = x+1;
                    end
                    if ~is_walkable([x_next, y_next], model)
                        continue
                        Q(x,y,a_i) = -100;
                    elseif map_model_terminal_state([x_next,y_next],model)
                        Q(x,y,a_i) = map_model_R_read([x_next, y_next], model);
                    else
                        Q(x,y,a_i) = 1/norm([goal(1),goal(2)]-[x_next,y_next]);
                    end
                end
            end

        end
    end
end

