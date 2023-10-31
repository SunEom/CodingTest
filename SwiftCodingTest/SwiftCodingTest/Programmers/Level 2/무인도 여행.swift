import Foundation

var visited: [[Bool]]!

func solution(_ maps:[String]) -> [Int] {
    let r = maps.count, c = maps[0].count
    var result = [Int]()
    
    visited = Array(repeating: Array(repeating:false, count:c), count: r )
    
    let maps = maps.map { Array($0).map { String($0) } }
    
    for i in 0..<r {
        for j in 0..<c {
            if maps[i][j] != "X" && !visited[i][j] {
                result.append(bfs(r, c, i, j, maps))
            }
        }
    }
    
    result.sort()
    
    if result.count == 0 {
        result.append(-1)
    }
    
    return result
}

func bfs(_ r: Int, _ c: Int, _ sr: Int,_ sc: Int, _ maps: [[String]]) -> Int {
    visited[sr][sc] = true
    var cnt = Int(maps[sr][sc])!
    var queue = [[sr, sc]]
    let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    
    var idx = 0
    while idx < queue.count {
        let p = queue[idx]
        let pr = p[0], pc = p[1]
        
        for d in directions {
            let tr = pr + d[0], tc = pc + d[1]
            
            if (0..<r).contains(tr) && (0..<c).contains(tc) && !visited[tr][tc] && maps[tr][tc] != "X" {
                visited[tr][tc] = true
                cnt += Int(maps[tr][tc])!
                queue.append([tr, tc])
            }
        }
        idx += 1
    }
    return cnt
}
