import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let maxValue = 999999999
var adjMat = Array(repeating: Array(repeating: maxValue, count:n), count: n)

for i in 0..<n {
    adjMat[i][i] = 0
}

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    if adjMat[temp[0]-1][temp[1]-1] > temp[2] {
        adjMat[temp[0]-1][temp[1]-1] = temp[2]
    }
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            adjMat[i][j] = min(adjMat[i][j], adjMat[i][k] + adjMat[k][j])
        }
    }
}
var result = ""
for r in 0..<n {
    for c in 0..<n {
        result += "\(adjMat[r][c] == maxValue ? 0 : adjMat[r][c]) "
    }
    result += "\n"
}

print(result)
