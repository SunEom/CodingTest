import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var win = Array(repeating: [Int](), count: n+1)
    var lose = Array(repeating: [Int](), count: n+1)
    
    
    for result in results {
        win[result[0]].append(result[1])
        lose[result[1]].append(result[0])
    }
    
    func getHighRanker(_ s:Int) -> Int {
        var visited = Array(repeating: false, count: n+1)
        visited[s] = true
        var cnt = 0
        var queue = [s]
        
        while queue.count > 0 {
            let p = queue.removeFirst()
            
            for v in lose[p] {
                if visited[v] == false {
                    cnt += 1
                    visited[v] = true
                    queue.append(v)
                }
            }
        }
        return cnt
    }
    
    func getLowerRanker(_ s:Int) -> Int {
        var visited = Array(repeating: false, count: n+1)
        visited[s] = true
        var cnt = 0
        var queue = [s]
        
        while queue.count > 0 {
            let p = queue.removeFirst()
            
            for v in win[p] {
                if visited[v] == false {
                    cnt += 1
                    visited[v] = true
                    queue.append(v)
                }
            }
        }
        return cnt
    }
    
    var result = 0
    
    for i in 1...n {
        if getLowerRanker(i) + getHighRanker(i) == n-1 {
            result += 1
        }
    }
    
    return result
}

