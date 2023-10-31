import Foundation

func transToMin(_ time: String) -> Int {
    let t = time.split(separator:":").map { Int($0)! }
    return t[0]*60 + t[1]
}

func solution(_ plans:[[String]]) -> [String] {
    var works = plans.sorted { $0[1] < $1[1] }
    var now = 0
    var stack = [(String, Int)]()
    var result = [String]()
    
    for i in 1..<works.count {
        let prevStart = transToMin(works[i-1][1])
        let prevLen = Int(works[i-1][2])!
        now = transToMin(works[i][1])
        
        if prevStart + prevLen > now {
            stack.append((works[i-1][0], (prevStart + prevLen) - now))
        } else if prevStart + prevLen == now {
            result.append(works[i-1][0])
        } else {
            result.append(works[i-1][0])
            var remain = now - (prevStart + prevLen)
            while remain > 0 && stack.count > 0 {
                let pop = stack.removeLast()
                if pop.1 < remain {
                    remain -= pop.1
                    result.append(pop.0)
                } else if pop.1 == remain {
                    result.append(pop.0)
                    break
                }else {
                    stack.append((pop.0, pop.1-remain))
                    break
                }
            }
        }
    }
    
    result.append(works.last![0])

    while stack.count != 0 {
        result.append(stack.removeLast().0)
    }

    return result
}
