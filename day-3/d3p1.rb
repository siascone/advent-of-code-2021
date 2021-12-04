
def power_use(arr)

    gamma = []
    epsilon = []


    length = arr[0].length

    (0...length).each do |idx|
        ones = 0
        zeros = 0
        arr.each do |condition|
            if condition[idx] == '1'
                ones += 1
            else
                zeros += 1
            end
        end

        if ones > zeros
            gamma.push('1')
            epsilon.push('0')
        else
            gamma.push('0')
            epsilon.push('1')
        end
    end

    gamma = gamma.join.to_i(2)
    epsilon = epsilon.join.to_i(2)

    gamma * epsilon
end



diagnostic_report = File.readlines('puzzle-data.txt', chomp: true)
p power_use(diagnostic_report)