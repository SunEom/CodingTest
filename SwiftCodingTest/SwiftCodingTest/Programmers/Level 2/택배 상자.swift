import Foundation

func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    
    var idx = 0
    
    for now in 1...order.count {
        stack.append(now)
        while stack.count != 0 && order[idx] == stack.last! {
            stack.removeLast()
            idx += 1
        }
        
    }
    
    return idx
}
