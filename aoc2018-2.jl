#= Solving https://adventofcode.com/2018/day/2 =#

function letterCount(s)
    counter = Dict{Char, Int}()
    for letter in s
        counter[letter] = get(counter, letter, 0) + 1
    end
    return counter
end

function solvePartOne(lines)
    twoAndThrees = Dict{Int, Int}()
    for line in lines
        count = letterCount(line)
        vs = values(count)
        if 2 in vs
            twoAndThrees[2] = get(twoAndThrees, 2, 0) +1
        end
        if 3 in vs
            twoAndThrees[3] = get(twoAndThrees, 3, 0) +1
        end
    end

    println(twoAndThrees[2] * twoAndThrees[3])
end

# ----
input = open("inputs/aoc2018-2.txt")
lines = readlines(input)

solvePartOne(lines)

close(input)