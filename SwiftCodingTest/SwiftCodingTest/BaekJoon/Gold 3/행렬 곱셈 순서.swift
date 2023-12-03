import Foundation

var n = Int(readLine()!)!
var cache = Array(repeating: Array(repeating: -1, count: 501), count: 501)
var matrix = [(Int, Int)]()


func dp(start: Int, end: Int) -> Int {
    if start == end {
        return 0
    }
    
    var temp = cache[start][end]
    if temp != -1 { return temp }
    
    for i in start..<end  {
        let cost = dp(start: start, end: i) + dp(start: i+1, end: end) + matrix[start].0 * matrix[i].1 * matrix[end].1
        temp = temp == -1 ? cost : min(temp, cost)
    }
    
    cache[start][end] = temp
    
    return temp
    
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    matrix.append((input[0], input[1]))
}

print(dp(start: 0, end: n-1))
