import Foundation

func solution(_ n:Int) -> [[Int]] {
    return hanoi(n, 1, 3, 2)
}

func hanoi(_ n: Int, _ from: Int, _ to: Int, _ with: Int) -> [[Int]] {
    if n == 1 {
        return [[from, to]]
    } else {
        var result = hanoi(n-1, from, with, to)
        result.append([from, to])
        result += hanoi(n-1, with, to, from)
        return result
    }
}
