import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = mn[0], n = mn[1]
let pov = [1:[0,1], 2: [0,-1], 3: [1,0], 4: [-1,0]]
var arr = [[Int]]()
var dp = Array(repeating: Array(repeating: Array(repeating: Int.max, count:5), count: n), count: m)

func turnRight(_ d: Int) -> Int {
    if d == 1 {
        return 3
    } else if d == 2 {
        return 4
    } else if d == 3 {
        return 2
    } else  {
        return 1
    }
}

func turnLeft(_ d: Int) -> Int {
    if d == 1 {
        return 4
    } else if d == 2 {
        return 3
    } else if d == 3 {
        return 1
    } else  {
        return 2
    }
}

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(temp)
}

var now = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
now[2] += 1

var target = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
target[2] += 1

dp[now[0]][now[1]][now[2]] = 0

var queue = [[now[0], now[1], now[2], 0]]
var idx = 0

while queue.count > idx {
    let p = queue[idx]
    let pr = p[0], pc = p[1], pd = p[2], dist = p[3]
    
    for i in 1...3 {
        let dr = pov[pd]![0]*i, dc = pov[pd]![1]*i
        let tr = pr + dr, tc = pc + dc
        if (0..<m).contains(tr) && (0..<n).contains(tc) && arr[tr][tc] == 0 {
            if dp[tr][tc][pd] > dist + 1 {
                dp[tr][tc][pd] = dist + 1
                queue.append([tr, tc, pd, dist+1])
            }
        } else { break }
    }
    
    let right = turnRight(pd)
    if dp[pr][pc][right] > dist + 1 {
        dp[pr][pc][right] = dist + 1
        queue.append([pr, pc, right, dist+1])
    }

    
    let left = turnLeft(pd)
    if dp[pr][pc][left] > dist + 1 {
        dp[pr][pc][left] = dist + 1
        queue.append([pr, pc, left, dist+1])
    }

    idx += 1
}
print(dp[target[0]][target[1]][target[2]])

