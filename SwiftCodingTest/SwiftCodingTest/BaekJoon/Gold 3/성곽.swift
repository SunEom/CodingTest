import Foundation

let wall = [0:[[Int]](), 1:[[0,-1]], 2:[[-1,0]], 3: [[0, -1],[-1,0]], 4:[[0, 1]], 5:[[0,-1], [0,1]],
            6: [[-1,0], [0,1]], 7: [[0,-1],[-1,0],[0,1]], 8:[[1,0]], 9 :[[1,0], [0,-1]],
           10: [[1,0],[-1,0]], 11: [[0,-1],[-1,0],[1,0]], 12:[[0,1],[1,0]], 13: [[1,0],[0,-1],[0,1]],
           14: [[-1,0],[0,1],[1,0]], 15: [[1,0],[0,1],[-1,0],[0,-1]]]


let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var visited = Array(repeating: Array(repeating: -1, count: n), count:m)
var arr = [[Int]]()
var idx = 0
var size = [Int]()
var result = 0

for _ in 0..<m {
    arr.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

func bfs(_ sr: Int, _ sc: Int) {
    let directions = [[1,0],[0,1],[-1,0],[0,-1]]
    var queue = [[sr, sc]]
    var s = 1
    visited[sr][sc] = idx
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        let pr = p[0], pc = p[1], pw = wall[arr[pr][pc]]!
        
        for d in directions {
            if pw.contains(d) { continue }
            let tr = pr + d[0], tc = pc + d[1]
            if (0..<m).contains(tr) && (0..<n).contains(tc) && visited[tr][tc] == -1 {
                queue.append([tr, tc])
                visited[tr][tc] = idx
                s += 1
            }
        }
    }
    
    size.append(s)
    idx += 1
}

func adjacent() {
    for i in 0..<m {
        for j in 0..<n {
            if (0..<m).contains(i+1){
                if visited[i][j] != visited[i+1][j] {
                    result = max(result, size[visited[i][j]] + size[visited[i+1][j]])
                }
            }
                
            if (0..<n).contains(j+1) {
                if visited[i][j] != visited[i][j+1] {
                    result = max(result, size[visited[i][j]] + size[visited[i][j+1]])
                }
            }
        }
    }
}

for i in 0..<m {
    for j in 0..<n {
        if visited[i][j] == -1 {
            bfs(i, j)
        }
    }
}

adjacent()

print(idx)
print(size.max()!)
print(result)



