function n = map_model_visit_count_read(state, visits, model)
%MAP_MODEL_VISIT_COUNT_READ Reads the number of visits of a given state.
    n = visits(state(1),state(2));
end

