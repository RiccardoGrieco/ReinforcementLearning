function s = map_model_random_state(model)
%MAP_MODEL_RANDOM_STATE Generates a random state for the model.
    is_terminal = true;
    while is_terminal
     s = [randi(model.width),randi(model.height)];
     is_terminal = map_model_terminal_state(s, model);
    end
end