def position(arr)
    horizontal_movement = 0
    aim = 0
    depth = 0

    arr.each do |movement|
        direction = movement[0]
        position = movement[1]

        if direction == 'forward'
            horizontal_movement += position
            # aim += position
            depth += (aim * position)
        elsif direction == 'down'
            aim += position
        elsif direction == 'up'
            aim -= position
        end
    end
    
    horizontal_movement * depth
end


movements = File.readlines('puzzle-data.txt', chomp: true)
    .map{ |ele| ele.split(' ')}
    .map{ |ele| ele = [ele[0], ele[1].to_i] }

p position(movements)
