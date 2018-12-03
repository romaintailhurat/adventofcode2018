"""
https://adventofcode.com/2018/day/1
"""

function parseOperation(line)
    return (line[1], parse(Int, line[2:end]))
end

#@test parseOperation("-120") == ("-", 120)

function sumOrSub(operator, acc, value)
    if operator == '+'
        return acc + value
    else
        return acc - value
    end
end

const initFrequency = 0

function red(acc, curr)
    operator, value = parseOperation(curr)
    return sumOrSub(operator, acc, value)
end

input = open("inputs/aoc2018-1-1.txt")
lines = readlines(input)
close(input)

# Subproblem 1
"""
res = reduce(red, lines; init = initFrequency)
print(res, "\n")
"""

# Subproblem 2
frequencies = []
currentFreq = 0

for (i, v) in enumerate(Iterators.cycle(lines))    
    operator, value = parseOperation(v)
    global currentFreq
    newFreq = sumOrSub(operator, currentFreq, value)

    if i % 1000 == 0
        print(newFreq, " - ", currentFreq, " - ", length(frequencies), "\n")
    end

    if newFreq in frequencies
        print("Already seen! ", newFreq, "\n")
        break
    end
    push!(frequencies, newFreq)
    currentFreq = newFreq
end