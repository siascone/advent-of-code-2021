


def num_increasing_depths(depths)

    count = 0
    previous = depths.first

    (1...depths.length).each do |idx|
        current_depth = depths[idx]
        if current_depth > previous
            count += 1
        end
        previous = current_depth
    end

    return count
end
    
depths_arr = File.readlines('puzzle-data', chomp: true).map{ |ele| ele.to_i }
p num_increasing_depths(depths_arr)