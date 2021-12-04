def life_support(arr)

    ox_search = arr.dup
    co2_search = arr.dup

    i = 0
    while ox_search.length > 1
        if i > 11
            i = 0
        end

        ones = 0
        zeros = 0

        ox_search.each do |ele|
            ele[i] == '1' ? ones += 1 : zeros += 1
        end

        if ones > zeros || ones == zeros
            keep = '1'
        else
            keep = '0'
        end

        ox_search.each do |ele|
            if ele[i] != keep
                ox_search.delete(ele)
            end
        end

        i += 1
    end
    j = 0
    while co2_search.length > 1
        if j > 11
            j = 0
        end
        # p co2_search
        ones = 0
        zeros = 0

        co2_search.each do |ele|
            ele[j] == '1' ? ones += 1 : zeros += 1
        end

        if ones > zeros || ones == zeros
            keep = '0'
        else
            keep = '1'
        end

        co2_search.each do |ele|
            if ele[j] != keep
                co2_search.delete(ele)
            end
        end

        j += 1
    end

    p ox = ox_search[0].to_i(2)
    p co2 = co2_search[0].to_i(2)

    ox * co2
end



diagnostic_report = File.readlines('puzzle-data.txt', chomp: true)
p life_support(diagnostic_report)