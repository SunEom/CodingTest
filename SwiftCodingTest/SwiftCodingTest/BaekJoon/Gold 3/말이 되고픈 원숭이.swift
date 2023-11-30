import Foundation

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
let w = wh[0], h = wh[1]
var arr = [[Int]]()

for _ in 0..<h {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func bfs() -> Int {
    var memo = Array(repeating: Array(repeating: Array(repeating: 999999, count: w), count: h), count: k+1)
    var result = -1
    
    var queue = [[0,0,0,k]]
    let direction = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    let direction2 = [[2, 1], [1, 2], [-1, 2], [-2, 1], [1, -2],[2, -1], [-1, -2], [-2, -1]]
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        let pr = p[0], pc = p[1], cnt = p[2], remainK = p[3]
        
        if pr == h-1 && pc == w-1 {
            result = cnt
            break
        }
        
        if remainK > 0 {
            for d in direction2 {
                let dr = d[0], dc = d[1]
                let tr = dr + pr, tc = dc + pc
            
                if (0..<w).contains(tc) && (0..<h).contains(tr) && arr[tr][tc] == 0 && memo[remainK-1][tr][tc] > cnt + 1 {
                    memo[remainK-1][tr][tc] = cnt + 1
                    queue.append([tr, tc, cnt+1, remainK - 1])
                }
            }
        }
        
        for d in direction {
            let dr = d[0], dc = d[1]
            let tr = dr + pr, tc = dc + pc
            
            if (0..<w).contains(tc) && (0..<h).contains(tr) && arr[tr][tc] == 0 && memo[remainK][tr][tc] > cnt + 1 {
                memo[remainK][tr][tc] = cnt + 1
                queue.append([tr, tc, cnt+1, remainK])
            }
        }
        

    }
    
    return result
}

print(bfs())
