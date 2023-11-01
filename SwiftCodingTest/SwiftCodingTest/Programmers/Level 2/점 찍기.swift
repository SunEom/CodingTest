import Foundation

func getDistance(_ a: Int, _ b: Int) -> Double {
    return sqrt(Double(a*a+b*b))
}

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0
    for x in stride(from:0, through:d, by: k) {
        let y = Int(sqrt(Double(d*d-x*x)))
        result += Int64(y / k + 1)
    }
    return result
}
