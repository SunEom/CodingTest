import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var arr1 = [Int64](), arr2 = [Int64]()
    var result: Int64 = max(Int64(sequence[0]), Int64(-sequence[0]))
    for i in 0..<sequence.count {
        if i%2 == 0 {
            arr1.append(Int64(sequence[i]))
            arr2.append(Int64(-sequence[i]))
        } else {
            arr1.append(Int64(-sequence[i]))
            arr2.append(Int64(sequence[i]))
        }
    }
    
    var dp1 = arr1, dp2 = arr2
    
    for i in 1..<sequence.count {
        dp1[i] = max(dp1[i], dp1[i] + dp1[i-1])
        dp2[i] = max(dp2[i], dp2[i] + dp2[i-1])
        
        result = max(result, dp1[i], dp2[i])
    }
    
    return result
}
