function [plan_succeeded, path] = dijkstar(graph)
plan_succeeded = false;
graph_size = size(graph,1);
for i = 1:graph_size
    point_list(i).node_index = i;
    point_list(i).adjacent_index = graph(i).adjacent_index;
    point_list(i).cost2origin = inf;
end
point_list(1).cost2origin = 0;
finish_list = [];
while true
    [min_node_cost, min_node_index] = min([point_list.cost2origin]);
    if(min_node_index == 2)
        plan_succeeded = true;
        break;
    elseif(graph(min_node_index).type == 'S' && min_node_cost == inf)
        break;
    end
    point_list(min_node_index).cost2origin = inf;
    finish_list = [finish_list, min_node_index];
    drawnow;
    adjacent_num = size(point_list(min_node_index).adjacent_index, 1);
    for k = 1:adjacent_num
        Adj_index = point_list(min_node_index).adjacent_index(k);
        cost2node = graph(min_node_index).cost(find(graph(min_node_index).adjacent_index == Adj_index));
        if(size(find(finish_list == Adj_index), 2) == 0 && point_list(Adj_index).cost2origin > min_node_cost + cost2node)
            point_list(Adj_index).cost2origin = min_node_cost + cost2node;
            point_list(Adj_index).parent = min_node_index;
        end
    end
end
    if(plan_succeeded == true)
        current_index = 2;
        path = [current_index];
        while true
            path = [path; point_list(current_index).parent];
            if(point_list(current_index).parent == 1)
                break;
            else
                current_index = point_list(current_index).parent;
            end
        end

        for i = 1:size(path,1)-1
            plot(graph(path(i)).coordinate(1),graph(path(i)).coordinate(2),'.','Color','m','MarkerSize',35);
            plot(graph(path(i+1)).coordinate(1),graph(path(i+1)).coordinate(2),'.','Color','m','MarkerSize',35);
            plot([graph(path(i)).coordinate(1), graph(path(i+1)).coordinate(1)], [graph(path(i)).coordinate(2), graph(path(i+1)).coordinate(2)], 'm', 'LineWidth', 3);
            drawnow;
        end
    else
        path = [];
    end
end

