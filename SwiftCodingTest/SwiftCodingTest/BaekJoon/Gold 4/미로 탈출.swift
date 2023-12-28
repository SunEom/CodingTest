import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let hxhy = readLine()!.split(separator: " ").map { Int(String($0))! }
let exey = readLine()!.split(separator: " ").map { Int(String($0))! }

let (n, m) = (nm[0], nm[1])
let (hx, hy) = (hxhy[0]-1, hxhy[1]-1)
let (ex, ey) = (exey[0]-1, exey[1]-1)

var arr = [[Int]]()
let directions = [[1,0],[0,1],[-1,0],[0,-1]]
var visited = Array(repeating: Array(repeating: Array(repeating: false, count:2), count: m), count: n)
var result = -1

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var queue = [[hx, hy, 0, 0]]

while queue.count > 0 {
    let p = queue.removeFirst()

    
    let (px, py, pd, pc) = (p[0], p[1], p[2], p[3])
    
    if px == ex && py == ey {
        result = pd
        break
    }
    
    for d in directions {
        let (tr, tc) = (px + d[0], py + d[1])
        
        if 0..<n ~= tr && 0..<m ~= tc && visited[tr][tc][pc] == false {
            if arr[tr][tc] == 0 {
                visited[tr][tc][pc] = true
                queue.append([tr, tc, pd+1, pc])
            }
            
            if arr[tr][tc] == 1 {
                if pc == 0 {
                    visited[tr][tc][pc] = true
                    queue.append([tr, tc, pd+1, 1])
                }
            }
        }
    }
}
print(result)
