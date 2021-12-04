def position(arr)
    horizontal_movement = 0
    depth = 0

    arr.each do |movement|
        direction = movement[0]
        position = movement[1]

        if direction == 'forward'
            horizontal_movement += position
        elsif direction == 'down'
            depth += position
        elsif direction == 'up'
            depth -= position
        end
    end
    
    horizontal_movement * depth
end





movements = File.readlines('puzzle-data.txt', chomp: true)
    .map{ |ele| ele.split(' ')}
    .map{ |ele| ele = [ele[0], ele[1].to_i] }

p position(movements)
