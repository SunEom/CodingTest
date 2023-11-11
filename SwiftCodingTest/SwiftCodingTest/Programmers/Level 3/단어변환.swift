import Foundation

func diffCount(_ a: String, _ b: String) -> Int {
    let a = Array(a), b = Array(b)
    var result = 0
    for i in 0..<a.count {
        if a[i] != b[i] {
            result += 1
        }
    }
    return result
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    
    var queue = [(begin, 0)]
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        let word = p.0, cnt = p.1
        if word == target {
            return cnt
        }
        
        for i in 0..<visited.count {
            if !visited[i] && diffCount(word, words[i]) == 1 {
                visited[i] = true
                queue.append((words[i], cnt+1))
            }
        }
    }
    
    return 0
    
}
