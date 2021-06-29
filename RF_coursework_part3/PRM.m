load('Map.mat');
start_point = [2, 30];    % coordinate of the start node
stop_point = [65, 47]; % coordinate of the destination node
figure(1);
clf;

show_graph = true;  
sampling_points = 150; %Sampling points---For path finding
step_length_limit = 10; %Step length--the distance between each sample point

graph = PRM_Builder(map, start_point, dest_node, sampling_points, step_length_limit, show_graph);
[plan_succeeded, path] = dijkstar(graph);

if(plan_succeeded)
    disp('Successfully found the path! ');
else
    disp('No path found!');
end

