import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var goal = [String:Int]()
    var result = 0
    
    for i in 0..<want.count {
        goal[want[i]] = number[i]
    }
    
    for i in 0...discount.count-10 {
        var temp = [String: Int]()
        var success = true
        for item in discount[i..<i+10] {
            if goal[item] == nil {
                success = false
                break
            }
            
            if temp[item] == nil {
                temp[item] = 1
            } else {
              temp[item]! += 1
            }
            
            if temp[item]! > goal[item]! {
                success = false
                break
            }
        }
        if success {
            result += 1
        }
    }
    return result
}
