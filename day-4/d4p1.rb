require 'byebug'

def play(draws, boards)
    draws.each_with_index do |draw, i|
        boards.each do |board|
            checked_board = check_board(board, draw)
            debugger
            if win(checked_board)
                debugger
                return calc_score(board, draws[0..i])
            end
        end
    end
end

def calc_score(board, draws)
    debugger
    dup = deep_dup(board)
    winning_num = draws[-2]
    
    dup.each_with_index do |row, i|
        row.each_with_index do |ele, j|
            dup[i][j] = :x if draws.include?(dup[i][j])
        end
    end

    row_win_idx = -1
    row_score = 0

    dup.each_with_index do |row, idx|
        if row.all?{ |ele| ele == :x}
            row_win_idx = idx
            break
        end
    end

    col_win_idx = -1
    col_score = 0

    if row_win_idx == -1
        trans = dup.transpose
        trans.each_with_index do |row, jdx|
            if row.all? { |ele| ele == :x }
                col_win_idx = jdx
                break
            end
        end
        p board[col_win_idx]
        # col_score = board.transpose[col_win_idx].map{|ele| ele.to_i }.sum * winning_num
    else
        # row_score = board[row_win_idx].map{ |ele| ele.to_i }.sum * winning_num
    end

    if col_score == 0
        score = row_score
    else
        score = col_score
    end


    p score
    p winning_num
    p draws
end

def check_board(board, num)
    debugger
    dup = deep_dup(board)
    dup.each_with_index do |row, i|
        row.each_with_index do |ele, j|
            if ele = num.to_s
                dup[i][j] = :x 
                break
            end
        end
    end
    dup
end

def row_win(board) 
    debugger
    board.each do |row|
        row.all? { |ele| ele == :x}
    end
end

def col_win(board)
    debugger
    trans = board.transpose
    row_win(trans)
end

def win(board)
    debugger
    row_win(board) || col_win(board)
end

def deep_dup(arr)
    dupped = []

    arr.each do |ele|
        if ele.is_a?(Array)
            dupped << deep_dup(ele)
        else
            dupped << ele
        end
    end
    dupped
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

p play(draws,boards)
