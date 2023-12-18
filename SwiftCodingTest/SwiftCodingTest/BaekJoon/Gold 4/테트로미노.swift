import Foundation

let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (nm[0], nm[1])
var arr = [[Int]]()
var result = 0
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func dfs(_ cnt: Int, _ s: Int, _ sr: Int, _ sc: Int){
    let directions = [[1,0],[0,1],[-1,0],[0,-1]]
    
    if cnt == 4 {
        result = max(result, s)
        return
    }
    
    for d in directions {
        let (dr, dc) = (sr+d[0], sc+d[1])
        
        if 0..<n ~= dr && 0..<m ~= dc && !visited[dr][dc] {
            visited[dr][dc] = true
            dfs(cnt+1, s + arr[dr][dc], dr, dc)
            visited[dr][dc] = false
        }
    }
}

func check(_ r: Int, _ c: Int) {
    let lists = [
        [[0,0],[0,1],[0,2],[1,1]],
        [[0,0],[1,0],[2,0],[1,1]],
        [[0,0],[0,1],[0,2],[-1,1]],
        [[0,0],[0,1],[-1,1],[1,1]]
    ]
    
    for list in lists {
        var sum = 0
        var available = true
        for d in list {
            let (tr, tc) = (r+d[0], c+d[1])
            if (0..<n) ~= tr && (0..<m) ~= tc {
                sum += arr[tr][tc]
            } else {
                available = false
                break
            }
        }
        
        if available {
            result = max(result, sum)
        }
    }
    
}

for i in 0..<n {
    for j in 0..<m {
        visited[i][j] = true
        dfs(1, arr[i][j], i ,j)
        visited[i][j] = false
        
        check(i, j)
    }
}

print(result)
