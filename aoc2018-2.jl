#= Solving https://adventofcode.com/2018/day/2 =#
using Distances
using DataStructures

const intToLetter = Dict(collect(enumerate("abcdefghijklmnopqrstuvwxyz")))
const letterToInt = Dict(value => key for (key, value) in intToLetter)

function letterCount(s)
    counter = Dict{Char, Int}()
    for letter in s
        counter[letter] = get(counter, letter, 0) + 1
    end
    return counter
end

function getVectorFromString(s)
    return map(letter -> letterToInt[letter], collect(s))
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

function solvePartTwo(lines)
    cosinePairs = DataStructures.SortedDict()
    for line in lines
        for line2 in lines
            if line != line2
                dist = evaluate(CosineDist(), getVectorFromString(line), getVectorFromString(line2))
                key = line * "-" * line2
                cosinePairs[key] = dist
            end
        end
    end
    
    vs = collect(values(cosinePairs))
    ks = collect(keys(cosinePairs))
    min, indexOfMin = findmin(vs)
    winnerPair= getindex(ks, indexOfMin)
    println(winnerPair)
    s1, s2 = split(winnerPair, "-")
    commonElements = intersect(s1, s2)
    println(join(commonElements))
end

# ----
input = open("inputs/aoc2018-2.txt")
lines = readlines(input)

#solvePartOne(lines)
solvePartTwo(lines)

close(input)