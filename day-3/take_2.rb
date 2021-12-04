require 'byebug'
def frequent_bit(data, idx)
    ones = 0
    zeros = 0
    data.each do |condition|
        condition[idx] == '1' ? ones += 1 : zeros += 1
    end
    ones >= zeros ? '1' : '0'
end

def infrequent_bit(data, idx)
    ones = 0
    zeros = 0
    data.each do |condition|
        if condition[idx] == '1'
            ones += 1
        elsif condition[idx] == '0'
            zeros += 1
        end
    end

    # p idx

    if ones < zeros
        # debugger
        return '1'
    elsif ones == zeros
        # debugger
        return '0'
    elsif ones > zeros
        # debugger
        return '0'
    end
end


def find_02(data, bit_idx)
    return data if data.length == 1

    reduced_data = []
    most_frequent = frequent_bit(data, bit_idx)

    data.each do |condition|
        if condition[bit_idx] == most_frequent
            reduced_data << condition
        end
    end

    find_02(reduced_data, bit_idx + 1)
end

def find_co2(data, bit_idx)
    return data if data.length == 1
    reduced_data = []
    least_frequent = infrequent_bit(data, bit_idx)
    p least_frequent

    data.each do |condition|
        if condition[bit_idx] == least_frequent
            reduced_data << condition
        end
    end
    find_co2(reduced_data, bit_idx+1)
end

def life_support(data, initial_idx)
    o2 = find_02(data, initial_idx)[0].to_i(2)
    co2 = find_co2(data, initial_idx)[0].to_i(2)
    p o2 
    p co2
    o2 * co2
end

diagnostic_report = File.readlines('puzzle-data.txt', chomp: true)
p life_support(diagnostic_report, 0)

