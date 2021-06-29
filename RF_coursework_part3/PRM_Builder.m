function [PointList] = PRM_Builder(Map, origin, destination, sampling_points, step_length_limit, show_graph)
MapSize = size(Map);

% color setting
white = [1,1,1];
black = [0,0,0];
green = [0,1,0];
yellow = [1,1,0];
red = [1,0,0];
blue = [0,0,1];
cyan = [0,1,1];
color_list = [white; black; green; yellow; red; blue; cyan];
colormap(color_list);

logical_map = logical(Map);
map = zeros(MapSize(1),MapSize(2));
map(logical_map) = 2;
map(~logical_map) = 1;

iteration_times = 0;

start_point = Node(origin, 'S');
stop_point = Node(destination, 'G');
point_list = [start_point; stop_point];
  
image(0.5,0.5,map);
grid on;
set(gca,'xtick',1:1:MapSize(1));
set(gca,'ytick',1:1:MapSize(1));
axis image;
hold on;
plot(origin(1),origin(2),'.','Color','b','MarkerSize',30);
plot(destination(1),destination(2),'.','Color','y','MarkerSize',30);
drawnow;
        
while true
    if(iteration_times >= sampling_points) 
        break;
    end

    rand_node = [MapSize(1)*rand(1,1), MapSize(2)*rand(1,1)];
    add2list_flag = 0;
    if(map(ceil(rand_node(2)), ceil(rand_node(1))) ~= 2) 
        list_size = size(point_list);
        counter = 0;
        for i = 1:list_size(1)  
            dis = distance(rand_node, point_list(i).coordinate); 
            if(dis < step_length_limit && ObstacleCheck(rand_node, point_list(i).coordinate, map, 0.01) == 0) % obstacle check and step length limit 
                add2list_flag = 1;
                if(counter == 0)
                    node_temp = Node(rand_node, 'W');
                    counter = counter + 1;
                end
                node_temp = node_temp.addAdjacentNode(point_list(i).coordinate, dis, i);
                point_list(i) = point_list(i).addAdjacentNode(node_temp.coordinate, dis, list_size(1)+1);
            end
        end
    
        if(add2list_flag == 1)
            iteration_times = iteration_times + 1;
            if(show_graph)
                plot(rand_node(1),rand_node(2),'.','Color','r','MarkerSize',20);
              drawnow;
            end
            point_list = [point_list; node_temp];
        end
    end
end
    
if(show_graph)
    for i = 1:size(point_list, 1)
        adjacent_node_num = size(point_list(i).adjacent_coordinate, 1);
        for k = 1:adjacent_node_num
            plot([point_list(i).coordinate(1), point_list(i).adjacent_coordinate(k,1)], [point_list(i).coordinate(2), point_list(i).adjacent_coordinate(k,2)], 'b');
        end
    end
end
PointList = point_list;
end