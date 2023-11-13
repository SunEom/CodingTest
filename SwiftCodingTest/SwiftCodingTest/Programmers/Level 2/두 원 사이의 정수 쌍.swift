import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var result:Int64 = 0
    
    for i in 1...r1 {
        let height = Int64(floor(sqrt(Double(r2*r2) - Double(i*i))))
        let height2 = Int64(ceil(sqrt(Double(r1*r1) - Double(i*i))))
        result += height - height2 + 1
    }
    
    for i in r1+1...r2 {
        let height = Int64(floor(sqrt(Double(r2*r2) - Double(i*i))))
        result += height + 1
    }
    
    return result*4
}
