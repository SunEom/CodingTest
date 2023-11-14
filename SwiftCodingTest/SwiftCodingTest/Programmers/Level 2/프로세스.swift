import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities.enumerated().map { ($0, $1) }
    var dict = [Int: Int]()
    for item in queue {
        if dict[item.1] == nil {
            dict[item.1] = 1
        } else {
            dict[item.1]! += 1
        }
    }
    var maxP = dict.keys.max()!
    var cnt = 1
    
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        
        if p.1 == maxP {
            dict[maxP]! -= 1
            
            if p.0 == location {
                return cnt
            }
            
            if dict[maxP]! == 0 {
                dict[maxP] = nil
                maxP = dict.keys.max()!
            }
            cnt += 1
        } else {
            queue.append(p)
        }
    }
    
    return 0
}
