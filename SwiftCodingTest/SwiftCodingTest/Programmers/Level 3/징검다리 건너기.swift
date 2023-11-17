import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var s = 0, e = stones.max()!
    var result = 0
    while s <= e {
        let mid = (s+e)/2
        
        var skip = 0
        var available = true
        
        for stone in stones {
            if stone - mid >= 0 { skip = 0 }
            else {
                skip += 1
                
                if skip >= k {
                    available = false
                    break
                }
            }
        }
        
        if available {
            result = mid
            s = mid+1
        } else {
            e = mid-1
        }
    }
    
    return result
}
