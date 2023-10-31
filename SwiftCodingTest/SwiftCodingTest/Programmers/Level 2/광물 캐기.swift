import Foundation

var p: [Int]!
var m: [String]!
var tiredDict = [0:["diamond":1, "iron":1, "stone" : 1], 1:["diamond":5, "iron":1, "stone" : 1], 2:["diamond":25, "iron":5, "stone" : 1]]
var result = Int.max
func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    p = picks
    m = minerals
    
    bt(picks, 0, 0)
    
    return result
}

func bt(_ remain: [Int], _ nowIdx : Int, _ tired: Int) {
    if nowIdx > m.count || (remain[0] == 0 && remain[1] == 0 && remain[2] == 0 ){
        result = min(result, tired)
    } else {
        
        for i in 0..<3 {
            if remain[i] > 0 {
                var tremain = remain
                tremain[i] -= 1
                var tiredSum = 0
                
                for j in stride(from: nowIdx, to: min(m.count, nowIdx + 5), by: 1) {
                    tiredSum += tiredDict[i]![m[j]]!
                }
                
                bt(tremain, nowIdx + 5, tired + tiredSum)
            }
        }
    }
}
