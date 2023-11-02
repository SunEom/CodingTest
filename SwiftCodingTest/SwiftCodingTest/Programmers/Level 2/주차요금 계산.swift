import Foundation

func transToMin(_ time: String) -> Int {
    let t = time.split(separator:":").map { Int(String($0))! }
    return t[0]*60 + t[1]
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result = [String: Int]()
    var dict = [String: Int]()
    let lastTime = 24*60-1
    var answer = [Int]()
    
    for record in records {
        let li = record.split(separator: " ").map { String($0) }
        let time = transToMin(li[0]), carNum = li[1], state = li[2]
        
        if state == "IN" {
            dict[carNum] = time
        } else {
            let inTime = dict[carNum]!
            let timeDiff = time - inTime
            
            if result[carNum] == nil {
                result[carNum] = timeDiff
            } else {
                result[carNum]! += timeDiff
            }
            
            dict[carNum] = nil
        }
    }
    
    for car in dict.keys {
        let inTime = dict[car]!
        let timeDiff = lastTime - inTime

        if result[car] == nil {
            result[car] = timeDiff
        } else {
            result[car]! += timeDiff
        }
    }
    
    for car in result.keys.sorted() {
        if result[car]! <= fees[0] {
            answer.append(fees[1])
        } else {
            let overTime = result[car]! - fees[0]
            let overFees = Int(ceil(Double(overTime)/Double(fees[2]))) * fees[3]
            let totalFees = fees[1] + overFees
            answer.append(totalFees)
        }
    }
    
    return answer
}
