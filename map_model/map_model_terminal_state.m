function terminal = map_model_terminal_state(state,model)
%MAP_TRANSITION_TERMINAL_STATE Determines if the state is terminal.
    cell_value = model.M(state(1),state(2));
    terminal = (cell_value==model.PIT || cell_value==model.GOAL);
end

