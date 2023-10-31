import Foundation

func solution(_ board:[String]) -> Int {
    let arr = board.map { Array($0).map { String($0) } }
    var start = [0,0]
    let r = arr.count, c = arr[0].count
    let directions = [[1,0], [0,1], [-1, 0], [0,-1]]
    var visited = Array(repeating: Array(repeating: false, count:c), count: r)
    
    for i in 0..<r {
        for j in 0..<c {
            if arr[i][j] == "R" {
                start = [i, j]
            }
        }
    }
    
    var queue = [[start[0], start[1], 0]]
    
    var idx = 0
    
    while queue.count > idx {
        let p = queue[idx]
        let pr = p[0], pc = p[1], cnt = p[2]
        
        for d in directions {
            var tr = pr + d[0] , tc = pc + d[1]
            if !((0..<r).contains(tr) && (0..<c).contains(tc) && arr[tr][tc] != "D") {
                continue
            }
            
            while (0..<r).contains(tr) && (0..<c).contains(tc) && arr[tr][tc] != "D" {
                tr += d[0]
                tc += d[1]
            }

            let lr = tr-d[0], lc = tc-d[1]
            
            if arr[lr][lc] == "G" {
                return cnt + 1
            } else if !visited[lr][lc] {
                queue.append([lr, lc, cnt+1])
                visited[lr][lc] = true
            }
        }
        
        idx += 1
    }
    
    return -1
}
