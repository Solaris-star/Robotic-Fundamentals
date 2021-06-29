function result = ObstacleCheck(start, target, Map, step_length)
    ky = target(2)-start(2);
    kx = target(1)-start(1);
    dis = distance(start, target);
    length = 0;
    MapSize = size(Map);
    while true
        length = length + step_length;
        y = ceil(start(2)+ky*length);
        x = ceil(start(1)+kx*length);
        if(y < 1 || y > MapSize(1)) % adjust if the exceed the map's range
            result = 0;
            break;
        end
        if(x < 1 || x > MapSize(2)) 
            result = 0;
            break;
        end
        if(Map(y, x) == 2)  % if there is a obstacle
            result = 1;
            break;
        end
        if(y == ceil(target(2)) && x == ceil(target(1))) % if reach the target node without detected the obstacle
            result = 0;
            break;
        end
    end
end

