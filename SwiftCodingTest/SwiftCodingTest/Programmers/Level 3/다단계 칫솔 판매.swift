import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parent = [String: String]()
    var sell = [String:Int]()
    var total = [String: Int]()
    
    for i in 0..<seller.count {
        sell[seller[i]] = amount[i]
    }
    
    for i in 0..<enroll.count {
        parent[enroll[i]] = referral[i]
        total[enroll[i]] = 0
    }
    
    for i in 0..<seller.count {
        var s = seller[i], value = amount[i]*100
        var p = parent[s]
        
        while p != nil && value > 0 {
            let pValue = Int(value/10)
            let mValue = value - pValue
            
            total[s]! += mValue
            value = pValue
            s = p!
            p = parent[s]
        }

    }
    
    return enroll.map { total[$0]! }
}
