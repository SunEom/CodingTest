import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(), b = b.sorted()
    var result = 0
    
    var i = 0, j = 0
    
    while i < a.count && j < b.count {
        while j < b.count && a[i] >= b[j] {
            j += 1
        }
        
        if j == b.count {
            break
        }
        
        result += 1
        
        j += 1
        i += 1
        
    }
    
    return result
}
