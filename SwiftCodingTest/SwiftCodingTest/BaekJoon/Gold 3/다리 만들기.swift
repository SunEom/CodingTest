

let n = Int(readLine()!)!
var arr = [[Int]]()
var result = 999999

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(t)
}

var island = arr

var islandNum = 2

func islandNumCheck(_ sr: Int, _ sc: Int, _ num: Int) {
    island[sr][sc] = num
    let directions = [[1,0],[0,1],[-1,0],[0,-1]]
    var queue = [[sr, sc]]
    var idx = 0
    while queue.count > idx {
        let p = queue[idx]
        let pr = p[0], pc = p[1]
        
        for d in directions {
            let dr = pr + d[0], dc = pc + d[1]
            if (0..<n).contains(dr) && (0..<n).contains(dc) && island[dr][dc] == 1 {
                island[dr][dc] = num
                queue.append([dr, dc])
            }
        }
        idx += 1
    }
}

for i in 0..<n {
    for j in 0..<n {
        if island[i][j] == 1 {
            islandNumCheck(i, j, islandNum)
            islandNum += 1
        }
    }
}

func bfs(_ sr: Int, _ sc: Int) {
    var start = island[sr][sc]
    var distance = Array(repeating: Array(repeating: 999999, count: n+1), count: n+1)
    let directions = [[1,0],[0,1],[-1,0],[0,-1]]
    
    distance[sr][sc] = 0
    
    var idx = 0
    var queue = [[sr, sc, 0]]
    
    while queue.count > idx {
        let p = queue[idx]
        let pr = p[0], pc = p[1], dist = p[2]
        
        if dist > result {
            idx += 1
            continue
        }
        
        for d in directions {
            let dr = pr + d[0], dc = pc + d[1]
            if (0..<n).contains(dr) && (0..<n).contains(dc) {
                if island[dr][dc] == start && distance[dr][dc] == 999999 {
                    distance[dr][dc] = 0
                    queue.append([dr, dc, 0])
                } else if island[dr][dc] == 0 && distance[dr][dc] > dist + 1 {
                    distance[dr][dc] = dist + 1
                    queue.append([dr, dc, dist+1])
                } else if island[dr][dc] != start && island[dr][dc] != 0 {
                    result = min(result, dist)
                }
            }
        }
        
        idx += 1
    }
}

var visited = Array(repeating: false, count: islandNum)

for i in 0..<n {
    for j in 0..<n {
        if island[i][j] != 0 && !visited[island[i][j]] {
            bfs(i, j)
            visited[island[i][j]] = true
        }
    }
}

print(result)
