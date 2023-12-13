import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()
var result = Int.max

for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    arr.append([temp[0]*100+temp[1], temp[2]*100+temp[3]])
}

arr.sort {
    if $0[0] != $1[0] {
        return $0[0] < $1[0]
    }
    
    if $0[1] != $1[1] {
        return $0[1] < $1[1]
    }
    
    return true
}

func solve(_ last: Int, _ cnt: Int, _ prev: Int) {
    if last > 1130 {
        result = min(result, cnt)
        return
    }
    
    var maxLast = -1
    for i in prev..<n {
        if arr[i][0] > last {
            break
        }
        maxLast = max(maxLast, arr[i][1])
    }
    
    if maxLast == -1 {
        result = 0
        return
    } else {
        solve(maxLast, cnt+1, prev+1)
    }
    
    
}

solve(301, 0, 0)

print(result)
