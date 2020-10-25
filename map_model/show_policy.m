function show_policy(Q, functions, model)
%SHOW_POLICY Shows the policy based on Q-values.

    fprintf("Model and policy (G=Goal | P=Pitfall):\n");

    M = model.M;
    for y = 1:model.height
        for x = 1:model.width
            if M(x,y)==model.PIT
                fprintf("P ");
            elseif M(x,y)==model.GOAL
                fprintf("G ");
            elseif M(x,y)==model.WALL
                fprintf("W ");
            else
                [~,a] = max(Q(x,y,1:4));
                switch model.actions(a)
                    case 'U'
                        fprintf("^ ");
                    case 'D'
                        fprintf("v ");
                    case 'L'
                        fprintf("< ");
                    case 'R'
                        fprintf("> ");
                end
            end
        end
        fprintf("\n");
    end
end

