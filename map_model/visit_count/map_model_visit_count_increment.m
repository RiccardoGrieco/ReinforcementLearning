function visits = map_model_visit_count_increment(state, visits, model)
%MAP_MODEL_VIST_COUNT_INCREMENT Increments the number of visits of a given
%state.
    visits(state(1),state(2)) = visits(state(1),state(2))+1;
end

