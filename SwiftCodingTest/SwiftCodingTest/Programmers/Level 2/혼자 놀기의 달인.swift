import Foundation

func solution(_ cards:[Int]) -> Int {
    var list = [Int]()
    var visited = Array(repeating: false, count: cards.count)
    
    for i in 0..<visited.count {
        if visited[i] {
            continue
        }
        
        var s = i
        var temp = 0
        
        while visited[s] == false {
            temp += 1
            visited[s] = true
            s = cards[s] - 1
        }
        list.append(temp)
    }
    
    list.sort(by: >)
    
    return list.count > 1 ? list[0] * list[1] : 0
}
