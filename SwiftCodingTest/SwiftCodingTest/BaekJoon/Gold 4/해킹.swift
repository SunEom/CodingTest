import Foundation

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let ndc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, d, c) = (ndc[0], ndc[1], ndc[2])
    var adjList = Array(repeating: [[Int]](), count: n+1)
    
    for _ in 0..<d {
        let t = readLine()!.split(separator: " ").map { Int(String($0))! }
        adjList[t[1]].append([t[0], t[2]])
    }
    
    bfs()
    func bfs() {
        var hacked = Array(repeating: Int.max, count: n+1)
        hacked[c] = 0
        var queue = [[c, 0]]

        while queue.count > 0 {
            let p = queue.removeFirst()
            
            for list in adjList[p[0]] {
                if hacked[list[0]] > p[1] + list[1] {
                    hacked[list[0]] = p[1] + list[1]
                    queue.append([list[0], p[1] + list[1]])
                }
            }
        }
        
        var cnt = 0
        var time = 0
        
        for h in hacked {
            if h != Int.max {
                cnt += 1
                time = max(time, h)
            }
        }
        
        result += "\(cnt) \(time)\n"
    }
}

print(result)
