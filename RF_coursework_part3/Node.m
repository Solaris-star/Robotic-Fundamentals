classdef Node
    properties
        type;   % node type
        coordinate; % coordinate of node
        adjacent_coordinate; %  coordinate of adjacent nodes
        adjacent_index; % the index of adjacent nodes in the node_list
        cost;   % the cost of edges
    end
    
    methods
        %% Construct function
        function N = Node(Coordinate, Type)
            N.type = Type;
            N.coordinate = Coordinate;
        end
        
        %% addAdjacentNode function
        function N = addAdjacentNode(N, adjacent_node, cost, index)
            N.adjacent_coordinate = [N.adjacent_coordinate; adjacent_node];
            N.adjacent_index = [N.adjacent_index; index];
            N.cost = [N.cost; cost];
        end
    end
end

