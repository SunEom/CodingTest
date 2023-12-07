import Foundation

var arr = [[Int]]()

for _ in 0..<3 {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(t)
}
let targetArr = [[1,2,3],[4,5,6],[7,8,0]]

if arr == targetArr {
    print(0)
} else {
    var target = [0,0]

    for i in 0..<3 {
        for j in 0..<3 {
            if arr[i][j] == 0 {
                target = [i, j]
            }
        }
    }
    var result = -1

    let directions = [[1,0], [0, 1], [-1, 0], [0, -1]]

    var visited = [[[Int]]: Bool]()
    var queue = [(arr, target[0], target[1], 0)]
    var idx = 0
    while queue.count > idx {
        let p = queue[idx]
        let tarr = p.0, pr = p.1, pc = p.2, dist = p.3
        if tarr == targetArr {
           result = dist
        }
        
        for d in directions {
            let tr = pr + d[0], tc = pc + d[1]
            
            if (0..<3).contains(tr) && (0..<3).contains(tc) {
                var t = tarr
                let temp = tarr[pr][pc]
                t[pr][pc] = t[tr][tc]
                t[tr][tc] = temp
                if visited[t] == nil {
                    visited[t] = true
                    queue.append((t, tr, tc, dist+1))
                }
            }
        }
        idx += 1
    }

    print(result)

}

