
def play(boards, draws)
    draws_to_win = Hash.new(0)
    boards.each do |board|
        count = 0

        draws.each do |draw|
            
        end
    end
end









draws = [57,9,8,30,40,62,24,70,54,73,12,3,71,95,58,88,23,81,53,80,22,45,98,37,18,72,14,20,66,0,19,31,82,34,55,29,27,96,48,28,87,83,36,26,63,21,5,46,33,86,32,56,6,38,52,16,41,74,99,77,13,35,65,4,78,91,90,43,1,2,64,60,94,85,61,84,42,76,68,10,49,89,11,17,79,69,39,50,25,51,47,93,44,92,59,75,7,97,67,15]
boards = []
sub_arr = []
File.readlines('boards.txt', chomp: true).each do |ele|
    sub_arr.push(ele.split(' '))
    if ele == ""
        boards.push(sub_arr)
        sub_arr = []
    end
end

boards = boards.map do |ele|
    ele.each do |sub|
        if sub.length == 0
            ele.delete(sub)
        end
    end
end