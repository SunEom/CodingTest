import Foundation
let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (rc[0], rc[1])
var arr = [[Character]]()
let directions = [[1,0],[0,1],[-1,0],[0,-1]]
var queue = [[Int]]()

for i in 0..<r {
    let temp = Array(readLine()!)
    arr.append(temp)
    for j in 0..<c {
        if temp[j] == "J" {
            queue.append([i, j, 0, 1])
        } else if temp[j] == "F" {
            queue.append([i, j, 1, 1])
        }
    }
}

queue.sort { $0[2] > $1[2] }

func solve() {
    var idx = 0

    while queue.count > idx {
        let p = queue[idx]
        idx += 1
        let (pr, pc, pt, pd) = (p[0], p[1], p[2], p[3])

        if pt == 0 && (pr == r-1 || pc == c-1 || pr == 0 || pc == 0) {
            print(pd)
            return
        }
        
        for d in directions {
            let (tr, tc) = (pr+d[0], pc+d[1])
        
            if 0..<r ~= tr && 0..<c ~= tc {
                if pt == 0 {
                    if arr[tr][tc] == "." {
                        queue.append([tr, tc, pt, pd+1])
                        arr[tr][tc] = "J"
                    }
                } else if pt == 1 {
                    if arr[tr][tc] != "#" && arr[tr][tc] != "F" {
                        queue.append([tr, tc, pt, pd+1])
                        arr[tr][tc] = "F"
                    }
                }
            }
        }
    }

    print("IMPOSSIBLE")
}

solve()
