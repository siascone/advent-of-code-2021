def sliding_window_3(arr)

    count = 0
    previous_window_sum = [arr[0], arr[1], arr[2]].sum
    
    (1...arr.length).each do |idx|
        idx + 2
        if arr[idx + 2] == nil || arr[idx + 1] == nil
            break
        end

        shifted_window_sum = arr[idx] + arr[idx+1] + arr[idx+2]
        count += 1 if shifted_window_sum > previous_window_sum
        previous_window_sum = shifted_window_sum
    end

    count
end


depths_arr = File.readlines('puzzle-data.txt', chomp: true).map{ |ele| ele.to_i }

p sliding_window_3(depths_arr)