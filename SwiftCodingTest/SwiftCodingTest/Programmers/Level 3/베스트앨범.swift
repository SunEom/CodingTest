import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var totalDict = [String: Int]()
    var songDict = [String: [[Int]]]()
    var result = [Int]()
    for i in 0..<genres.count {
        if totalDict[genres[i]] == nil {
            totalDict[genres[i]] = plays[i]
        } else {
            totalDict[genres[i]]! += plays[i]
        }
        
        if songDict[genres[i]] == nil {
            songDict[genres[i]] = [[i, plays[i]]]
        } else {
            songDict[genres[i]]!.append([i, plays[i]])
        }
    }
    
    for key in songDict.keys.sorted { totalDict[$0]! > totalDict[$1]! } {
        let t = songDict[key]!.sorted() { $0[1] > $1[1] }[0..<min(2, songDict[key]!.count)]
        result += t.map { $0[0] }
    }
    
    return result
}
