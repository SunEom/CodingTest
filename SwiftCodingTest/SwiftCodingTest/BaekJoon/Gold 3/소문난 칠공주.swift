import Foundation

var arr = [[Character]]()
var visited = [Set<[Int]>: Bool]()
var result = 0
for _ in 0..<5 {
    arr.append(Array(readLine()!))
}

func bfs(_ s: Set<[Int]>) {
    if s.count == 7 {
        var scnt = 0
        for item in Array(s){
            if arr[item[0]][item[1]] == "S" {
                scnt += 1
            }
        }
        if scnt >= 4 {
            result += 1
        }
        return
    }
    
    let direction = [[1,0],[0,1],[-1,0],[0,-1]]
   
    for p in Array(s) {
        let pr = p[0], pc = p[1]
        for d in direction {
            let tr = pr + d[0], tc = pc + d[1]
            var ts = s
            if (0..<5).contains(tr) && (0..<5).contains(tc) && !ts.contains([tr,tc]) {
                ts.insert([tr,tc])
                if visited[ts] == nil {
                    visited[ts] = true
                    bfs(ts)
                }
            }
        }
    }

}

for i in 0..<5 {
    for j in 0..<5 {
        var s = Set<[Int]>()
        s.insert([i, j])
        bfs(s)
    }
}

print(result)
