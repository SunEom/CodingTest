import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var result = 0

var adjMat = Array(repeating: Array(repeating: false, count: n+1), count: n+1)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    adjMat[temp[0]][temp[1]] = true
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if !adjMat[i][j] {
                adjMat[i][j] = adjMat[i][k] && adjMat[k][j]
            }
        }
    }
}

for i in 1...n {
    var cnt = 0
    for j in 1...n {
        if adjMat[i][j] || adjMat[j][i] {
            cnt += 1
        }
    }
    
    if cnt == n-1 {
        result += 1
    }
}

print(result)
