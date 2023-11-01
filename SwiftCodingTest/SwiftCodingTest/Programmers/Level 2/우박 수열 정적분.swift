import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var arr = [k]
    var result = [Double]()
    while arr.last! != 1 {
        
        if arr.last! % 2 == 0 {
            arr.append(arr.last!/2)
        } else {
            arr.append(arr.last!*3+1)
        }
        
    }
    var dp = [Double]()
    
    for i in 0..<arr.count - 1 {
        dp.append(Double(arr[i] + arr[i+1])/2.0)
    }
    
    for range in ranges {
        let l = range[0], r = arr.count + range[1] - 1
        var s = 0.0
        if l <= r {
            for n in dp[l..<r] {
                s += n
            }
            result.append(s)
        } else {
            result.append(-1)
        }
        
    }

    
    print(arr)
    print(dp)
    return result
}
