addpath('./exploration_functions');
addpath('./map_model');
addpath('./map_model/visit_count');

% MODEL
%--- CONST
model.BLANK = 0;
model.WALL = 1;
model.GOAL = 3;
model.PIT = 4;
%--- INIT
model.actions = ['U','D','L','R'];
model.width = 10;
model.height = 10;
model.M = zeros(model.width,model.height);
%--- GOAL
goal = [3,5];
model.M(goal(1),goal(2)) = model.GOAL;
model.goal = goal;
%--- PITS
pits = [[1,5],[3,3], [3,6], [4,8], [8,3], [5,7]]; 
for i = 1:size(pits,2)/2
    model.M(pits(2*i-1),pits(2*i)) = model.PIT;
end
model.pits = pits;

% FUNCTIONS
functions.Q_read = @map_model_Q_read; %read Q-Value
functions.Q_set = @map_model_Q_set; %set Q-Value
functions.R_read = @map_model_R_read; %read reward
functions.random_state = @map_model_random_state; %generate random state
functions.state_actions = @map_model_state_actions; %retruns the available actions
functions.terminal_state = @map_model_terminal_state; %determine if a state is terminal
functions.transition = @map_model_transition; %state transition model
functions.visit_count_init = @map_model_visit_count_init; %initialize visit count
functions.visit_count_increment = @map_model_visit_count_increment; %increments the number of visits
functions.visit_count_read = @map_model_visit_count_read; %reads the number of visits
% opposite transition
%functions.transition = @map_model_opposite_transition;

% Q matrix
Q = map_model_Q_init(model);
% Q-Learning
RL = @QLearning;
% SARSA
%RL = @SARSA;

% Learning
[~,new_Q] = RL(Q, functions, model, @log_decreasing_learning_factor, 1, @map_model_Boltz_explore);

%show_map(model);
show_policy(new_Q, functions, model);

EXECUTIONS = 100;
success_freq = evaluate_policy(new_Q, functions, model, EXECUTIONS);
fprintf("\nSuccess frequency: %f", success_freq)