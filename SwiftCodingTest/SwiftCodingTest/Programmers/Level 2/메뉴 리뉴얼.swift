import Foundation

var visited = [Bool]()
var dict = [String: Int]()

func combination(_ str: String, _ idx: Int, _ order: [String]) {
    if str.count == order.count {
        if dict[str] == nil {
            dict[str] = 1
        } else {
            dict[str]! += 1
        }
        return
    }
    
    if str.count >= 2{
        if dict[str] == nil {
            dict[str] = 1
        } else {
            dict[str]! += 1
        }
    }
    
    
    for i in idx+1..<order.count {
        if visited[i] == false {
            visited[i] = true
            combination(str+order[i], i, order)
            visited[i] = false
        }
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    var maxLen = 0
    for order in orders {
        maxLen = max(maxLen, order.count)
        let o = Array(order).map { String($0) }.sorted()
        visited = Array(repeating: false, count: o.count)
        combination("", -1, o)
    }
    
    for l in course {
        var arr = dict.filter { $0.key.count == l && $0.value >= 2 }.sorted { $0.value > $1.value }
        for i in 0..<arr.count {
            if arr[i].value == arr[0].value {
                result.append(arr[i].key)
            } else {
                break
            }
        }
    }
    
    result.sort()

    return result
}
