import Foundation

let n = Int(readLine()!)!
var arr = [[Character]]()

for _ in 0..<n {
    let t = Array(readLine()!)
    arr.append(t)
}
 
var barr = Set<[Int]>()
var earr = Set<[Int]>()

for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == "B" {
            barr.insert([i,j])
        } else if arr[i][j] == "E" {
            earr.insert([i, j])
        }
    }
}


func checkSpin(_ centerPoint: [Int]) -> Bool {
    let directions = [[-1, -1],[-1,0],[-1, 1],[0,-1],[0,1],[1, -1],[1,0],[1,1]]
    let cr = centerPoint[0], cc = centerPoint[1]
    
    for d in directions {
        let pr = cr + d[0], pc = cc + d[1]
        if (0..<n).contains(pr) && (0..<n).contains(pc) {
            if arr[pr][pc] == "1" {
                return false
            }
        } else {
            return false
        }
    }
    
    return true
}

var visited = [Set<[Int]>: Bool]()
visited[barr] = true


var result = 0
var queue = [(barr, 0)]
var idx = 0

while queue.count > idx {
    let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    let p = Array(queue[idx].0)
    let dist = queue[idx].1
    
    if queue[idx].0.intersection(earr).count == 3 {
        result = dist
        break
    }
    
    for d in directions {
        let tr1 = p[0][0] + d[0], tc1 = p[0][1] + d[1]
        let tr2 = p[1][0] + d[0], tc2 = p[1][1] + d[1]
        let tr3 = p[2][0] + d[0], tc3 = p[2][1] + d[1]
        
        if (0..<n).contains(tr1) && (0..<n).contains(tr2) && (0..<n).contains(tr3) && (0..<n).contains(tc1) && (0..<n).contains(tc2) && (0..<n).contains(tc3) && arr[tr1][tc1] != "1" && arr[tr2][tc2] != "1" && arr[tr3][tc3] != "1"{
            
            let t = Set([[tr1, tc1], [tr2, tc2], [tr3, tc3]])
            if visited[t] == nil {
                visited[t] = true
                queue.append((t, dist + 1))
            }
            
        }
    }
    
    let centerPoint = [(p[0][0]+p[1][0]+p[2][0])/3, (p[0][1]+p[1][1]+p[2][1])/3]
    
    if checkSpin(centerPoint) {
        if p[0][0] == p[1][0] {
            let tarr = [centerPoint, [centerPoint[0]-1, centerPoint[1]], [centerPoint[0]+1, centerPoint[1]]]
            let s = Set(tarr)
            if visited[s] == nil {
                visited[s] = true
                queue.append((s, dist+1))
            }
        } else {
            let tarr = [centerPoint, [centerPoint[0], centerPoint[1]-1], [centerPoint[0], centerPoint[1]+1]]
            let s = Set(tarr)
            if visited[s] == nil {
                visited[s] = true
                queue.append((s, dist+1))
            }
        }
    }
    
    idx += 1
}

print(result)
