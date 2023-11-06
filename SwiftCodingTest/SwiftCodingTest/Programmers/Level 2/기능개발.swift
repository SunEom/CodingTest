import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result = [Int]()
    var queue = [Int]()
    
    for i in 0..<speeds.count {
        queue.append(Int(ceil(Double(100-progresses[i])/Double(speeds[i]))))
    }
    
    var now = -1
    var cnt = 0
    for i in 0..<queue.count {
        if now == -1 {
            now = queue[i]
            cnt = 1
            continue
        }
        
        if now >= queue[i] {
            cnt += 1
        } else {
            result.append(cnt)
            cnt = 1
            now = queue[i]
        }
    }
    result.append(cnt)
    
    return result
}
