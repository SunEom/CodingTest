import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var result = 0
    for i in 0..<n {
        if !visited[i] {
            result += 1
            var queue = [i]
            visited[i] = true
            
            while queue.count > 0 {
                let p = queue.removeFirst()
                
                for k in 0..<n {
                    if p == k {
                        continue
                    }
                    
                    if computers[p][k] == 1 && !visited[k] {
                        queue.append(k)
                        visited[k] = true
                    }
                }
            }
        }
    }
    return result
}
