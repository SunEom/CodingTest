import Foundation

func solution(_ maps:[String]) -> Int {
    let r = maps.count, c = maps[0].count
    var S = [0,0], L = [0,0], E = [0,0]
    
    let maps = maps.map { Array($0).map{String($0)} }
    
    for i in (0..<r) {
        for j in (0..<c) {
            if maps[i][j] == "L" {
                L = [i, j]
            } else if maps[i][j] == "E" {
                E = [i, j]
            } else if maps[i][j] == "S" {
                S = [i, j]
            }
        }
    }
    
    let first = bfs(maps, S, L)
    let second = bfs(maps, L, E)
    
    if first == -1 || second == -1 {
        return -1
    } else {
        return first + second
    }
}

func bfs(_ maps: [[String]], _ start:[Int],_ target:[Int]) -> Int {
    let r = maps.count, c = maps[0].count
    var visited = Array(repeating: Array(repeating:false, count: c), count: r)
    let directions = [[1,0], [0,1], [-1, 0], [0, -1]]
    
    visited[start[0]][start[1]] = true
    var queue = [[start[0], start[1], 0]]
    var idx = 0
    while idx < queue.count {
        let p = queue[idx]
        let pr = p[0], pc = p[1], cnt = p[2]
        
        for d in directions {
            let tr = pr + d[0], tc = pc + d[1]
            
            if (0..<r).contains(tr) && (0..<c).contains(tc) && maps[tr][tc] != "X" && !visited[tr][tc] {
                if tr == target[0] && tc == target[1] {
                    return cnt + 1
                } else {
                    visited[tr][tc] = true
                    queue.append([tr, tc, cnt+1])
                }
            }
        }
        idx += 1
    }
    
    return -1
}
