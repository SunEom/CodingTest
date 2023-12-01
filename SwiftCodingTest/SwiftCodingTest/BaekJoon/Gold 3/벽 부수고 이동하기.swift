import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var arr = [[Int]]()

for _ in 0..<n {
    let t = Array(readLine()!).map { Int(String($0))! }
    arr.append(t)
}

var dp = Array(repeating: Array(repeating: Array(repeating:9999999, count: 2), count: m), count: n)
let directions = [[1,0],[0,1],[-1,0],[0,-1]]

var queue = [[0,0,1,1]]
dp[0][0][1] = 1


var idx = 0
while queue.count > idx {
    let p = queue[idx]
    let pr = p[0], pc = p[1], chance = p[2], dist = p[3]
    
    for d in directions {
        let tr = pr + d[0], tc = pc + d[1]
        
        if (0..<n).contains(tr) && (0..<m).contains(tc) {
            if arr[tr][tc] == 0 && dp[tr][tc][chance] > dist + 1 {
                dp[tr][tc][chance] = dist + 1
                queue.append([tr, tc, chance, dist+1])
            } else if arr[tr][tc] == 1 && chance == 1 && dp[tr][tc][chance-1] > dist + 1 {
                dp[tr][tc][chance-1] = dist
                queue.append([tr, tc, chance-1, dist+1])
            }
        }
    }
    idx += 1
}

let result = min(dp[n-1][m-1][0], dp[n-1][m-1][1])

print(result == 9999999 ? -1 : result)
