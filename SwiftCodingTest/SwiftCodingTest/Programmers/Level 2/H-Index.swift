import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted()
    var result = 0
    let n = citations.count
    var h = 0
    for i in 0..<n {
        let citation = citations[i]
        let cnt = n - i
        while h+1 <= citation && h+1 <= cnt {
            h += 1
        }
    }
    return h
}
