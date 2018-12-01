"""
https://adventofcode.com/2018/day/1
"""

function parseOperation(line)
    return (line[1], line[2:end])
end

function red(acc, curr)
    operator, s_value = parseOperation(curr)
    value = parse(Int, s_value)
    if operator == '+'
        return acc + value
    else
        return acc - value
    end
end

input = open("inputs/aoc2018-1-1.txt")

lines = readlines(input)

res = reduce(red, lines; init = 0)

print(res)

close(input)