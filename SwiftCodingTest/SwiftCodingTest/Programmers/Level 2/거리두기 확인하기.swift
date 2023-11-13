import Foundation

func solution(_ places:[[String]]) -> [Int] {
    let directions = [[0, 1], [1, 0],[0, -1], [-1, 0]]
    var answer = [Int]()

    for place in places {
        let parr = place.map { Array($0).map { String($0) }}
        var result = 1
        for i in 0..<5 {
            for j in 0..<5 {
                if result == 0 { break }
                if parr[i][j] == "P" {
                    
                    var queue = [(i, j, 0, false)]
                    var visited = Array(repeating: Array(repeating:false, count: 5), count: 5)
                    visited[i][j] = true
                    while queue.count > 0 {
                        let p = queue.removeFirst()
                        let dist = p.2
                            
                        if dist == 2 {
                            if parr[p.0][p.1] == "P" {
                                if p.3 == true {
                                    result = 0
                                    break
                                }
                            }
                            continue
                        }
                        
                        for d in directions {
                            let tr = p.0 + d[0], tc = p.1 + d[1]
                            if (0..<5).contains(tr) && (0..<5).contains(tc) && !visited[tr][tc] {
                                if parr[tr][tc] == "X" {
                                    visited[tr][tc] = true
                                    queue.append((tr, tc, dist + 1, false))
                                } else if parr[tr][tc] == "O" {
                                    visited[tr][tc] = true
                                    queue.append((tr, tc, dist + 1, true))
                                } else {
                                    if dist == 0 {
                                        result = 0
                                        break
                                    } else {
                                        queue.append((tr, tc, dist+1, p.3))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        answer.append(result)
    }
    
    
    
    return answer
}
