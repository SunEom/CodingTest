import Foundation

var maxDiff = -1
var maxCase = [-1]
var num: Int!
func bt(_ idx: Int,_ remain:Int, _ diff: Int, _ arr: [Int], _ appeach: [Int]) {
    if idx == 11 {
        var arr = arr
        if remain != 0 {
            arr[10] = remain
        }
        
        if diff <= 0 {
            return
        }
        
        if diff > maxDiff {
            maxDiff = diff
            maxCase = arr
        } else if diff == maxDiff {
            for i in stride(from:10, through:0, by: -1) {
                if maxCase[i] == arr[i] {
                    continue
                } else if maxCase[i] < arr[i] {
                    maxCase = arr
                } else { break }
            }
        }
        
        return
    }
    
    if remain > appeach[idx] {
        var tarr = arr
        tarr[idx] = appeach[idx] + 1
        bt(idx + 1, remain - appeach[idx] - 1, diff + (10 - idx), tarr, appeach)
    }
    
    if appeach[idx] == 0 {
        bt(idx + 1, remain, diff, arr, appeach)
    } else {
        bt(idx + 1, remain, diff - (10 - idx), arr, appeach)
    }

}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    num = n
    bt(0, n, 0, Array(repeating:0, count:11), info)
    
    return maxCase
}
