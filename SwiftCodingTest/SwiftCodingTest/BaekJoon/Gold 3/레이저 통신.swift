import Foundation

let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
let w = wh[0], h = wh[1]
var dp = Array(repeating: Array(repeating: 999999, count: w), count: h)

var arr = [[Character]]()

let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

for _ in 0..<h {
    arr.append(Array(readLine()!))
}

var target = [[Int]]()

for i in 0..<h {
    for j in 0..<w {
        if arr[i][j] == "C" {
            target.append([i, j])
        }
    }
}

let sr = target[0][0], sc = target[0][1]
let er = target[1][0], ec = target[1][1]

var queue = [[Int]]()

for i in 0..<4 {
    let d = directions[i]
    let dr = sr + d[0], dc = sc + d[1]
    if (0..<h).contains(dr) && (0..<w).contains(dc) && arr[dr][dc] != "*" {
        dp[dr][dc] = 0
        queue.append([dr, dc, i, 0])
    }
}

var idx = 0
while queue.count > idx {
    let p = queue[idx]
    let pr = p[0], pc = p[1], t = p[3]
    
    for i in 0..<4 {
        let d = directions[i]
        let dr = pr + d[0], dc = pc + d[1]
        if (0..<h).contains(dr) && (0..<w).contains(dc) && arr[dr][dc] != "*" {
            if i == p[2] {
                if dp[dr][dc] >= t {
                    dp[dr][dc] = t
                    queue.append([dr, dc, i, t])
                }
            } else {
                if dp[dr][dc] >= t+1 {
                    dp[dr][dc] = t+1
                    queue.append([dr, dc, i, t+1])
                }
            }
        }
    }
    idx += 1
}

print(dp[er][ec])
