function r = map_model_R_read(state, model)
%MAP_MODEL_R_READ Gets the reward of the given state.
    r = 0;
    switch model.M(state(1),state(2))
        case model.BLANK
            r = -1;
        case model.WALL
            r = 0;
        case model.PIT
            r = -500;
        case model.GOAL
            r = 500;
    end
end

