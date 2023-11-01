import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict = [Int: Int]()
    var remain = k
    var result = 0
    for t in tangerine {
        if dict[t] == nil {
            dict[t] = 1
        } else {
            dict[t]! += 1
        }
    }
    
    for i in dict.keys.sorted { dict[$0]! > dict[$1]! } {
        if remain > 0 {
            result += 1
            remain -= dict[i]!
        } else {
            break
        }
    }
    
    return result
}
