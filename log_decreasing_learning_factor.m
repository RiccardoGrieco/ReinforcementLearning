function alpha = log_decreasing_learning_factor(step)
%LOG_DECREASING_LEARNING_FACTOR Calculates the learning factor at a certain
%step, using a logaritmic decreasing function.
    alpha = 4/(5*log(exp(1)+step));
end

