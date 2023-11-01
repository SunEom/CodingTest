import Foundation

func solution(_ topping:[Int]) -> Int {
    var t1 = [Int: Int](), t2 = [Int: Int]()
    var c1 = 0, c2 = 0
    var r = 1
    var result = 0
    if topping.count == 1 {
        return 0
    } else {
        t1[topping[0]] = 1
        c1 = 1
        
        for i in 1..<topping.count {
            if t2[topping[i]] == nil {
                t2[topping[i]] = 1
                c2 += 1
            } else {
                t2[topping[i]]! += 1
            }
        }
        
        
        while r < topping.count {
         
            if c1 == c2 {
                result += 1
            }
            
            if t1[topping[r]] == nil || t1[topping[r]] == 0 {
                t1[topping[r]] = 1
                c1 += 1
            }
            
            t2[topping[r]]! -= 1
            
            if t2[topping[r]]! == 0 {
                c2 -= 1
            }
            
            r += 1
            
        }
    }
    
    return result
}
