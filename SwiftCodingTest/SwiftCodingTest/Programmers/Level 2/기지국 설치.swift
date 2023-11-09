import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0

    if stations[0] - w - 1 > 0 {
        answer += Int(ceil(Double(stations[0] - w - 1)/Double(2*w+1)))
    }
    
    for i in 1..<stations.count {
        let dis = Double(stations[i]-stations[i-1]-2*w-1)
        if dis > 0 {
            answer += Int(ceil(dis/Double(2*w+1)))
        }
    }
    
    if n - stations.last! - w > 0 {
        answer += Int(ceil(Double(n - stations.last! - w)/Double(2*w+1)))
    }

    return answer
}
