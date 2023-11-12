import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var minTime: Int64 = 1
    var maxTime: Int64 = Int64(times.max()!) * Int64(n)
    var result: Int64 = 0
    
    while minTime <= maxTime {
        var avgTime:Int64 = (maxTime+minTime)/2
        var cnt:Int64 = 0
        
        for t in times {
            cnt += avgTime/Int64(t)
        }
        
        if cnt < n {
            minTime = avgTime + 1
        } else {
            maxTime = avgTime - 1
            result = avgTime
        }
        
    }
    return result
}
