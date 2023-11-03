import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    
    for i in 1..<w {
        let t = Int64(floor(Double(h*i)/Double(w)))
        answer += t
    }
    
    answer *= 2

    return answer
}
