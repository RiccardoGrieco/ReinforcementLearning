function visits = map_model_visit_count_init(model)
%MAP_MODEL_VISIT_COUNT_INIT Initialize the structure that memorizes the
%number of visits of the possible states of the model.
    visits = zeros(model.width, model.height);
end

