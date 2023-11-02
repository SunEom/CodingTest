import Foundation

func solution(_ elements:[Int]) -> Int {
    let n = elements.count
    let elements = elements + elements
    var s = Set<Int>()
    for i in 1...n {
        for j in 0..<n {
            var temp = 0
            for k in j..<j+i {
                temp += elements[k]
            }
            s.insert(temp)
        }
    }
       
    return s.count
}
