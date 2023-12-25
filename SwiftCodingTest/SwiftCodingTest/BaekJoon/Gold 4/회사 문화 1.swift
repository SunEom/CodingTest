import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var sub = Array(repeating:[Int](), count: n+1)
var dp = Array(repeating: 0, count: n+1)

let t = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 2...n {
    sub[t[i]].append(i)
}

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    dp[temp[0]] += temp[1]
}

func dfs(_ s: Int, _ score: Int) {
    let nScore = score + dp[s]

    dp[s] = nScore
    
    for v in sub[s] {
        dfs(v, nScore)
    }
}


dfs(1, 0)

var result = ""

for a in dp[1...] {
    result += "\(a) "
}

print(result)
