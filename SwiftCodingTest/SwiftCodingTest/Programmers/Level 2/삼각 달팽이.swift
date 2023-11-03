import Foundation

func solution(_ n:Int) -> [Int] {
    
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    var result = [Int]()
    var nowPos = [-1,0]
    var direction = [[1,0],[0,1],[-1,-1]]
    var dIdx = 0
    var num = 1
    for i in stride(from:n, to:0, by: -1) {
        for _ in 0..<i {
            nowPos = [nowPos[0] + direction[dIdx][0], nowPos[1] + direction[dIdx][1]]
            let nr = nowPos[0], nc = nowPos[1]
            arr[nr][nc] = num
            num += 1
        }
        dIdx += 1
        dIdx %= 3
    }
    
    for i in 0..<n {
        for j in 0...i {
            result.append(arr[i][j])
        }
    }
    
    return result
}
